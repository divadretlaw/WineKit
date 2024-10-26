//
//  FixedFileInfo.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension VersionInfo {
    /// Contains version information for a file. This information is language and code page independent.
    ///
    /// For more information see
    /// [VS_FIXEDFILEINFO](https://learn.microsoft.com/en-us/windows/win32/api/verrsrc/ns-verrsrc-vs_fixedfileinfo)
    /// on *Microsoft Learn*.
    public struct FixedFileInfo: Hashable, Equatable, Sendable {
        /// The binary version number of this structure.
        ///
        /// The high-order word of this member contains the major version number,
        /// and the low-order word contains the minor version number.
        public let structVersion: UInt32
        /// The most significant 32 bits of the file's binary version number.
        ///
        /// This member is used with ``VersionInfo/FixedFileInfo/fileVersionLS`` to form a 64-bit value used for numeric comparisons.
        public let fileVersionMS: UInt32
        /// The least significant 32 bits of the file's binary version number.
        ///
        /// This member is used with ``VersionInfo/FixedFileInfo/fileVersionMS`` to form a 64-bit value used for numeric comparisons.
        public let fileVersionLS: UInt32
        /// The most significant 32 bits of the binary version number of the product with which this file was distributed.
        ///
        /// This member is used with ``VersionInfo/FixedFileInfo/productVersionLS`` to form a 64-bit value used for numeric comparisons.
        public let productVersionMS: UInt32
        /// The least significant 32 bits of the binary version number of the product with which this file was distributed.
        ///
        /// This member is used with ``VersionInfo/FixedFileInfo/productVersionMS`` to form a 64-bit value used for numeric comparisons.
        public let productVersionLS: UInt32
        /// Contains a bitmask that specifies the valid bits in ``VersionInfo/FixedFileInfo/fileFlags``.
        ///
        /// A bit is valid only if it was defined when the file was created.
        public let fileFlagsMask: UInt32
        /// Contains a bitmask that specifies the Boolean attributes of the file.
        public let fileFlags: UInt32
        /// The operating system for which this file was designed.
        public let fileOS: VOS
        /// The general type of file.
        public let fileType: VFT
        /// The function of the file.
        ///
        /// The possible values depend on the value of ``VersionInfo/FixedFileInfo/fileType``.
        public let fileSubtype: UInt32
        /// The most significant 32 bits of the file's 64-bit binary creation date and time stamp.
        public let fileDateMS: UInt32
        /// The least significant 32 bits of the file's 64-bit binary creation date and time stamp.
        public let fileDateLS: UInt32
        
        init?(data: Data) {
            var offset = 0
            
            let signature = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            guard signature == 0xFEEF04BD else { return nil }
            
            structVersion = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            fileVersionMS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            fileVersionLS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            productVersionMS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            productVersionLS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            fileFlagsMask = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            fileFlags = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            let rawFileOS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.fileOS = VOS(rawValue: rawFileOS)
            offset.move(by: UInt32.self)
            let rawFileType = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            self.fileType = VFT(rawValue: rawFileType)
            offset.move(by: UInt32.self)
            fileSubtype = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            fileDateMS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
            fileDateLS = data.load(fromByteOffset: offset, as: UInt32.self) ?? 0
            offset.move(by: UInt32.self)
        }
    }
}

extension VersionInfo.FixedFileInfo {
    /// The operating system for which this file was designed.
    public struct VOS: OptionSet, Hashable, Equatable, Sendable {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        /// The file was designed for MS-DOS.
        public static let dos = VOS(rawValue: 0x00010000)
        /// The file was designed for Windows NT.
        public static let nt = VOS(rawValue: 0x00040000)
        /// The file was designed for 16-bit Windows.
        public static let windows16 = VOS(rawValue: 0x00000001)
        /// The file was designed for 32-bit Windows.
        public static let windows32 = VOS(rawValue: 0x00000004)
        /// The file was designed for 16-bit OS/2.
        public static let os216 = VOS(rawValue: 0x00020000)
        /// The file was designed for 32-bit OS/2.
        public static let os232 = VOS(rawValue: 0x00030000)
        /// The file was designed for 16-bit Presentation Manager.
        public static let pm16 = VOS(rawValue: 0x00000002)
        /// The file was designed for 32-bit Presentation Manager.
        public static let pm32 = VOS(rawValue: 0x00000003)
    }
}

extension VersionInfo.FixedFileInfo {
    /// The general type of file
    public struct VFT: OptionSet, Hashable, Equatable, Sendable {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        /// The file contains an application.
        public static let app = VOS(rawValue: 0x00000001)
        /// The file contains a DLL.
        public static let dll = VOS(rawValue: 0x00000002)
        /// The file contains a device driver.
        public static let drv = VOS(rawValue: 0x00000003)
        /// The file contains a font.
        public static let font = VOS(rawValue: 0x00000004)
        /// The file contains a static-link library.
        public static let staticLibrary = VOS(rawValue: 0x00000007)
        /// The file contains a virtual device.
        public static let vxd = VOS(rawValue: 0x00000005)
    }
}
