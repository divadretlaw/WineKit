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
        public let length: UInt16
        public let valueLength: UInt16
        public let type: VersionInfoType
        public let key: Data
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
            
            key = Data()
            offset += 16
            
            // Apply padding if needed
            offset = data.paddedOffset(fromByteOffset: offset)
            
            let startIndex = data.startIndex.advanced(by: offset)
            let endIndex = min(startIndex.advanced(by: Int(length)), data.endIndex)
            self.children = [String](data: data.copyBytes(startIndex..<endIndex)) ?? []
        }
        
        public subscript(key: Key) -> String? {
            children.first { $0.key == key.rawValue }
        }
    }
}

extension VersionInfo.StringTable {
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
