//
//  ResourceDirectoryString.swift
//  WineKit
//
//  Created by David Walter on 04.12.23.
//

import Foundation

extension PortableExecutable {
    /// Resource Directory String
    ///
    /// For more information see
    /// [PE Format - Resource Directory Entry](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#resource-directory-string)
    /// on *Microsoft Learn*.
    public struct ResourceDirectoryString {
        public let unicodeString: String
        
        init?(fileHandle: FileHandle, offset: UInt64) {
            var offset = offset
            let length = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            
            if let data = fileHandle.loadData(fromByteOffset: offset, upToCount: Int(length)), let string = String(data: data, encoding: .unicode) {
                unicodeString = string
            } else {
                unicodeString = ""
            }
        }
        
        public var count: Int {
            unicodeString.count
        }
        
        public var isEmpty: Bool {
            unicodeString.isEmpty
        }
    }
}
