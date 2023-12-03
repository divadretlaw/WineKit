//
//  PortableExecutable+Section.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

extension PortableExecutable {
    /// Section Table (Section Headers)
    ///
    /// For more information see
    /// [PE Format - Section Table (Section Headers)](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#section-table-section-headers)
    /// on *Microsoft Learn*.
    public struct Section: Hashable, Equatable, Sendable {
        private let _name: UInt64
        /// The total size of the section when loaded into memory.
        public let virtualSize: UInt32
        /// For executable images, the address of the first byte of the section relative
        /// to the image base when the section is loaded into memory.
        public let virtualAddress: UInt32
        /// The size of the section (for object files) or the size of the initialized data on disk (for image files).
        public let sizeOfRawData: UInt32
        /// The file pointer to the first page of the section within the COFF file.
        public let pointerToRawData: UInt32
        /// The file pointer to the beginning of relocation entries for the section.
        ///
        /// This is set to zero for executable images or if there are no relocations.
        public let pointerToRelocations: UInt32
        /// The file pointer to the beginning of line-number entries for the section.
        public let pointerToLinenumbers: UInt32
        /// The number of relocation entries for the section.
        ///
        /// This is set to zero for executable images.
        public let numberOfRelocations: UInt16
        /// The number of line-number entries for the section.
        public let numberOfLineNumbers: UInt16
        /// The flags that describe the characteristics of the section
        private let _characteristics: UInt32
        
        init?(fileHandle: FileHandle, offset: UInt64) {
            var offset = offset
            self._name = fileHandle.load(fromByteOffset: offset, as: UInt64.self) ?? 0
            offset.move(by: UInt64.self)
            self.virtualSize = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            self.virtualAddress = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            self.sizeOfRawData = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            self.pointerToRawData = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            self.pointerToRelocations = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            self.pointerToLinenumbers = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            self.numberOfRelocations = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self.numberOfLineNumbers = fileHandle.load(fromByteOffset: offset, as: UInt16.self) ?? 0
            offset.move(by: UInt16.self)
            self._characteristics = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
        }
        
        /// The name of the section
        public var name: String? {
            var name = _name
            let data = Data(bytes: &name, count: MemoryLayout<UInt64>.size)
            if let string = String(data: data, encoding: .utf8) {
                return string.replacingOccurrences(of: "\0", with: "")
            } else {
                return nil
            }
        }
        
        /// The flags that describe the characteristics of the section
        public var characteristics: [SectionFlag] {
            .init(rawValue: _characteristics)
        }
    }
}
