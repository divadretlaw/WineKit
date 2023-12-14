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
