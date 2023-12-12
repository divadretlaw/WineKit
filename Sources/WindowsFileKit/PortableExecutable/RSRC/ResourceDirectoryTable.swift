//
//  ResourceDirectoryTable.swift
//  WineKit
//
//  Created by David Walter on 09.11.23.
//

import Foundation

extension PortableExecutable {
    /// This data structure should be considered the heading of a table because the table actually consists of directory entries
    ///
    /// For more information see
    /// [PE Format - Resource Directory Table](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#resource-directory-table)
    /// on *Microsoft Learn*.
    public struct ResourceDirectoryTable: Hashable, Equatable, Sendable {
        /// Resource flags. This field is reserved for future use. It is currently set to zero.
        public let characteristics: UInt32
        /// The time that the resource data was created by the resource compiler.
        public let timeDateStamp: Date
        /// The version
        public let version: String
        
        /// The subtables of this table
        public let subtables: [ResourceDirectoryTable]
        /// The entries in the table
        public let entries: [ResourceDataEntry]
        
        /// Read the Resource Directory Table
        ///
        /// - Parameters:
        ///   - fileHandle: The file handle to read the data from.
        ///   - pointerToRawData: The offset to the Resource Directory Table in the file handle.
        ///   - types: Only read entrys of the given types. Only applies to the root table. Defaults to `nil`.
        init(fileHandle: FileHandle, pointerToRawData: UInt64, types: [ResourceType?]? = nil) {
            self.init(fileHandle: fileHandle, pointerToRawData: pointerToRawData, offset: 0, types: types)
        }
        
        /// Read the Resource Directory Table
        ///
        /// - Parameters:
        ///   - fileHandle: The file handle to read the data from.
        ///   - pointerToRawData: The offset to the Resource Directory Table in the file handle.
        ///   - offset: Additional offset to the `pointerToRawData`. Use only for sub-tables. The root-table has the offset 0.
        ///   - types: Only read entrys of the given types. Only applies to the root table. Defaults to `nil`.
        init(
            fileHandle: FileHandle,
            pointerToRawData: UInt64,
            offset: UInt64,
            types: [ResourceType?]? = nil
        ) {
            var offset = pointerToRawData + offset
            self.characteristics = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            let timeDateStamp = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.timeDateStamp = Date(timeIntervalSince1970: TimeInterval(timeDateStamp))
            offset.move(by: UInt32.self)
            
            let majorVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            let minorVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.version = "\(majorVersion).\(minorVersion)"
            
            let numberOfNameEntries = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            
            let numberOfIdEntries = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            
            var subtables: [ResourceDirectoryTable] = []
            var entries: [ResourceDataEntry] = []
            
            for _ in 0..<numberOfNameEntries {
                let directoryEntry = ResourceDirectoryEntry.Name(fileHandle: fileHandle, offset: offset)
                offset.move(by: ResourceDirectoryEntry.Name.self)
                
                guard types == nil else {
                    continue
                }
                
                if directoryEntry.isDirectory {
                    let subtable = ResourceDirectoryTable(
                        fileHandle: fileHandle,
                        pointerToRawData: pointerToRawData,
                        offset: UInt64(directoryEntry.offset)
                    )
                    subtables.append(subtable)
                } else if let entry = ResourceDataEntry(
                    fileHandle: fileHandle,
                    offset: pointerToRawData + UInt64(directoryEntry.offset)
                ) {
                    entries.append(entry)
                }
            }
            
            for _ in 0..<numberOfIdEntries {
                let directoryEntry = ResourceDirectoryEntry.ID(fileHandle: fileHandle, offset: offset)
                offset.move(by: ResourceDirectoryEntry.ID.self)
                
                if let types {
                    guard types.contains(directoryEntry.type) else {
                        continue
                    }
                }
                
                if directoryEntry.isDirectory {
                    let subtable = ResourceDirectoryTable(
                        fileHandle: fileHandle,
                        pointerToRawData: pointerToRawData,
                        offset: UInt64(directoryEntry.offset)
                    )
                    subtables.append(subtable)
                } else if let entry = ResourceDataEntry(
                    fileHandle: fileHandle,
                    offset: pointerToRawData + UInt64(directoryEntry.offset)
                ) {
                    entries.append(entry)
                }
            }
            
            self.subtables = subtables
            self.entries = entries
        }
        
        public var allEntries: [ResourceDataEntry] {
            var entries = self.entries
            for subtable in subtables {
                entries.append(contentsOf: subtable.allEntries)
            }
            return entries
        }
    }
}
