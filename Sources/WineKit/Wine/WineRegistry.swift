//
//  WineRegistry.swift
//  WineKit
//
//  Created by David Walter on 03.12.23.
//

import Foundation
import OSLog

/// A collection of helpers to configure Wine
public final class WineRegistry {
    private let wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    
    /// Add an entry to the registry
    ///
    /// - Parameters:
    ///   - path: The registry key path.
    ///   - key: The name of the key.
    ///   - value: The data to write to.
    ///   - type: The ``RegistryType`` of the value.
    public func add(
        keyPath: String,
        name: String,
        value: String,
        type: RegistryType
    ) async throws {
        try await wine.runSystem(["REG", "ADD", keyPath, "/v", name, "/t", type.rawValue, "/d", value, "/f"])
    }
    
    /// Query the registry
    ///
    /// - Parameters:
    ///   - path: The registry key path.
    ///   - key: The name of the key.
    ///   - type: The ``RegistryType`` of the value.
    ///   - fallback: The fallback value in case the given key/value couldn't be found. Defaults to empty String.
    /// - Returns: The read value.
    public func query(
        keyPath: String,
        name: String,
        type: RegistryType,
        fallback: String = ""
    ) async throws -> String {
        do {
            let output = try await wine.runSystemOutput(["REG", "QUERY", keyPath, "/v", name])
                .split(omittingEmptySubsequences: true, whereSeparator: \.isNewline)
            
            guard let registryValue = output.first(where: { $0.contains(type.rawValue) }) else {
                throw WineError.invalidResponse
            }
            
            let values = registryValue.split(omittingEmptySubsequences: true, whereSeparator: \.isWhitespace)
            
            guard let value = values.last else {
                throw WineError.invalidResponse
            }
            
            return String(value)
        } catch {
            Logger.wineKit.warning("Failed to read \(name) at '\(keyPath)'. \(error.localizedDescription). Returning default value.")
            return fallback
        }
    }
    
    /// Delete an entry from the registry
    ///
    /// - Parameters:
    ///   - path: The registry key path.
    ///   - key: The name of the key.
    ///   - value: The data to write to.
    ///   - type: The ``RegistryType`` of the value.
    public func delete(
        keyPath: String,
        name: String,
        value: String,
        type: RegistryType
    ) async throws {
        try await wine.runSystem(["REG", "DELETE", keyPath, "/v", name, "/f"])
    }
    
    /// The ``WindowsVersion`` used by this wine instance
    public var windowsVersion: WindowsVersion {
        get async throws {
            let output = try await wine.runSystemOutput(["winecfg", "-v"])
                .split(whereSeparator: \.isNewline)
            
            guard let rawString = output.last, let version = WindowsVersion(rawValue: String(rawString)) else {
                throw WineError.invalidResponse
            }
            
            return version
        }
    }
    
    /// Change the ``WindowsVersion`` used by this wine instance
    ///
    /// - Parameter windowsVersion: The ``WindowsVersion`` to use.
    public func changeWindowsVersion(_ windowsVersion: WindowsVersion) async throws {
        try await wine.runSystem(["winecfg", "-v", windowsVersion.rawValue])
    }
    
    /// The build version of Windows used by this wine instance
    public var buildVersion: String {
        get async throws {
            try await query(
                keyPath: #"HKLM\Software\Microsoft\Windows NT\CurrentVersion"#,
                name: "CurrentBuild",
                type: .string
            )
        }
    }
    
    /// Change the build version of Windows used by this wine instance
    ///
    /// - Parameter windowsVersion: The build version of Windows to use.
    ///
    public func changeBuildVersion(_ buildVersion: Int) async throws {
        try await changeBuildVersion(buildVersion.description)
    }
    
    /// Change the build version of Windows used by this wine instance
    ///
    /// - Parameter windowsVersion: The build version of Windows to use.
    /// 
    public func changeBuildVersion(_ buildVersion: String) async throws {
        try await add(
            keyPath: #"HKLM\Software\Microsoft\Windows NT\CurrentVersion"#,
            name: "CurrentBuild",
            value: buildVersion,
            type: .string
        )
        try await add(
            keyPath: #"HKLM\Software\Microsoft\Windows NT\CurrentVersion"#,
            name: "CurrentBuildNumber",
            value: buildVersion,
            type: .string
        )
    }
    
    /// Checks if this wine instance uses retina mode
    public var usesRetinaMode: Bool {
        get async throws {
            let output = try await query(
                keyPath: #"HKCU\Software\Wine\Mac Driver"#,
                name: "RetinaMode",
                type: .string,
                fallback: "n"
            )
            
            if output.isEmpty {
                try await changeRetinaMode(false)
                return false
            } else {
                return output == "y"
            }
        }
    }
    
    /// Sets the retina mode of this wine instance
    ///
    /// - Parameter retinaMode: Whether to use retina mode or not.
    public func changeRetinaMode(_ retinaMode: Bool) async throws {
        try await add(
            keyPath: #"HKCU\Software\Wine\Mac Driver"#,
            name: "RetinaMode",
            value: retinaMode ? "y" : "n",
            type: .string
        )
    }
    
    /// The DPI used by this wine instance
    public var dpi: Int {
        get async throws {
            let output = try await query(
                keyPath: #"HKCU\Control Panel\Desktop"#,
                name: "LogPixels",
                type: .dword
            )
            .replacingOccurrences(of: "0x", with: "")
            
            guard let value = Int(output, radix: 16) else {
                throw WineError.invalidResponse
            }
            
            return value
        }
    }
    
    /// Change the DPI of this wine instance
    ///
    /// - Parameter dpi: The DPI to use. Defaults to `96`.
    ///
    /// If no value is provided the default DPI will be restored.
    @discardableResult public func changeDPI(_ dpi: Int? = nil) async throws -> Int {
        let dpi = dpi ?? 96
        try await add(
            keyPath: #"HKCU\Control Panel\Desktop"#,
            name: "LogPixels",
            value: dpi.description,
            type: .dword
        )
        return dpi
    }
}
