//
//  StringTable.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension VersionInfo {
    /// Represents the organization of data in a file-version resource.
    ///
    /// It contains language and code page formatting information for the strings specified by the Children member.
    /// A code page is an ordered character set.
    ///
    /// For more information see
    /// [StringTable](https://learn.microsoft.com/en-us/windows/win32/menurc/stringtable)
    /// on *Microsoft Learn*.
    public struct StringTable: Hashable, Equatable, Sendable {
        /// The length, in bytes, of this ``VersionInfo/StringTable`` structure,
        /// including all structures indicated by the ``VersionInfo/StringTable/children`` member.
        public let length: UInt16
        /// This member is always equal to zero.
        public let valueLength: UInt16
        /// The type of data in the version resource
        public let type: VersionInfoType
        /// An 8-digit hexadecimal number stored as a Unicode string.
        ///
        /// The four most significant digits represent the language identifier.
        /// The four least significant digits represent the code page for which the data is formatted.
        /// Each Microsoft Standard Language identifier contains two parts: the low-order 10 bits specify the major language,
        /// and the high-order 6 bits specify the sublanguage.
        public let rawKey: Data
        /// An array of one or more ``VersionInfo/String`` structures.
        public let children: [String]
        
        init?(data: Data) {
            var offset = 0
            
            let length = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            let data = data.copyBytes(..<Int(length))
            self.length = length
            offset.move(by: UInt16.self)
            
            let valueLength = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            guard valueLength == 0 else {
                return nil
            }
            offset.move(by: UInt16.self)
            self.valueLength = valueLength
            
            let rawType = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            guard let type = VersionInfoType(rawValue: rawType) else { return nil }
            self.type = type
            
            let keyData = data.loadRawUnicodeString(fromByteOffset: offset)
            self.rawKey = keyData
            offset += keyData.count
            
            // Apply padding if needed
            offset = data.paddedOffset(fromByteOffset: offset)
            
            let startIndex = data.startIndex.advanced(by: offset)
            let endIndex = min(startIndex.advanced(by: Int(length)), data.endIndex)
            self.children = [String](data: data.copyBytes(startIndex..<endIndex)) ?? []
        }
        
        /// The ``VersionInfo/String/rawKey`` as `Swift.String` if applicable.
        public var key: Swift.String? {
            Swift.String(data: rawKey, encoding: .utf16LittleEndian)
        }
        
        public subscript(key: String.Key) -> String? {
            children.first { $0.key == key.rawValue }
        }
    }
}

extension [VersionInfo.StringTable] {
    init?(data: Data) {
        var startIndex = data.startIndex
        let endIndex = data.endIndex
        
        var result: [VersionInfo.StringTable] = []
        while startIndex < endIndex {
            guard let entry = VersionInfo.StringTable(data: data.copyBytes(startIndex...)) else {
                return nil
            }
            result.append(entry)
            startIndex = startIndex.advanced(by: Int(entry.length))
            startIndex = data.paddedIndex(from: startIndex)
        }
        self = result
    }
}
