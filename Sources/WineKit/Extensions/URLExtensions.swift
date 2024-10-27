//
//  URLExtensions.swift
//  WineKit
//
//  Created by David Walter on 03.11.23.
//

import Foundation
import CryptoKit

extension URL {
    func formattedPath(percentEncoded: Bool = true) -> String {
        path(percentEncoded: percentEncoded)
            .replacingOccurrences(of: "/Users/\(NSUserName())", with: "~")
    }
    
    var sha256: String {
        let data = Data(path(percentEncoded: false).utf8)
        let hashed = SHA256.hash(data: data)
        return hashed
            .compactMap {
                String(format: "%02x", $0)
            }
            .joined()
    }
    
    static var defaultWinePrefix: URL {
        URL(filePath: "/Users/\(NSUserName())/.wine", directoryHint: .isDirectory)
    }
    
    func path(relativeTo url: URL, percentEncoded: Bool = true) -> String {
        let path = path(percentEncoded: percentEncoded)
        let parent = url.path(percentEncoded: percentEncoded)
        return path.replacingOccurrences(of: parent, with: "")
    }
    
    func deletingPathComponents(after path: String) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return self
        }
        
        if let pathBefore = components.path.split(separator: path, maxSplits: 1).first {
            components.path = "\(pathBefore)\(path)"
        }
        
        return components.url ?? self
    }
}
