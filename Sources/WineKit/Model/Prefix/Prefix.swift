//
//  Prefix.swift
//  WineKit
//
//  Created by David Walter on 13.11.23.
//

import Foundation
import WindowsFileKit
#if canImport(AppKit)
import AppKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
import OSLog

/// A prefix represents a wine directory
public struct Prefix: Identifiable, Hashable, Equatable, Codable, Sendable {
    public static var `default`: Prefix {
        Prefix(url: .defaultWinePrefix)
    }
    
    /// URL to the location of the prefix
    public let url: URL
    /// Custom settings of the prefix
    public var settings: PrefixSettings
    
    /// Initialize a ``Prefix`` from the given directory
    ///
    /// - Parameter url: The URL of the prefix.
    ///
    /// If no settings are found at the location the default settings will be used.
    public init(url: URL) {
        self.url = url
        
        do {
            let data = try Data(contentsOf: url.appending(path: ".config/settings.plist"))            
            self.settings = try PropertyListDecoder().decode(PrefixSettings.self, from: data)
        } catch {
            self.settings = PrefixSettings()
        }
    }
    
    /// The environment of the prefix
    public var environment: [String: String] {
        settings.environment
            .merging(["WINEPREFIX": url.path(percentEncoded: false)]) { _, new in
                new
            }
    }
    
    /// Write the prefix settings to a file
    ///
    /// - Parameter file: Optional file to write to. Defaults to `.config/settings.plist` in the prefix directory.
    public func write(to file: URL? = nil) async throws {
        let settingsFile: URL
        if let file = file {
            settingsFile = file
        } else {
            let configFolder = url.appending(path: ".config", directoryHint: .isDirectory)
            try? FileManager.default.createDirectory(at: configFolder, withIntermediateDirectories: true)
            settingsFile = configFolder.appending(path: "settings.plist", directoryHint: .notDirectory)
        }
        let task = Task.detached {
            let encoder = PropertyListEncoder()
            #if DEBUG
            encoder.outputFormat = .xml
            #endif
            let data: Data = try encoder.encode(settings)
            try data.write(to: settingsFile)
        }
        try await task.value
    }
    
    /// Reload the prefix settings from a file
    ///
    /// - Parameter file: Optional file to read from. Defaults to `.config/settings.plist` in the prefix directory.
    public mutating func reload(with file: URL? = nil) async throws {
        let settingsFile: URL
        if let file = file {
            settingsFile = file
        } else {
            settingsFile = url.appending(path: ".config/settings.plist", directoryHint: .notDirectory)
        }
        
        let task = Task.detached {
            let data = try Data(contentsOf: settingsFile)
            return try PropertyListDecoder().decode(PrefixSettings.self, from: data)
        }
        
        var prefix = self
        prefix.settings = try await task.value
        self = prefix
    }
    
    // MARK: - Identifiable
    
    public var id: String {
        url.absoluteString
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(url)
        hasher.combine(settings)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: Prefix, rhs: Prefix) -> Bool {
        guard lhs.url == rhs.url,
              lhs.settings == rhs.settings
        else {
            return false
        }
        return true
    }
}
