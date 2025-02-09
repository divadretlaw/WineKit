//
//  Program.swift
//  WineKit
//
//  Created by David Walter on 03.11.23.
//

import Foundation
import WindowsFileKit
import OSLog

/// A program in a ``Bottle`` that can be executed
public struct Program: Identifiable, Hashable, Equatable, Comparable, Sendable {
    /// Name of the program
    public var name: String
    /// URL to the executable of the program
    public var url: URL
    /// The PE file.
    ///
    /// Will be `nil` if the executable is not a valid PE file.
    public let portableExecutable: PortableExecutable?
    /// Custom settings of the program
    public var settings: ProgramSettings
    
    /// Initialize a ``Program``
    ///
    /// - Parameters:
    ///   - url: The URL to the program.
    ///   - bottle: The ``Bottle`` the program belongs to.
    public init(url: URL, bottle: Bottle) {
        self.url = url
        self.portableExecutable = PortableExecutable(url: url)
        
        do {
            let fileName = url.path(relativeTo: bottle.url, percentEncoded: false).sha256
            let data = try Data(contentsOf: bottle.url.appending(path: ".config/programs/\(fileName).plist"))
            let reference = try PropertyListDecoder().decode(ProgramReference.self, from: data)
            self.name = reference.name
            self.settings = reference.settings
        } catch {
            self.name = url.deletingPathExtension().lastPathComponent
            self.settings = ProgramSettings()
        }
    }
    
    /// Initialize a ``Program``
    ///
    /// - Parameter url: The URL to the program.
    ///
    /// The given url must be within a ``Bottle``. If it is not, then this initializer will fail.
    public init?(url: URL) {
        self.url = url
        self.portableExecutable = PortableExecutable(url: url)
        
        // If we have "drive_c" in the path, we are most likely in a bottle
        guard url.pathComponents.contains("drive_c") else { return nil }
        // The bottle url is everything before "drive_c"
        let bottleURL = url.deletingPathComponents(after: "drive_c")
            .deletingLastPathComponent()
        
        do {
            // Try to load the program settings from the bottle (if they exist)
            let fileName = url.path(relativeTo: bottleURL, percentEncoded: false).sha256
            let data = try Data(contentsOf: bottleURL.appending(path: ".config/programs/\(fileName).plist"))
            let reference = try PropertyListDecoder().decode(ProgramReference.self, from: data)
            self.name = reference.name
            self.settings = reference.settings
        } catch {
            // Otherwise just fallback to normal settings
            self.name = url.deletingPathExtension().lastPathComponent
            self.settings = ProgramSettings()
        }
    }
    
    /// Windows path representation of ``url``
    public var windowsPath: String {
        guard let path = url.pathComponents.split(separator: "drive_c").last else {
            return "U:\\\(url.path(percentEncoded: false))"
                .replacingOccurrences(of: "/", with: "\\")
        }
        
        return "C:\\\(path.joined(separator: "\\"))"
    }
    
    private func url(relativeTo url: URL, create: Bool = false) -> URL {
        let configFolder = url.appending(path: ".config/programs", directoryHint: .isDirectory)
        if create {
            try? FileManager.default.createDirectory(at: configFolder, withIntermediateDirectories: true)
        }
        let fileName = self.url.path(relativeTo: url, percentEncoded: false).sha256
        return configFolder.appending(path: "\(fileName).plist", directoryHint: .notDirectory)
    }
    
    /// Write the program settings to a file
    ///
    /// - Parameter file: The file to write the program settings.
    public func write(to file: URL) async throws {
        let reference = ProgramReference(program: self)
        let task = Task.detached {
            let encoder = PropertyListEncoder()
            #if DEBUG
            encoder.outputFormat = .xml
            #endif
            let data: Data = try encoder.encode(reference)
            try data.write(to: file)
        }
        try await task.value
    }
    
    /// Write the program settings to a ``Bottle``
    ///
    /// - Parameter bottle: The ``Bottle`` to store the program settings in.
    public func write(to bottle: Bottle) async throws {
        let file = url(relativeTo: bottle.url, create: true)
        try await write(to: file)
    }
    
    /// Load the program settings from a file
    ///
    /// - Parameter file: The ``Bottle`` to load the program settings from.
    public mutating func load(from file: URL) async throws {
        let task = Task.detached {
            let data = try Data(contentsOf: file)
            return try PropertyListDecoder().decode(ProgramReference.self, from: data)
        }
        let reference = try await task.value
        
        var program = self
        program.name = reference.name
        program.settings = reference.settings
        self = program
    }
    
    /// Load the program settings from a ``Bottle``
    ///
    /// - Parameter bottle: The ``Bottle`` to load the program settings from.
    public mutating func load(from bottle: Bottle) async throws {
        let file = url(relativeTo: bottle.url)
        try await load(from: file)
    }
    
    // MARK: - Identifiable
    
    public var id: String {
        url.path(percentEncoded: false)
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
        hasher.combine(settings)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: Program, rhs: Program) -> Bool {
        guard lhs.name == rhs.name,
              lhs.settings == rhs.settings,
              lhs.url == rhs.url else {
            return false
        }
        return true
    }
    
    // MARK: - Comparable
    
    public static func < (lhs: Program, rhs: Program) -> Bool {
        switch lhs.name.caseInsensitiveCompare(rhs.name) {
        case .orderedAscending:
            return true
        case .orderedSame:
            return lhs.url.absoluteString < rhs.url.absoluteString
        case .orderedDescending:
            return false
        }
    }
}
