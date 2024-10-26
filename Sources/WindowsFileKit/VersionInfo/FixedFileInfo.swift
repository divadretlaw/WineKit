//
//  File.swift
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
        public let structVersion: UInt32
        public let fileVersionMS: UInt32
        public let fileVersionLS: UInt32
        public let productVersionMS: UInt32
        public let productVersionLS: UInt32
        public let fileFlagsMask: UInt32
        public let fileFlags: UInt32
        public let fileOS: VOS
        public let fileType: VFT
        public let fileSubtype: UInt32
        public let fileDateMS: UInt32
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
