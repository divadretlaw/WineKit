//
//  Wine.swift
//  WineKit
//
//  Created by David Walter on 06.11.23.
//

import Foundation
import OSLog

/// Run Windows Executables
public final class Wine: Hashable, Equatable {
    let executable: URL
    let bottle: Bottle
    
    // MARK: - Init - Executable
    
    /// Create a Wine instance
    /// 
    /// - Parameters:
    ///   - executable: The wine executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, bottle: Bottle = .default) {
        self.executable = executable
        self.bottle = bottle
    }
    
    /// Create a Wine instance
    ///
    /// - Parameters:
    ///   - executable: The wine executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, bottle: URL) {
        self.executable = executable
        self.bottle = Bottle(url: bottle)
    }
    
    // MARK: Init - Folder
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - folder: The wine binary folder.
    ///   - bottle: The prefix to use in wine.
    public init(folder: URL, bottle: Bottle = .default) {
        self.executable = folder.appending(path: "wine64", directoryHint: .notDirectory)
        self.bottle = bottle
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - folder: The wine binary folder.
    ///   - bottle: The prefix to use in wine.
    public init(folder: URL, bottle: URL) {
        self.executable = folder.appending(path: "wine64", directoryHint: .notDirectory)
        self.bottle = Bottle(url: bottle)
    }
    
    public var registry: WineRegistry {
        WineRegistry(wine: self)
    }
    
    public var commands: WineCommands {
        WineCommands(wine: self)
    }
    
    // MARK: - User
    
    /// Run a command in wine
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to wine.
    ///   - environment: Additional environment to use. Defaults to `nil`.
    public func run(
        _ arguments: [String],
        environment: [String: String]? = nil
    ) async throws {
        let process = WineProcess(wine: self, arguments: arguments, environment: environment)
        let stream = TaskManager.shared.runUser(process)
        let logger = Logger(process: process)
        
        for await output in stream {
            switch output {
            case .launched:
                Logger.wineKit.info("Launched Wine '\(process)'")
            case let .output(string):
                let message = string.trimmingCharacters(in: .whitespacesAndNewlines)
                if !message.isEmpty {
                    logger.log("\(message)")
                }
            case let .error(string):
                let message = string.trimmingCharacters(in: .whitespacesAndNewlines)
                if !message.isEmpty {
                    logger.error("\(message)")
                }
            case .terminated:
                Logger.wineKit.info("Exited Wine '\(process)' with \(process.terminationStatus)")
                if process.terminationStatus != 0 {
                    throw WineError.crash("Exited Wine '\(process)' with \(process.terminationStatus)")
                }
            }
        }
    }
    
    /// Run a command in wine and capture the output in a stream
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to wine.
    ///   - environment: Additional environment to use. Defaults to `nil`.
    ///
    /// - Returns: An async stream containing updates from the process
    public func run(
        _ arguments: [String],
        environment: [String: String]? = nil
    ) throws -> AsyncStream<WineOutput> {
        let process = WineProcess(wine: self, arguments: arguments, environment: environment)
        return TaskManager.shared.runUser(process)
    }
    
    // MARK: - System
    
    /// Run a system command in wine
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to wine.
    ///   - environment: Additional environment to use. Defaults to `nil`.
    internal func runSystem(
        _ arguments: [String],
        environment: [String: String]? = nil
    ) async throws {
        let process = WineProcess(wine: self, arguments: arguments, environment: environment)
        let stream = TaskManager.shared.runSystem(process)
        let logger = Logger(process: process)
        
        for await output in stream {
            switch output {
            case .launched:
                Logger.wineKit.info("Launched Wine '\(process)'")
            case let .output(string):
                let message = string.trimmingCharacters(in: .whitespacesAndNewlines)
                if !message.isEmpty {
                    logger.log("\(message)")
                }
            case let .error(string):
                let message = string.trimmingCharacters(in: .whitespacesAndNewlines)
                if !message.isEmpty {
                    logger.error("\(message)")
                }
            case .terminated:
                if process.terminationStatus != 0 {
                    throw WineError.crash("Exited Wine '\(process)' with \(process.terminationStatus)")
                } else {
                    Logger.wineKit.info("Exited Wine '\(process)' with \(process.terminationStatus)")
                }
            }
        }
    }
    
    /// Run a system command in wine and capture it's output
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to wine.
    ///   - environment: Additional environment to use. Defaults to `nil`.
    ///
    /// - Returns: The output of the wine process
    internal func runSystemOutput(
        _ arguments: [String],
        environment: [String: String]? = nil
    ) async throws -> String {
        var log = ""
        let process = WineProcess(wine: self, arguments: arguments, environment: environment)
        let stream = TaskManager.shared.runSystem(process)
        let logger = Logger(process: process)
        
        for await output in stream {
            switch output {
            case .launched:
                Logger.wineKit.info("Launched Wine '\(process)'")
            case let .output(string):
                log.append(string)
                let message = string.trimmingCharacters(in: .whitespacesAndNewlines)
                if !message.isEmpty {
                    logger.log("\(message)")
                }
            case let .error(string):
                log.append(string)
                let message = string.trimmingCharacters(in: .whitespacesAndNewlines)
                if !message.isEmpty {
                    logger.error("\(message)")
                }
            case .terminated:
                Logger.wineKit.info("Exited Wine '\(process)' with \(process.terminationStatus)")
                if process.terminationStatus != 0 {
                    throw WineError.crash(log)
                }
            }
        }
        
        return log
    }
    
    // MARK: - Setup
    
    public func setup(windows: WindowsVersion) async throws {
        try FileManager.default.createDirectory(at: bottle.url, withIntermediateDirectories: true)
        try await self.registry.changeWindowsVersion(windows)
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(executable)
        hasher.combine(bottle)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: Wine, rhs: Wine) -> Bool {
        guard lhs.executable == rhs.executable,
              lhs.bottle == rhs.bottle
        else {
            return false
        }
        return true
    }
}
