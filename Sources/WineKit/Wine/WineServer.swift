//
//  WineServer.swift
//  WineKit
//
//  Created by David Walter on 26.11.23.
//

import Foundation
import OSLog

public struct WineServer: Hashable, Equatable {
    let executable: URL
    let bottle: Bottle
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - executable: The wine server executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, bottle: Bottle) {
        self.executable = executable
        self.bottle = bottle
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - executable: The wine server executable binary.
    ///   - bottle: The prefix to use in wine.
    public init(executable: URL, bottle url: URL) {
        self.executable = executable
        self.bottle = Bottle(url: url)
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - folder: The wine binary folder.
    ///   - bottle: The prefix to use in wine.
    public init(folder: URL, bottle: Bottle) {
        self.executable = folder.appending(path: "wineserver")
        self.bottle = bottle
    }
    
    /// Create a Wine Server instance
    ///
    /// - Parameters:
    ///   - folder: The wine binary folder.
    ///   - bottle: The prefix to use in wine.
    public init(folder: URL, bottle url: URL) {
        self.executable = folder.appending(path: "wineserver")
        self.bottle = Bottle(url: url)
    }
    
    public func run(_ arguments: [String], environment: [String: String]? = nil) throws {
        let process = Process()
        
        process.executableURL = executable
        process.arguments = arguments
        process.standardInput = FileHandle.nullDevice
        process.standardOutput = FileHandle.nullDevice
        process.standardError = FileHandle.nullDevice
        process.currentDirectoryURL = bottle.url
        
        process.environment = [:]
            .merging(bottle.environment) { _, new in
                new
            }
            .merging(environment) { _, new in
                new
            }
        
        try process.run()
    }
}
