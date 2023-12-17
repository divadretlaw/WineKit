//
//  Winetricks.swift
//  WineKit
//
//  Created by David Walter on 15.12.23.
//

import Foundation
import OSLog

public struct Winetricks: Hashable, Equatable {
    let executable: URL
    let prefix: Prefix
    
    /// Create a Winetricks instance
    ///
    /// - Parameters:
    ///   - executable: The winetricks executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, prefix: Prefix) {
        self.executable = executable
        self.prefix = prefix
    }
    
    /// Create a Winetricks instance
    ///
    /// - Parameters:
    ///   - executable: The winetricks executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, prefix url: URL) {
        self.executable = executable
        self.prefix = Prefix(url: url)
    }
    
    public func run(verb: Winetricks.App) throws {
        try run(verb: verb.rawValue)
    }
    
    public func run(verb: Winetricks.Benchmark) throws {
        try run(verb: verb.rawValue)
    }
    
    public func run(verb: Winetricks.DLL) throws {
        try run(verb: verb.rawValue)
    }
    
    public func run(verb: Winetricks.Font) throws {
        try run(verb: verb.rawValue)
    }
    
    public func run(verb: Winetricks.Game) throws {
        try run(verb: verb.rawValue)
    }
    
    public func run(verb: Winetricks.Setting) throws {
        try run(verb: verb.rawValue)
    }
    
    internal func run(verb: String) throws {
        let process = Process()
        
        process.executableURL = executable
        process.arguments = [verb]
        process.standardInput = FileHandle.nullDevice
        process.standardOutput = FileHandle.nullDevice
        process.standardError = FileHandle.nullDevice
        process.currentDirectoryURL = prefix.url
        
        process.environment = [:]
            .merging(prefix.environment) { _, new in
                new
            }
        
        try process.run()
    }
}
