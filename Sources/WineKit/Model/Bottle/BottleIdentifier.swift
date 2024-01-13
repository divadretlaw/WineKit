//
//  BottleIdentifier.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import Foundation

/// The ID of a ``Bottle``
public enum BottleIdentifier: Hashable, Equatable, Codable, Sendable {
    case `default`
    case uuid(UUID)
    
    var rawValue: String {
        switch self {
        case .default:
            return "default"
        case let .uuid(uuid):
            return uuid.uuidString
        }
    }
    
    init(url: URL) {
        if url == URL.defaultWinePrefix {
            self = .default
        } else {
            self = .uuid(UUID())
        }
    }
    
    // MARK: - Codable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        switch value.lowercased() {
        case "default":
            self = .default
        default:
            guard let uuid = UUID(uuidString: value) else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: ""))
            }
            self = .uuid(uuid)
        }
    }
}
