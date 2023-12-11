//
//  ShellLinkHeader.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import Foundation

extension ShellLink {
    /// Shell Link Header
    ///
    /// For more information see
    /// [Shell Link - ShellLinkHeader](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/c3376b21-0931-45e4-b2fc-a48ac0e60d15)
    /// on *Microsoft Learn*.
    public struct ShellLinkHeader: Hashable, Equatable, Sendable {
        /// The size, in bytes, of this structure
        public let headerSize: UInt32
        /// The class identifier
        ///
        /// A GUID that identifies a software component.
        public let linkCLSID: UUID
        /// The ``LinkFlags`` structure defines bits that specify which shell link structures
        /// are present in the file format after the ``ShellLinkHeader`` structure
        public let linkFlags: LinkFlags
        /// A ``FileAttributesFlags`` structure that specifies information about the link target
        public let fileAttributesFlags: FileAttributesFlags
        private let _creationTime: UInt32
        private let _accessTime: UInt32
        private let _writeTime: UInt32
        /// The size of the link target
        public let fileSize: UInt32
        /// The index of icon withtin a given icon location
        public let iconIndex: UInt32
        /// The expected window state of an application launched by the link
        public let showCommand: ShowCommand
        
        init?(fileHandle: FileHandle, offset: UInt64) {
            var offset = offset
            
            let headerSize = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            guard headerSize == 0x0000004C else { return nil }
            self.headerSize = headerSize
            offset.move(by: UInt32.self)
            
            guard let linkCLSID = fileHandle.load(fromByteOffset: offset, as: UUID.self) else {
                return nil
            }
            self.linkCLSID = linkCLSID
            offset.move(by: UUID.self)
            
            let linkFlags = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.linkFlags = LinkFlags(rawValue: linkFlags)
            offset.move(by: LinkFlags.self)
            
            let fileAttributesFlags = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.fileAttributesFlags = FileAttributesFlags(rawValue: fileAttributesFlags)
            offset.move(by: FileAttributesFlags.self)
            
            self._creationTime = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self._accessTime = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self._writeTime = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.fileSize = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.iconIndex = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            let showCommand = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.showCommand = ShowCommand(rawValue: showCommand) ?? .normal
            offset.move(by: UInt32.self)
        }
        
        /// The creation time of the link target
        public var creationTime: Date? {
            guard _creationTime != 0 else { return nil }
            return Date(timeIntervalSince1970: TimeInterval(_creationTime))
        }
        
        /// The access time of the link target
        public var accessTime: Date? {
            guard _accessTime != 0 else { return nil }
            return Date(timeIntervalSince1970: TimeInterval(_accessTime))
        }
        
        /// The write time of the link target
        public var writeTime: Date? {
            guard _writeTime != 0 else { return nil }
            return Date(timeIntervalSince1970: TimeInterval(_writeTime))
        }
    }
}
