//
//  SectionFlag.swift
//  WineKit
//
//  Created by David Walter on 04.12.23.
//

import Foundation

extension PortableExecutable {
    /// Section Flags
    ///
    /// For more information see
    /// [PE Format - Section Flags](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#section-flags)
    /// on *Microsoft Learn*.
    public struct SectionFlag: OptionSet, Hashable, Equatable, CustomStringConvertible, Sendable {
        public var rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        // case reserved = 0x00000000
        // case reserved = 0x00000001
        // case reserved = 0x00000002
        // case reserved = 0x00000004
        /// The section should not be padded to the next boundary
        ///
        /// This flag is obsolete and is replaced by ``SectionFlag/algin1Bytes``.
        /// This is valid only for object files.
        public static let typeNoPad = SectionFlag(rawValue: 0x00000008)
        // case reserved = 0x00000010
        /// The section contains executable code
        public static let  cntCode = SectionFlag(rawValue: 0x00000020)
        /// The section contains initialized data
        public static let  cntInitializedData = SectionFlag(rawValue: 0x00000040)
        /// The section contains uninitialized data
        public static let  cntUninitializedData = SectionFlag(rawValue: 0x00000080)
        // case reserved = 0x00000100
        /// The section contains comments or other information
        ///
        /// The `.drectve` section has this type. This is valid for object files only.
        public static let  lnkInfo = SectionFlag(rawValue: 0x00000200)
        // case reserved = 0x00000400
        /// The section will not become part of the image
        ///
        /// This is valid only for object files.
        public static let  lnkRemove = SectionFlag(rawValue: 0x00000800)
        /// The section contains COMDAT data
        ///
        /// This is valid only for object files.
        public static let  lnkCOMDAT = SectionFlag(rawValue: 0x00001000)
        /// The section contains data referenced through the global pointer (GP)
        public static let  gprel = SectionFlag(rawValue: 0x00008000)
        // case reserved = 0x00010000
        // case reserved = 0x00020000
        // case reserved  = 0x00040000
        // case reserved = 0x00080000
        /// Align data on a 1-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin1Bytes = SectionFlag(rawValue: 0x00100000)
        /// Align data on a 2-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin2Bytes = SectionFlag(rawValue: 0x00200000)
        /// Align data on a 4-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin4Bytes = SectionFlag(rawValue: 0x00300000)
        /// Align data on a 8-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin8Bytes = SectionFlag(rawValue: 0x00400000)
        /// Align data on a 16-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin16Bytes = SectionFlag(rawValue: 0x00500000)
        /// Align data on a 32-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin32Bytes = SectionFlag(rawValue: 0x00600000)
        /// Align data on a 64-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin64Bytes = SectionFlag(rawValue: 0x00700000)
        /// Align data on a 128-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin128Bytes = SectionFlag(rawValue: 0x00800000)
        /// Align data on a 256-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin256Bytes = SectionFlag(rawValue: 0x00900000)
        /// Align data on a 512-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin512Bytes = SectionFlag(rawValue: 0x00A00000)
        /// Align data on a 1024-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin1024Bytes = SectionFlag(rawValue: 0x00B00000)
        /// Align data on a 2048-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin2048Bytes = SectionFlag(rawValue: 0x00C00000)
        /// Align data on a 4096-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin4096Bytes = SectionFlag(rawValue: 0x00D00000)
        /// Align data on a 8192-byte boundary
        ///
        /// Valid only for object files.
        public static let  algin8192Bytes = SectionFlag(rawValue: 0x00E00000)
        /// The section contains extended relocations
        public static let  lnkNrelocOvfl = SectionFlag(rawValue: 0x01000000)
        /// The section can be discarded as needed
        public static let  memDiscardable = SectionFlag(rawValue: 0x02000000)
        /// The section cannot be cached
        public static let  memNotCached = SectionFlag(rawValue: 0x04000000)
        /// The section is not pageable
        public static let  memNotPaged = SectionFlag(rawValue: 0x08000000)
        /// The section can be shared in memory
        public static let  memShared = SectionFlag(rawValue: 0x10000000)
        /// The section can be executed as code
        public static let  memExecute = SectionFlag(rawValue: 0x20000000)
        /// The section can be read
        public static let  memRead = SectionFlag(rawValue: 0x40000000)
        /// The section can be written to
        public static let  memWrite = SectionFlag(rawValue: 0x80000000)
        
        // MARK: - CustomStringConvertible
        
        // swiftlint:disable line_length
        public var description: String {
            switch self {
            case .typeNoPad:
                return "The section should not be padded to the next boundary. This flag is obsolete and is replaced by 'algin1Bytes'. This is valid only for object files"
            case .cntCode:
                return "The section contains executable code"
            case .cntInitializedData:
                return "The section contains initialized data"
            case .cntUninitializedData:
                return "The section contains uninitialized data"
            case .lnkInfo:
                return "The section contains comments or other information. The '.drectve' section has this type. This is valid for object files only"
            case .lnkRemove:
                return "The section will not become part of the image. This is valid only for object files"
            case .lnkCOMDAT:
                return "The section contains COMDAT data. This is valid only for object files"
            case .gprel:
                return "The section contains data referenced through the global pointer (GP)"
            case .algin1Bytes:
                return "Align data on a 1-byte boundary. Valid only for object files"
            case .algin2Bytes:
                return "Align data on a 2-byte boundary. Valid only for object files"
            case .algin4Bytes:
                return "Align data on a 4-byte boundary. Valid only for object files"
            case .algin8Bytes:
                return "Align data on a 8-byte boundary. Valid only for object files"
            case .algin16Bytes:
                return "Align data on a 16-byte boundary. Valid only for object files"
            case .algin32Bytes:
                return "Align data on a 32-byte boundary. Valid only for object files"
            case .algin64Bytes:
                return "Align data on a 64-byte boundary. Valid only for object files"
            case .algin128Bytes:
                return "Align data on a 128-byte boundary. Valid only for object files"
            case .algin256Bytes:
                return "Align data on a 256-byte boundary. Valid only for object files"
            case .algin512Bytes:
                return "Align data on a 512-byte boundary. Valid only for object files"
            case .algin1024Bytes:
                return "Align data on a 1024-byte boundary. Valid only for object files"
            case .algin2048Bytes:
                return "Align data on a 2048-byte boundary. Valid only for object files"
            case .algin4096Bytes:
                return "Align data on a 4096-byte boundary. Valid only for object files"
            case .algin8192Bytes:
                return "Align data on a 8192-byte boundary. Valid only for object files"
            case .lnkNrelocOvfl:
                return "The section contains extended relocations"
            case .memDiscardable:
                return "The section can be discarded as needed"
            case .memNotCached:
                return "The section cannot be cached"
            case .memNotPaged:
                return "The section is not pageable"
            case .memShared:
                return "The section can be shared in memory"
            case .memExecute:
                return "The section can be executed as code"
            case .memRead:
                return "The section can be read"
            case .memWrite:
                return "The section can be written to"
            default:
                return "Option is reserved for future use"
            }
            // swiftlint:enable line_length
        }
    }
}
