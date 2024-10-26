//
//  String.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension VersionInfo {
    /// Represents the organization of data in a file-version resource.
    ///
    /// It contains a string that describes a specific aspect of a file, for example, a file's version, its copyright notices, or its trademarks.
    ///
    /// For more information see
    /// [String](https://learn.microsoft.com/en-us/windows/win32/menurc/string-str)
    /// on *Microsoft Learn*.
    public struct String: Hashable, Equatable, Sendable {
        public let length: UInt16
        public let valueLength: UInt16
        public let type: VersionInfoType
        public let key: Swift.String?
        public let value: Data
        
        init?(data: Data) {
            var offset = 0
            
            let length = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            self.length = length
            offset.move(by: UInt16.self)
            
            let valueLength = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.valueLength = valueLength
            
            let rawType = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            guard let type = VersionInfoType(rawValue: rawType) else {
                return nil
            }
            self.type = type
            
            let keyData = data.loadRawUnicodeString(fromByteOffset: offset)
            self.key = Swift.String(data: keyData, encoding: .utf16LittleEndian)
            offset += keyData.count
            
            // Apply padding if needed
            offset = data.paddedOffset(fromByteOffset: offset)
            
            let startIndex = data.startIndex.advanced(by: offset)
            let endIndex = startIndex.advanced(by: Int(valueLength) * MemoryLayout<UInt16>.size)
            self.value = data.copyBytes(startIndex..<endIndex)
        }
        
        public var stringValue: Swift.String? {
            guard type == .text else { return nil }
            return Swift.String(data: value, encoding: .utf16LittleEndian)?.trimmingCharacters(in: .controlCharacters)
        }
    }
}

extension [VersionInfo.String] {
    init?(data: Data) {
        var startIndex = data.startIndex
        let endIndex = data.endIndex
        
        var result: [VersionInfo.String] = []
        while startIndex < endIndex {
            guard let entry = VersionInfo.String(data: data.copyBytes(startIndex...)) else {
                return nil
            }
            result.append(entry)
            startIndex = startIndex.advanced(by: Int(entry.length))
            startIndex = data.paddedIndex(from: startIndex)
        }
        self = result
    }
}
