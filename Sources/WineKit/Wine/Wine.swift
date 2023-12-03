//
//  Wine.swift
//  WineKit
//
//  Created by David Walter on 06.11.23.
//

import Foundation
import OSLog

public struct Wine: Hashable, Equatable, Codable {
    let folder: URL
    let prefix: URL
    let environment: [String: String]
    
    /// Create a Wine instance
    /// 
    /// - Parameters:
    ///   - binFolder: The wine `bin` folder containg the wine binaries.
    ///   - prefix: The prefix to use in wine.
    ///   - environment: The environment to use for this wine instance.
    public init(binFolder: URL, prefix: URL, environment: [String: String] = [:]) {
        self.folder = binFolder
        self.prefix = prefix
        self.environment = environment
    }
    
    public var registry: WineRegistry {
        WineRegistry(wine: self)
    }
    
    public var commands: WineCommands {
        WineCommands(wine: self)
    }
    
    var wine: URL {
        folder.appending(path: "wine64")
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
}
