//
//  WineEnvironment.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import Foundation

public enum WineEnvironment: Identifiable, Hashable, Equatable, Codable {
    case wine(WinePackageVersion)
    case gptk
    case custom(String)
    
    public init(string: String) {
        switch string {
        case "/Applications/Wine Stable.app/Contents/Resources/wine/bin":
            self = .wine(.stable)
        case "/Applications/Wine Devel.app/Contents/Resources/wine/bin":
            self = .wine(.development)
        case "/Applications/Wine Staging.app/Contents/Resources/wine/bin":
            self = .wine(.staging)
        case "/usr/local/opt/game-porting-toolkit/bin":
            self = .gptk
        default:
            self = .custom(string)
        }
    }
    
    /// URL to the wine binaries
    public var url: URL {
        switch self {
        case let .wine(version):
            switch version {
            case .stable:
                return URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/bin", directoryHint: .isDirectory, relativeTo: nil)
            case .development:
                return URL(filePath: "/Applications/Wine Devel.app/Contents/Resources/wine/bin", directoryHint: .isDirectory, relativeTo: nil)
            case .staging:
                return URL(filePath: "/Applications/Wine Staging.app/Contents/Resources/wine/bin", directoryHint: .isDirectory, relativeTo: nil)
            }
        case .gptk:
            return URL(filePath: "/usr/local/opt/game-porting-toolkit/bin", directoryHint: .isDirectory, relativeTo: nil)
        case let .custom(path):
            return URL(filePath: path, directoryHint: .isDirectory, relativeTo: nil)
        }
    }
    
    // MARK: - Identifiable
    
    public var id: String {
        switch self {
        case let .wine(version):
            return "wine-\(version.rawValue)"
        case .gptk:
            return "gptk"
        case let .custom(path):
            return "custom-\(path)"
        }
    }
    
    // MARK: - Codable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(url.path(percentEncoded: false))
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let url = try container.decode(String.self)
        self.init(string: url)
    }
}
