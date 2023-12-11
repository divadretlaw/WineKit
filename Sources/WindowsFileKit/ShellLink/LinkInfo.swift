//
//  LinkInfo.swift
//  WineKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

extension ShellLink {
    /// Link Info
    ///
    /// For more information see
    /// [Shell Link - LinkInfo](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/6813269d-0cc8-4be2-933f-e96e8e3412dc)
    /// on *Microsoft Learn*.
    public struct LinkInfo: Hashable, Equatable, Sendable {
        public let linkInfoSize: UInt32
        public let linkInfoHeaderSize: UInt32
        public let linkInfoFlags: LinkInfoFlags
        
        public let volumeIDOffset: UInt32
        public let localBasePathOffset: UInt32
        public let commonNetworkRelativeLinkOffset: UInt32
        public let commonPathSuffixOffset: UInt32
        public let localBasePathOffsetUnicode: UInt32
        public let commonPathSuffixOffsetUnicode: UInt32
        
        public let localBasePath: String?
        public let commonNetworkRelativeLink: String?
        public let commonPathSuffix: String?
        
        init(fileHandle: FileHandle, offset: UInt64) {
            let initialOffset = offset
            var offset = offset
            
            self.linkInfoSize = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            let linkInfoHeaderSize = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.linkInfoHeaderSize = linkInfoHeaderSize
            offset.move(by: UInt32.self)
            
            let rawLinkInfoFlags = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            let linkInfoFlags = LinkInfoFlags(rawValue: rawLinkInfoFlags)
            self.linkInfoFlags = linkInfoFlags
            offset.move(by: LinkInfoFlags.self)
            
            let volumeIDOffset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.volumeIDOffset = volumeIDOffset
            offset.move(by: UInt32.self)
            
            let localBasePathOffset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.localBasePathOffset = localBasePathOffset
            offset.move(by: UInt32.self)
            
            let commonNetworkRelativeLinkOffset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.commonNetworkRelativeLinkOffset = commonNetworkRelativeLinkOffset
            offset.move(by: UInt32.self)
            
            let commonPathSuffixOffset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.commonPathSuffixOffset = commonPathSuffixOffset
            offset.move(by: UInt32.self)
            
            let localBasePathOffsetUnicode = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.localBasePathOffsetUnicode = localBasePathOffsetUnicode
            offset.move(by: UInt32.self)
            
            let commonPathSuffixOffsetUnicode = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.commonPathSuffixOffsetUnicode = commonPathSuffixOffsetUnicode
            offset.move(by: UInt32.self)
            
            if linkInfoFlags.contains(.volumeIDAndLocalBasePath) {
                if linkInfoHeaderSize >= 0x00000024 { // Offsets to the optional fields are specified.
                    let localPathOffset = initialOffset + UInt64(localBasePathOffsetUnicode)
                    self.localBasePath = fileHandle.loadString(fromByteOffset: localPathOffset, encoding: .utf16)
                    
                    let commonNetworkRelativeLinkOffset = initialOffset + UInt64(commonNetworkRelativeLinkOffset)
                    self.commonNetworkRelativeLink = fileHandle.loadString(fromByteOffset: commonNetworkRelativeLinkOffset, encoding: .utf16)
                    
                    let commonPathSuffixOffset = initialOffset + UInt64(commonPathSuffixOffsetUnicode)
                    self.commonPathSuffix = fileHandle.loadString(fromByteOffset: commonPathSuffixOffset, encoding: .utf16)
                } else { // Offsets to the optional fields are not specified.
                    let localPathOffset = initialOffset + UInt64(localBasePathOffset)
                    self.localBasePath = fileHandle.loadString(fromByteOffset: localPathOffset, encoding: .windowsCP1254)
                    
                    let commonNetworkRelativeLinkOffset = initialOffset + UInt64(commonNetworkRelativeLinkOffset)
                    self.commonNetworkRelativeLink = fileHandle.loadString(fromByteOffset: commonNetworkRelativeLinkOffset, encoding: .windowsCP1254)
                    
                    let commonPathSuffixOffset = initialOffset + UInt64(commonPathSuffixOffset)
                    self.commonPathSuffix = fileHandle.loadString(fromByteOffset: commonPathSuffixOffset, encoding: .windowsCP1254)
                }
            } else {
                self.localBasePath = nil
                self.commonNetworkRelativeLink = nil
                self.commonPathSuffix = nil
            }
        }
    }
}
