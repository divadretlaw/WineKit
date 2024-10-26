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
    public struct String: Hashable, Equatable, Sendable, CustomStringConvertible {
        /// The length, in bytes, of this ``VersionInfo/String`` structure.
        public let length: UInt16
        /// The size, in words, of the ``VersionInfo/String/value`` member.
        public let valueLength: UInt16
        /// The type of data in the version resource
        public let type: VersionInfoType
        /// An arbitrary Unicode string. The ``VersionInfo/String/rawKey`` member can be one or more of the values in ``VersionInfo/String/Key-swift.enum``
        public let rawKey: Data
        /// A zero-terminated string. See the ``VersionInfo/String/Key-swift.enum`` member description for more information.
        public let value: Data
        
        init?(data: Data) {
            var offset = 0
            
            let length = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            self.length = length
            offset.move(by: UInt16.self)
            
            let valueLength = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.valueLength = valueLength
            
            guard let type = data.load(fromByteOffset: offset, as: VersionInfoType.self) else { return nil }
            self.type = type
            offset.move(by: UInt16.self)
            
            let keyData = data.loadRawUnicodeString(fromByteOffset: offset)
            self.rawKey = keyData
            offset += keyData.count
            
            // Apply padding if needed
            offset = data.paddedOffset(UInt16.self, fromByteOffset: offset)
            
            let startIndex = data.startIndex.advanced(by: offset)
            let endIndex = startIndex.advanced(by: Int(valueLength) * MemoryLayout<UInt16>.size)
            self.value = data.copyBytes(startIndex..<endIndex)
        }
        
        /// The ``VersionInfo/String/rawKey`` as `Swift.String` if applicable.
        public var key: Swift.String? {
            Swift.String(data: rawKey, encoding: .utf16LittleEndian)?.trimmingCharacters(in: .controlCharacters)
        }
        
        /// The ``VersionInfo/String/value`` as `Swift.String` if applicable.
        public var stringValue: Swift.String? {
            guard type == .text else { return nil }
            return Swift.String(data: value, encoding: .utf16LittleEndian)?.trimmingCharacters(in: .controlCharacters)
        }
        
        public var description: Swift.String {
            [key, stringValue]
                .compactMap { $0 }
                .map { "\"\($0)\"" }
                .joined(separator: ": ")
        }
    }
}

extension VersionInfo.String {
    public enum Key: String, CaseIterable, Hashable, Equatable, Sendable, CustomStringConvertible {
        case companyName = "CompanyName"
        case fileDescription = "FileDescription"
        case fileVersion = "FileVersion"
        case internalName = "InternalName"
        case legalCopyright = "LegalCopyright"
        case legalTrademarks = "LegalTrademarks"
        case originalFilename = "OriginalFilename"
        case privateBuild = "PrivateBuild"
        case productName = "ProductName"
        case productVersion = "ProductVersion"
        case specialBuild = "SpecialBuild"
        
        public var description: String {
            rawValue
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
            startIndex = data.paddedIndex(UInt16.self, from: startIndex)
        }
        self = result
    }
}
