//
//  VarFileInfo.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension VersionInfo {
    /// Represents the organization of data in a file-version resource.
    ///
    /// It contains version information not dependent on a particular language and code page combination.
    ///
    /// For more information see
    /// [VarFileInfo](https://learn.microsoft.com/en-us/windows/win32/menurc/varfileinfo)
    /// on *Microsoft Learn*.
    public struct VarFileInfo: Hashable, Equatable, Sendable {
        private static var KEY: Data {
            Data([
                0x56, 0x00, // V
                0x61, 0x00, // a
                0x72, 0x00, // r
                0x46, 0x00, // F
                0x69, 0x00, // i
                0x6C, 0x00, // l
                0x65, 0x00, // e
                0x49, 0x00, // I
                0x6E, 0x00, // n
                0x66, 0x00, // f
                0x6F, 0x00, // o
            ])
        }
        
        /// The length, in bytes, of the entire ``VersionInfo/VarFileInfo-swift.struct`` block,
        /// including all structures indicated by the ``VersionInfo/VarFileInfo-swift.struct/children`` member.
        public let length: UInt16
        /// This member is always equal to zero.
        public let valueLength: UInt16
        /// The type of data in the version resource.
        public let type: VersionInfoType
        /// Typically contains a list of languages that the application or DLL supports.
        public let children: Data
        
        init?(data: Data) {
            var offset = 0
            
            let length = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            let data = data.copyBytes(..<Int(length))
            self.length = length
            offset.move(by: UInt16.self)
            
            valueLength = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            
            guard let type = data.load(fromByteOffset: offset, as: VersionInfoType.self) else { return nil }
            self.type = type
            offset.move(by: UInt16.self)
            
            let keyCount = VarFileInfo.KEY.count
            guard
                let key = data.loadData(fromByteOffset: offset, upToCount: keyCount),
                key == VarFileInfo.KEY
            else {
                return nil
            }
            offset += keyCount
            
            // Apply padding if needed
            offset = data.paddedOffset(UInt16.self, fromByteOffset: offset)
            
            let startIndex = data.startIndex.advanced(by: offset)
            let endIndex = min(startIndex.advanced(by: Int(length)), data.endIndex)
            self.children = data.copyBytes(startIndex..<endIndex)
        }
    }
}
