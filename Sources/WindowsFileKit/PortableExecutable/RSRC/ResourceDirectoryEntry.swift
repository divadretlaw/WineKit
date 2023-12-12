//
//  ResourceDirectoryEntries.swift
//  WineKit
//
//  Created by David Walter on 09.11.23.
//

import Foundation

extension PortableExecutable {
    /// The directory entries make up the rows of a table.
    ///
    /// For more information see
    /// [PE Format - Resource Directory Entry](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#resource-directory-entries)
    /// on *Microsoft Learn*.
    public enum ResourceDirectoryEntry {
        /// A directory entry from the name table entries.
        public struct Name {
            /// The offset of a string that gives the Type, Name, or Language ID entry
            public let nameOffset: UInt32
            private let _offset: UInt32
            
            init(fileHandle: FileHandle, offset: UInt64) {
                var offset = offset
                self.nameOffset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
                offset.move(by: UInt32.self)
                self._offset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
                offset.move(by: UInt32.self)
            }
            
            /// Check if the entry is a directory entry
            var isDirectory: Bool {
                (_offset & 0x80000000) != 0
            }
            
            /// The offset of the entry
            var offset: UInt32 {
                if isDirectory {
                    return _offset & 0x7FFFFFFF
                } else {
                    return _offset
                }
            }
        }
        
        /// A directory entry from the id table entries.
        public struct ID { // swiftlint:disable:this type_name
            /// The type of the entry
            public let type: ResourceType?
            private let _offset: UInt32
            
            init(fileHandle: FileHandle, offset: UInt64) {
                var offset = offset
                let rawType = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
                self.type = ResourceType(rawValue: rawType)
                offset.move(by: UInt32.self)
                self._offset = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
                offset.move(by: UInt32.self)
            }
            
            /// Check if the entry is a directory entry
            var isDirectory: Bool {
                (_offset & 0x80000000) != 0
            }
            
            /// The offset of the entry
            var offset: UInt32 {
                if isDirectory {
                    return _offset & 0x7FFFFFFF
                } else {
                    return _offset
                }
            }
        }
    }
}
