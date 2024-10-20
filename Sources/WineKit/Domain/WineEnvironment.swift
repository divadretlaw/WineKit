//
//  WineEnvironment.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import Foundation

public enum WineEnvironment: Identifiable, Hashable, Equatable, Codable, Sendable {
    case wine(WinePackageVersion)
    case gptk
    case whisky
    case custom(String)
    
    public init(rawValue: String) {
        let url = URL(filePath: rawValue.replacingOccurrences(of: "~", with: NSHomeDirectory()), directoryHint: .isDirectory, relativeTo: nil)
        switch url {
        case WineEnvironment.wine(.stable).url:
            self = .wine(.stable)
        case WineEnvironment.wine(.development).url:
            self = .wine(.development)
        case WineEnvironment.wine(.staging).url:
            self = .wine(.staging)
        case WineEnvironment.gptk.url:
            self = .gptk
        case WineEnvironment.whisky.url:
            self = .whisky
        default:
            self = .custom(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case let .wine(version):
            switch version {
            case .stable:
                return "/Applications/Wine Stable.app/Contents/Resources/wine/bin"
            case .development:
                return "/Applications/Wine Devel.app/Contents/Resources/wine/bin"
            case .staging:
                return "/Applications/Wine Staging.app/Contents/Resources/wine/bin"
            }
        case .gptk:
            return "/usr/local/opt/game-porting-toolkit/bin"
        case .whisky:
            return "~/Library/Application Support/com.isaacmarovitz.Whisky/Libraries/Wine/bin"
        case let .custom(path):
            return path
        }
    }
    
    /// URL to the wine binaries
    public var url: URL {
        URL(filePath: rawValue.replacingOccurrences(of: "~", with: NSHomeDirectory()), directoryHint: .isDirectory, relativeTo: nil)
    }
    
    // MARK: - Identifiable
    
    public var id: String {
        switch self {
        case let .wine(version):
            return "wine-\(version.rawValue)"
        case .gptk:
            return "gptk"
        case .whisky:
            return "whisky"
        case let .custom(path):
            return "custom-\(path)"
        }
    }
    
    // MARK: - Codable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self.init(rawValue: rawValue)
    }
}
