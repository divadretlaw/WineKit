//
//  FileMangerExtensions.swift
//  CellarKit
//
//  Created by David Walter on 04.11.23.
//

import Foundation

extension FileManager {
    func executables(at url: URL, options mask: FileManager.DirectoryEnumerationOptions = []) -> [URL] {
        guard let enumerator = enumerator(
            at: url,
            includingPropertiesForKeys: [.isExecutableKey],
            options: mask
        ) else {
            return []
        }
        
        return enumerator
            .compactMap { $0 as? URL }
            .filter { !$0.hasDirectoryPath }
    }
    
    func files(at url: URL, options mask: FileManager.DirectoryEnumerationOptions = []) -> [URL] {
        guard let enumerator = enumerator(
            at: url,
            includingPropertiesForKeys: [.isRegularFileKey],
            options: mask
        ) else {
            return []
        }
        
        return enumerator
            .compactMap { $0 as? URL }
            .filter { !$0.hasDirectoryPath }
    }
    
    func fileExists(at url: URL) -> Bool {
        fileExists(atPath: url.path(percentEncoded: false))
    }
    
    func fileExists(atPath path: String, relativeTo base: URL) -> Bool {
        fileExists(at: base.appending(path: path.trimmingPrefix("/")))
    }
    
    func directories(at url: URL, options mask: FileManager.DirectoryEnumerationOptions = []) -> [URL] {
        guard let enumerator = enumerator(
            at: url,
            includingPropertiesForKeys: [.isDirectoryKey],
            options: mask
        ) else {
            return []
        }
        
        return enumerator
            .compactMap { $0 as? URL }
            .filter { $0.hasDirectoryPath }
    }
}
