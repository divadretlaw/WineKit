//
//  COFFHeader.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

extension PortableExecutable {
    /// COFF File Header
    ///
    /// For more information see
    /// [PE Format - COFF File Header](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#coff-file-header-object-and-image)
    /// on *Microsoft Learn*.
    public struct COFFHeader: Hashable, Equatable, Sendable {
        /// The signature.
        private let signature: UInt32
        /// The number that identifies the type of target machine
        ///
        /// For more information, see ``PortableExecutable/Machine``.
        public let machine: Machine
        /// The number of sections. This indicates the size of the section table, which immediately follows the headers.
        public let numberOfSections: UInt16
        /// The time the file was created.
        private let _timeDateStamp: UInt32
        /// The file offset of the COFF symbol table, or zero if no COFF symbol table is present.
        ///
        /// This value should be zero for an image because COFF debugging information is deprecated.
        let pointerToSymbolTable: UInt32
        /// The number of entries in the symbol table.
        ///
        /// This data can be used to locate the string table, which immediately follows the symbol table.
        /// This value should be zero for an image because COFF debugging information is deprecated.
        let numberOfSymbols: UInt32
        /// The size of the optional header, which is required for executable files but not for object files.
        public let sizeOfOptionalHeader: UInt16
        /// The flags that indicate the attributes of the file.
        ///
        /// For specific flag values, see ``PortableExecutable/Characteristic``.
        private let _characteristics: UInt16
        
        init?(fileHandle: FileHandle, offset: UInt64) {
            var offset = offset
            let signature = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            // Check signature ("PE\0\0")
            guard signature.bigEndian == 0x50450000 else {
                return nil
            }
            
            self.signature = signature
            
            let machine = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            self.machine = Machine(rawValue: machine) ?? .unknown
            offset.move(by: UInt16.self)
            
            /// The number of sections. This indicates the size of the section table, which immediately follows the headers.
            self.numberOfSections = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            
            self._timeDateStamp = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.pointerToSymbolTable = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.numberOfSymbols = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfOptionalHeader = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            
            self._characteristics = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
        }
        
        /// The time the file was created.
        public var timeDateStamp: Date {
            Date(timeIntervalSince1970: TimeInterval(_timeDateStamp))
        }
        
        /// The flags that indicate the attributes of the file.
        ///
        /// For specific flag values, see ``PortableExecutable/Characteristic``.
        public var characteristics: [Characteristic] {
            .init(rawValue: _characteristics)
        }
    }
}
