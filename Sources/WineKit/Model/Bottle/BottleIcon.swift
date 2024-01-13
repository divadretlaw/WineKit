//
//  BottleIcon.swift
//  WineKit
//
//  Created by David Walter on 07.12.23.
//

import Foundation

/// A icon of a ``Bottle``
public enum BottleIcon: Hashable, Equatable, Codable, Sendable {
    /// A SF symbol as image
    case systemName(String)
    /// A PNG encoded image
    case png(Data)
    /// A JPEG encoded image
    case jpeg(Data)
    /// A URL to an image
    ///
    /// If the URL is nil, then `Icon` relative to the bottle config is assumed to be the URL.
    case url(URL?)
    
    // MARK: - Codable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case let .systemName(name):
            let value = "data:image/sf-symbol;\(name)"
            try container.encode(value)
        case let .png(data):
            let value = "data:image/png;base64,\(data.base64EncodedString())"
            try container.encode(value)
        case let .jpeg(data):
            let value = "data:image/jpeg;base64,\(data.base64EncodedString())"
            try container.encode(value)
        case let .url(url):
            let value = "data:text/uri-list;\(url?.path(percentEncoded: false) ?? "")"
            try container.encode(value)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        let splits = value.split(separator: ";", maxSplits: 1, omittingEmptySubsequences: false)
        guard let dataType = splits.first, let data = splits.last else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Data couldn't be read because it was not in the right format."))
        }
        
        switch dataType.lowercased() {
        case "data:image/sf-symbol":
            self = .systemName(String(data))
        case "data:image/png":
            guard let data = Data(base64Encoded: String(data.dropFirst(7))) else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Data was not Base64 Encoded"))
            }
            self = .png(data)
        case "data:image/jpeg":
            guard let data = Data(base64Encoded: String(data.dropFirst(7))) else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Data was not Base64 Encoded"))
            }
            self = .jpeg(data)
        case "data:text/uri-list":
            if data.isEmpty {
                self = .url(nil)
            } else {
                self = .url(URL(filePath: String(data)))
            }
        default:
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Unsupported data format: \(dataType)"))
        }
    }
}
