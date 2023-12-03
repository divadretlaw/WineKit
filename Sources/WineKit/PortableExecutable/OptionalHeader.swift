//
//  OptionalHeader.swift
//  WineKit
//
//  Created by David Walter on 09.11.23.
//

import Foundation

extension PortableExecutable {
    /// Optional Header
    ///
    /// For more information see
    /// [PE Format - Optional Header](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#optional-header-image-only)
    /// on *Microsoft Learn*.
    public struct OptionalHeader: Hashable, Equatable, Sendable {
        // MARK: Standard Fields
        
        /// The unsigned integer that identifies the state of the image file
        public let magic: Magic
        /// The linker version
        public let linkerVersion: String
        /// The size of the code (text) section, or the sum of all code sections if there are multiple sections.
        public let sizeOfCode: UInt32
        /// The size of the initialized data section,
        /// or the sum of all such sections if there are multiple data sections.
        public let sizeOfInitializedData: UInt32
        /// The size of the uninitialized data section (BSS),
        /// or the sum of all such sections if there are multiple BSS sections.
        public let sizeOfUninitializedData: UInt32
        /// The address of the entry point relative to the image base when the executable file is loaded into memory.
        public let addressOfEntryPoint: UInt32
        /// The address that is relative to the image base of the
        /// beginning-of-code section when it is loaded into memory.
        public let baseOfCode: UInt32
        /// The address that is relative to the image base of the
        /// beginning-of-data section when it is loaded into memory.
        public let baseOfData: UInt32?
        
        // MARK: Windows-Specific Fields
        
        /// The preferred address of the first byte of image when loaded into memory
        public let imageBase: UInt64
        /// The alignment (in bytes) of sections when they are loaded into memory.
        public let sectionAlignment: UInt32
        /// The alignment factor (in bytes) that is used to align the raw data of sections in the image file.
        public let fileAlignment: UInt32
        /// The version of the required operating system.
        public let operatingSystemVersion: String
        /// The version of the image
        public let imageVersion: String
        /// The version of the subsystem
        public let subsystemVersion: String
        /// The size (in bytes) of the image, including all headers, as the image is loaded in memory.
        public let sizeOfImage: UInt32
        /// The combined size of an MS-DOS stub, PE header,
        public let sizeOfHeaders: UInt32
        /// The image file checksum. The algorithm for computing the checksum is incorporated into IMAGHELP.DLL.
        public let checkSum: UInt32
        /// The subsystem that is required to run this image.
        ///
        /// For more information, see ``WindowsSubsystem``.
        public let subsystem: WindowsSubsystem
        /// For more information, see ``DLLCharacteristic``
        private let _dllCharacteristics: UInt16
        /// The size of the stack to reserve.
        public let sizeOfStackReserve: UInt32
        /// The size of the stack to commit.
        public let sizeOfStackCommit: UInt32
        /// The size of the local heap space to reserve.
        public let sizeOfHeapReserve: UInt32
        /// The size of the local heap space to commit.
        public let sizeOfHeapCommit: UInt32
        /// The number of data-directory entries in the remainder of the optional header.
        /// Each describes a location and size.
        public let numberOfRvaAndSizes: UInt32
        
        init?(fileHandle: FileHandle, offset: UInt64) {
            var offset = offset
            
            let rawMagic = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            let magic = Magic(rawValue: rawMagic) ?? .unknown
            self.magic = magic
            offset.move(by: UInt16.self)
            
            let majorLinkerVersion = fileHandle.load(fromByteOffset: offset, as: UInt8.self) ?? 0
            offset.move(by: UInt8.self)
            let minorLinkerVersion = fileHandle.load(fromByteOffset: offset, as: UInt8.self) ?? 0
            offset.move(by: UInt8.self)
            self.linkerVersion = "\(majorLinkerVersion).\(minorLinkerVersion)"
            
            self.sizeOfCode = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfInitializedData = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfUninitializedData = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.addressOfEntryPoint = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.baseOfCode = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            switch magic {
            case .pe32Plus:
                // PE32+ does not contain this field, following BaseOfCode is a larger ImageBase instead.
                self.baseOfData = nil
                
                // PE32+ images have a 8 byte ImageBase field.
                self.imageBase = fileHandle.load(fromByteOffset: offset, as: UInt64.self) ?? 0
                offset.move(by: UInt64.self)
            case .pe32:
                // PE32 contains this additional field, following BaseOfCode.
                self.baseOfData = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
                offset.move(by: UInt32.self)
                
                // PE32 images have a 4 byte ImageBase field.
                let imageBase = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
                self.imageBase = UInt64(imageBase)
                offset.move(by: UInt32.self)
            default:
                // Unknown PE image type. Abort.
                return nil
            }
            
            self.sectionAlignment = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.fileAlignment = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            let majorOSVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            let minorOSVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.operatingSystemVersion = "\(majorOSVersion).\(minorOSVersion)"
            
            let majorImageVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            let minorImageVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.imageVersion = "\(majorImageVersion).\(minorImageVersion)"
            
            let majorSubsystemVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            let minorSubsystemVersion = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.subsystemVersion = "\(majorSubsystemVersion).\(minorSubsystemVersion)"
            
            // Reserved, must be zero.
            let win32VersionValue = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            guard win32VersionValue == 0 else { return nil }
            offset.move(by: UInt32.self)
            
            self.sizeOfImage = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfHeaders = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.checkSum = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            let subsystem = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            self.subsystem = WindowsSubsystem(rawValue: subsystem) ?? .unknown
            offset.move(by: UInt16.self)
            
            self._dllCharacteristics = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            
            self.sizeOfStackReserve = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfStackCommit = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfHeapReserve = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            self.sizeOfHeapCommit = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            
            // Reserved, must be zero.
            let loaderFlags = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            guard loaderFlags == 0 else { return nil }
            offset.move(by: UInt32.self)
            
            self.numberOfRvaAndSizes = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
        }
        
        /// For more information, see ``DLLCharacteristic``
        public var dllCharacteristics: [DLLCharacteristic] {
            .init(rawValue: _dllCharacteristics)
        }
    }
}
