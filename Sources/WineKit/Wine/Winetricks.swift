//
//  Winetricks.swift
//  WineKit
//
//  Created by David Walter on 15.12.23.
//

import Foundation
import OSLog

/// Run Winetricks verbs
public struct Winetricks: Hashable, Equatable, Sendable {
    let executable: URL
    let prefix: Prefix
    
    /// Create a Winetricks instance
    ///
    /// - Parameters:
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, prefix: Prefix) {
        self.executable = Bundle.module.url(forResource: "winetricks", withExtension: "sh")!
        self.prefix = prefix
    }
    
    /// Create a Winetricks instance
    ///
    /// - Parameters:
    ///   - bottle: The prefix to use in wine.
    public init(prefix url: URL) {
        self.executable = Bundle.module.url(forResource: "winetricks", withExtension: "sh")!
        self.prefix = Prefix(url: url)
    }
    
    /// Run a verb from the category ``Winetricks/App``
    ///
    /// - Parameter verb: The verb to run.
    public func run(verb: Winetricks.App) async throws {
        try await run(verb: verb.rawValue)
    }
    
    /// Run a verb from the category ``Winetricks/Benchmark``
    ///
    /// - Parameter verb: The verb to run.
    public func run(verb: Winetricks.Benchmark) async throws {
        try await run(verb: verb.rawValue)
    }
    
    /// Run a verb from the category ``Winetricks/DLL``
    ///
    /// - Parameter verb: The verb to run.
    public func run(verb: Winetricks.DLL) async throws {
        try await run(verb: verb.rawValue)
    }
    
    /// Run a verb from the category ``Winetricks/Font``
    ///
    /// - Parameter verb: The verb to run.
    public func run(verb: Winetricks.Font) async throws {
        try await run(verb: verb.rawValue)
    }
    
    /// Run a verb from the category ``Winetricks/Setting``
    ///
    /// - Parameter verb: The verb to run.
    public func run(verb: Winetricks.Setting) async throws {
        try await run(verb: verb.rawValue)
    }
    
    internal func run(
        verb: String
    ) async throws {
        let process = WineProcess(winetricks: self, verb: verb)
        let stream = TaskManager.shared.runSystem(process)
        let logger = Logger(process: process)
        
        for await output in stream {
            switch output {
            case .launched:
                Logger.wineKit.info("Launched Winetricks '\(process)'")
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
                    throw WineError.crash("Exited Winetricks '\(process)' with \(process.terminationStatus)")
                } else {
                    Logger.wineKit.info("Exited Winetricks '\(process)' with \(process.terminationStatus)")
                }
            }
        }
    }
}
