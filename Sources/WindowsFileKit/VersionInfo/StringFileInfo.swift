//
//  StringFileInfo.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension VersionInfo {
    /// Represents the organization of data in a file-version resource.
    ///
    /// It contains version information that can be displayed for a particular language and code page.
    ///
    /// For more information see
    /// [StringFileInfo](https://learn.microsoft.com/en-us/windows/win32/menurc/stringfileinfo)
    /// on *Microsoft Learn*.
    public struct StringFileInfo: Hashable, Equatable, Sendable {
        private static let KEY = Data(
            [
                0x53, 0x00, // S
                0x74, 0x00, // t
                0x72, 0x00, // r
                0x69, 0x00, // i
                0x6E, 0x00, // n
                0x67, 0x00, // g
                0x46, 0x00, // F
                0x69, 0x00, // i
                0x6C, 0x00, // l
                0x65, 0x00, // e
                0x49, 0x00, // I
                0x6E, 0x00, // n
                0x66, 0x00, // f
                0x6F, 0x00, // o
            ]
        )
        
        public let length: UInt16
        public let valueLength: UInt16
        public let type: VersionInfoType
        public let children: [StringTable]
        
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
            
            let keyCount = StringFileInfo.KEY.count
            guard
                let key = data.loadData(fromByteOffset: offset, upToCount: keyCount),
                key == StringFileInfo.KEY
            else {
                return nil
            }
            offset += keyCount
            
            // Apply padding if needed
            offset = data.paddedOffset(fromByteOffset: offset)
            
            let startIndex = data.startIndex.advanced(by: offset)
            let endIndex = min(startIndex.advanced(by: Int(length)), data.endIndex)
            self.children = [StringTable](data: data.copyBytes(startIndex..<endIndex)) ?? []
        }
    }
}
