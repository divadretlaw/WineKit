//
//  WineServer.swift
//  WineKit
//
//  Created by David Walter on 26.11.23.
//

import Foundation
import OSLog

public struct WineServer: Hashable, Equatable, Sendable {
    let executable: URL
    let prefix: Prefix
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - executable: The wine server executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, prefix: Prefix) {
        self.executable = executable
        self.prefix = prefix
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - executable: The wine server executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, prefix url: URL) {
        self.executable = executable
        self.prefix = Prefix(url: url)
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - folder: The wine binary folder.
    ///   - bottle: The prefix to use in wine.
    public init(folder: URL, prefix: Prefix) {
        self.executable = folder.appending(path: "wineserver")
        self.prefix = prefix
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - folder: The wine binary folder.
    ///   - bottle: The prefix to use in wine.
    public init(folder: URL, prefix url: URL) {
        self.executable = folder.appending(path: "wineserver")
        self.prefix = Prefix(url: url)
    }
    
    public func run(_ arguments: [String], environment: [String: String]? = nil) throws {
        let process = Process()
        
        process.executableURL = executable
        process.arguments = arguments
        process.standardInput = FileHandle.nullDevice
        process.standardOutput = FileHandle.nullDevice
        process.standardError = FileHandle.nullDevice
        process.currentDirectoryURL = prefix.url
        
        process.environment = [:]
            .merging(prefix.environment) { _, new in
                new
            }
            .merging(environment) { _, new in
                new
            }
        
        try process.run()
    }
}
