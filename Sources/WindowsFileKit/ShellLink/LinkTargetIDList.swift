//
//  LinkTargetIDList.swift
//  WineKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

extension ShellLink {
    /// Link Target ID List
    ///
    /// For more information see
    /// [Shell Link - LinkTargetIDList](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/881d7a83-07a5-4702-93e3-f9fc34c3e1e4)
    /// on *Microsoft Learn*.
    public struct LinkTargetIDList: Hashable, Equatable, Sendable {
        public let size: UInt16
        public let data: Data
        
        init(fileHandle: FileHandle, offset: UInt64) {
            var offset = offset
            
            let size = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            self.size = size
            offset.move(by: UInt16.self)
            
            self.data = fileHandle.loadData(fromByteOffset: offset, upToCount: Int(size)) ?? Data()
            offset += UInt64(size)
        }
    }
}
