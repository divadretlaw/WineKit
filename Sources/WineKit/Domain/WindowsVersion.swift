//
//  WindowsVersion.swift
//  WineKit
//
//  Created by David Walter on 03.11.23.
//

import Foundation

/// Windows Version
public enum WindowsVersion: String, CaseIterable, Codable, Identifiable, CustomStringConvertible, Sendable {
    /// Windows XP
    case windowsXP
    /// Windows 2003
    case windows2003
    /// Windows Vista
    case windowsVista
    /// Windows 2008 R2
    case windows2008
    /// Windows 7
    case windows7
    /// Windows 2008 R2
    case windows2008R2
    /// Windows 8
    case windows8
    /// Windows 8.1
    case windows81
    /// Windows 10
    case windows10
    
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "winxp", "winxp64":
            self = .windowsXP
        case "win2003", "win2k3":
            self = .windows2003
        case "win2008", "win2k8":
            self = .windows2008
        case "vista", "winvista":
            self = .windowsVista
        case "win7":
            self = .windows7
        case "win2008r2", "win2k8r2":
            self = .windows2008R2
        case "win8":
            self = .windows8
        case "win81":
            self = .windows81
        case "win10":
            self = .windows10
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .windowsXP:
            return "winxp64"
        case .windows2003:
            return "win2003"
        case .windowsVista:
            return "vista"
        case .windows2008:
            return "win2k8"
        case .windows7:
            return "win7"
        case .windows2008R2:
            return "win2k8r2"
        case .windows8:
            return "win8"
        case .windows81:
            return "win81"
        case .windows10:
            return "win10"
        }
    }
    
    // MARK: - Identifiable
    
    public var id: String {
        rawValue
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        switch self {
        case .windowsXP:
            return "Windows XP"
        case .windows2003:
            return "Windows 2003"
        case .windowsVista:
            return "Windows Vista"
        case .windows2008:
            return "Windows 2008"
        case .windows7:
            return "Windows 7"
        case .windows2008R2:
            return "Windows 2008 R2"
        case .windows8:
            return "Windows 8"
        case .windows81:
            return "Windows 8.1"
        case .windows10:
            return "Windows 10"
        }
    }
}
