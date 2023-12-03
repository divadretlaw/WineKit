//
//  WineProcess.swift
//  WineKit
//
//  Created by David Walter on 09.11.23.
//

import Foundation
import OSLog

/// A `Process` started by WineKit
public final class WineProcess: Identifiable, Hashable, Equatable, CustomStringConvertible {
    public let portableExecutable: PortableExecutable?
    public let standardOutput: Pipe
    public let standardError: Pipe
    
    private let process: Process
    
    init(wine: Wine, arguments: [String], environment: [String: String]?) {
        let process = Process()
        process.executableURL = wine.wine
        process.arguments = arguments
        process.currentDirectoryURL = wine.folder
        process.qualityOfService = .userInitiated
        
        process.environment = ["WINEPREFIX": wine.prefix.path]
            .merging(wine.environment) { _, new in
                new
            }
            .merging(environment) { _, new in
                new
            }
        
        if let first = arguments.first {
            let url = URL(filePath: first)
            self.portableExecutable = PortableExecutable(url: url)
        } else {
            self.portableExecutable = nil
        }
        
        let standardOutput = Pipe()
        self.standardOutput = standardOutput
        process.standardOutput = standardOutput
        
        let standardError = Pipe()
        self.standardError = standardError
        process.standardError = standardError
        
        self.process = process
    }
    
    /// The name of the process
    public var name: String {
        portableExecutable?.name ?? process.arguments?.first ?? process.processIdentifier.description
    }
    
    /// Runs the process with the current environment.
    public func run() -> AsyncStream<WineOutput> {
        return AsyncStream<WineOutput> { continuation in
            continuation.onTermination = { termination in
                switch termination {
                case .finished:
                    break
                case .cancelled:
                    guard self.process.isRunning else { return }
                    self.terminate()
                @unknown default:
                    break
                }
            }
            
            process.terminationHandler = { _ in
                continuation.yield(.terminated)
                continuation.finish()
                TaskManager.shared.remove(self)
            }
            
            do {
                try self.process.run()
                continuation.yield(.launched)
            } catch {
                continuation.yield(.terminated)
                continuation.finish()
            }
            
            standardOutput.fileHandleForReading.readabilityHandler = { pipe in
                let availableData = String(decoding: pipe.availableData, as: UTF8.self)
                guard !availableData.isEmpty else { return }
                continuation.yield(.output(availableData))
            }
            standardError.fileHandleForReading.readabilityHandler = { pipe in
                let availableData = String(decoding: pipe.availableData, as: UTF8.self)
                guard !availableData.isEmpty else { return }
                continuation.yield(.error(availableData))
            }
        }
    }
    
    // MARK: - Process
    
    /// Sends a terminate signal to the receiver and all of its subtasks.
    public func terminate() {
        process.terminate()
    }
    
    /// The exit status the receiver’s executable returns.
    public var terminationStatus: Int32 {
        process.terminationStatus
    }
    
    /// Blocks the process until the receiver is finished.
    public func waitUntilExit() {
        process.waitUntilExit()
    }
    
    /// Blocks the process until the receiver is finished.
    /// 
    /// - Returns: The exit status the receiver’s executable returns.
    @discardableResult public func waitUntilExit() async -> Int32 {
        let task = Task.detached { [process] in
            process.waitUntilExit()
        }
        await task.value
        return terminationStatus
    }
    
    // MARK: - Identifiable
    
    public var id: Int32 {
        process.processIdentifier
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(process)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: WineProcess, rhs: WineProcess) -> Bool {
        lhs.process == rhs.process
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        "\(name) (\(id))"
    }
}
