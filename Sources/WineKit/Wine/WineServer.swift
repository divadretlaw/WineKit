//
//  WineServer.swift
//  WineKit
//
//  Created by David Walter on 26.11.23.
//

import Foundation
import OSLog

public struct WineServer: Hashable, Equatable, Codable {
    let folder: URL
    let prefix: URL
    let environment: [String: String]
    
    public init(folder: URL, prefix: URL, environment: [String: String]) {
        self.folder = folder
        self.prefix = prefix
        self.environment = environment
    }
    
    var wineserver: URL {
        folder.appending(path: "wineserver")
    }
    
    public func run(_ arguments: [String], environment: [String: String]? = nil) throws {
        let process = Process()
        
        process.executableURL = wineserver
        process.arguments = arguments
        process.standardInput = FileHandle.nullDevice
        process.standardOutput = FileHandle.nullDevice
        process.standardError = FileHandle.nullDevice
        process.currentDirectoryURL = folder
        process.environment = createEnvironment(additional: environment)
        
        try process.run()
    }
    
    private func createEnvironment(
        additional: [String: String]?
    ) -> [String: String] {
        let baseEnvironment: [String: String] = ["WINEPREFIX": prefix.path]
        
        let environment: [String: String] = baseEnvironment.merging(self.environment) { _, new in
            new
        }
        
        if let additional = additional {
            return environment.merging(additional) { _, new in
                new
            }
        } else {
            return environment
        }
    }
}
