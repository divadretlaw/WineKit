//
//  Bottle.swift
//  WineKit
//
//  Created by David Walter on 03.11.23.
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

/// A bottle represents a wine directory
public struct Bottle: Identifiable, Hashable, Equatable, Comparable, Sendable {
    internal var identifier: BottleIdentifier
    
    /// The wine environment the bottle uses
    public var environment: WineEnvironment
    /// The name of the bottle
    public var name: String
    /// The icon of the bottle
    public var icon: BottleIcon
    /// Custom settings of the bottle
    public var prefix: Prefix
    
    /// Initialize a ``Bottle`` from the given directory
    ///
    /// - Parameter url: The URL of the bottle.
    public init(url: URL) throws {
        self.prefix = Prefix(url: url)
        
        let data = try Data(contentsOf: url.appending(path: ".config/bottle.plist"))
        let reference = try PropertyListDecoder().decode(BottleReference.self, from: data)
        
        self.identifier = reference.identifier
        self.environment = reference.wine
        self.name = reference.name
        self.icon = reference.icon
    }
    
    /// Initialize a ``Bottle`` from the given prefix
    ///
    /// - Parameter url: The ``Prefix`` of the bottle.
    public init(prefix: Prefix) throws {
        let url = prefix.url
        self.prefix = prefix
        
        let data = try Data(contentsOf: url.appending(path: ".config/bottle.plist"))
        let reference = try PropertyListDecoder().decode(BottleReference.self, from: data)
        
        self.identifier = reference.identifier
        self.environment = reference.wine
        self.name = reference.name
        self.icon = reference.icon
    }
    
    /// Create a new ``Bottle``
    ///
    /// - Parameters:
    ///   - name: The name of the bottle.
    ///   - icon: The icon of the bottle.
    ///   - url: The URL of the bottle.
    ///
    /// The bottle will not be setup automatically. Use ``Wine/setup(windows:)`` in order to actually create the bottle on disk.
    public init(name: String, icon: BottleIcon, url: URL, wine: WineEnvironment) {
        let identifier = BottleIdentifier(url: url)
        self.identifier = identifier
        self.name = name
        self.icon = icon
        self.environment = wine
        self.prefix = Prefix(url: url)
    }
    
    /// URL to the location of the bottle
    public var url: URL {
        prefix.url
    }
    
    /// The wine instance associated with this bottle
    public var wine: Wine {
        Wine(folder: environment.url, prefix: prefix)
    }
    
    /// The wine server instance associated with this bottle
    public var wineServer: WineServer {
        WineServer(folder: environment.url, prefix: prefix)
    }
    
    /// Run the url in the bottle
    ///
    /// - Parameter url: URL to an executable.
    public func run(url: URL) async throws {
        return try await wine.run(["start", "/unix", url.path(percentEncoded: false)])
    }
    
    /// Run the given ``Program`` in the bottle
    ///
    /// - Parameter program: The program to run.
    public func run(program: Program) async throws {
        return try await wine.run([program.url.path(percentEncoded: false)], environment: program.settings.environment)
    }
    
    /// Kills all programs running in the bottle
    public func kill() throws {
        return try wineServer.run(["-k"])
    }
    
    #if canImport(AppKit)
    /// Open the 'C:\' drive of the bottle
    public func openDrive() {
        NSWorkspace.shared.open(url.appending(path: "drive_c"))
    }
    
    var nsImage: NSImage? {
        switch icon {
        case let .systemName(name):
            return NSImage(systemSymbolName: name, accessibilityDescription: nil)
        case let .png(data):
            return NSImage(data: data)
        case let .jpeg(data):
            return NSImage(data: data)
        case let .url(url):
            do {
                let iconURL = url ?? self.url.appending(path: ".config/Icon", directoryHint: .notDirectory)
                let data = try Data(contentsOf: iconURL)
                return NSImage(data: data)
            } catch {
                return nil
            }
        }
    }
    #endif
    
    #if canImport(SwiftUI)
    var image: Image? {
        switch icon {
        case let .systemName(name):
            return Image(systemName: name)
        default:
            #if canImport(AppKit)
            if let image = nsImage {
                return Image(nsImage: image)
            } else {
                return nil
            }
            #else
            return nil
            #endif
        }
    }
    #endif
    
    /// Write the bottle settings to a file
    ///
    /// - Parameter file: Optional file to write to. Defaults to `.config/bottle.plist` in the bottle directory.
    public func write(to file: URL? = nil) async throws {
        let bottleFile: URL
        if let file = file {
            bottleFile = file
        } else {
            let configFolder = url.appending(path: ".config", directoryHint: .isDirectory)
            try? FileManager.default.createDirectory(at: configFolder, withIntermediateDirectories: true)
            bottleFile = configFolder.appending(path: "bottle.plist", directoryHint: .notDirectory)
        }
        let reference = BottleReference(bottle: self)
        let task = Task.detached {
            let encoder = PropertyListEncoder()
            #if DEBUG
            encoder.outputFormat = .xml
            #endif
            let data: Data = try encoder.encode(reference)
            try data.write(to: bottleFile)
        }
        try await task.value
    }
    
    /// Reload the bottle settings from a file
    ///
    /// - Parameter file: Optional file to read from. Defaults to `.config/bottle.plist` in the bottle directory.
    public mutating func reload(with file: URL? = nil) async throws {
        let bottleFile: URL
        if let file = file {
            bottleFile = file
        } else {
            bottleFile = url.appending(path: ".config/bottle.plist", directoryHint: .notDirectory)
        }
        
        let task = Task.detached {
            let data = try Data(contentsOf: bottleFile)
            return try PropertyListDecoder().decode(BottleReference.self, from: data)
        }
        
        let reference = try await task.value
        var bottle = self
        bottle.identifier = reference.identifier
        bottle.name = reference.name
        bottle.icon = reference.icon
        self = bottle
    }
    
    /// Load all programs within the bottle
    ///
    /// - Returns: List of ``Program``s
    public func loadPrograms() async -> [Program] {
        let programFiles64 = url
            .appending(path: "drive_c")
            .appending(path: "Program Files")
        let programFiles32 = url
            .appending(path: "drive_c")
            .appending(path: "Program Files (x86)")
        
        return [programFiles64, programFiles32]
            .flatMap { url in
                FileManager.default.executables(at: url, options: [.skipsHiddenFiles])
            }
            .filter {
                $0.pathExtension.lowercased() == "exe"
            }
            .map { url in
                Program(url: url, bottle: self)
            }
    }
    
    public func loadStartMenuPrograms() async -> [Program] {
        var  folders: [URL] = [
            url
                .appending(path: "drive_c")
                .appending(path: "ProgramData")
                .appending(path: "Microsoft")
                .appending(path: "Windows")
                .appending(path: "Start Menu")
        ]
        
        do {
            let users = url
                .appending(path: "drive_c")
                .appending(path: "users")
            let userStartMenus = try FileManager.default
                .contentsOfDirectory(at: users, includingPropertiesForKeys: [.isDirectoryKey])
                .map { url in
                    url
                        .appending(path: "AppData")
                        .appending(path: "Roaming")
                        .appending(path: "Microsoft")
                        .appending(path: "Windows")
                        .appending(path: "Start Menu")
                }
            folders.append(contentsOf: userStartMenus)
        } catch {
            Logger.wineKit.warning("Unable to read the users directory. \(error.localizedDescription)")
        }
        
        return folders
            .flatMap { url in
                FileManager.default.files(at: url, options: [.skipsHiddenFiles])
            }
            .filter {
                $0.pathExtension.lowercased() == "lnk"
            }
            .compactMap { url in
                ShellLink(url: url)
            }
            .compactMap { link in
                guard let windowsPath = link.linkInfo?.localBasePath else { return nil }
                let unixPath = windowsPath
                    .replacingOccurrences(of: "\\", with: "/")
                    .replacingOccurrences(of: "C:", with: "drive_c")
                return Program(url: url.appending(path: unixPath), bottle: self)
            }
    }
    
    // MARK: - Identifiable
    
    public var id: String {
        identifier.rawValue
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(name)
        hasher.combine(icon)
        hasher.combine(url)
        hasher.combine(prefix)
        hasher.combine(environment)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: Bottle, rhs: Bottle) -> Bool {
        guard lhs.identifier == rhs.identifier,
              lhs.name == rhs.name,
              lhs.icon == rhs.icon,
              lhs.url == rhs.url,
              lhs.prefix == rhs.prefix,
              lhs.environment == rhs.environment
        else {
            return false
        }
        return true
    }
    
    // MARK: - Comparable
    
    public static func < (lhs: Bottle, rhs: Bottle) -> Bool {
        lhs.name.caseInsensitiveCompare(rhs.name) == .orderedAscending
    }
}
