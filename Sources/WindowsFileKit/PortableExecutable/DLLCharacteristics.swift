//
//  DLLCharacteristics.swift
//  WineKit
//
//  Created by David Walter on 01.12.23.
//

import Foundation

extension PortableExecutable {
    /// DLL Characteristics
    ///
    /// For more information see
    /// [PE Format - DLL Characteristics](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#dll-characteristics)
    /// on *Microsoft Learn*.
    public struct DLLCharacteristic: OptionSet, Hashable, Equatable, CustomStringConvertible, Sendable {
        public let rawValue: UInt16
        
        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }
        
        // case reserved = 0x0001
        // case reserved = 0x0002
        // case reserved = 0x0004
        // case reserved = 0x0008
        // case reserved = 0x0010
        /// Image can handle a high entropy 64-bit virtual address space
        public static let highEntropyVA = DLLCharacteristic(rawValue: 0x0020)
        /// DLL can be relocated at load time
        public static let dynamicBase = DLLCharacteristic(rawValue: 0x0040)
        /// Code Integrity checks are enforced
        public static let forceIntegrity = DLLCharacteristic(rawValue: 0x0080)
        /// Image is NX compatible
        public static let nxCompact = DLLCharacteristic(rawValue: 0x0100)
        /// Isolation aware, but do not isolate the image
        public static let noIsolation = DLLCharacteristic(rawValue: 0x0200)
        /// Does not use structured exception (SE) handling
        ///
        /// No SE handler may be called in this image.
        public static let noSEH = DLLCharacteristic(rawValue: 0x0400)
        /// Do not bind the image
        public static let noBind = DLLCharacteristic(rawValue: 0x0800)
        /// Image must execute in an AppContainer
        public static let appContainer = DLLCharacteristic(rawValue: 0x1000)
        /// A WDM driver
        public static let wdmDriver = DLLCharacteristic(rawValue: 0x2000)
        /// Image supports Control Flow Guard
        public static let guardCF = DLLCharacteristic(rawValue: 0x4000)
        /// Terminal Server aware
        public static let terminalServerAware = DLLCharacteristic(rawValue: 0x8000)
        
        // MARK: - CustomStringConvertible
        
        public var description: String {
            switch self {
            case .highEntropyVA:
                return "Image can handle a high entropy 64-bit virtual address space"
            case .dynamicBase:
                return "DLL can be relocated at load time"
            case .forceIntegrity:
                return "Code Integrity checks are enforced"
            case .nxCompact:
                return "Image is NX compatible"
            case .noIsolation:
                return "Isolation aware, but do not isolate the image"
            case .noSEH:
                return "Does not use structured exception (SE) handling. No SE handler may be called in this image"
            case .noBind:
                return "Do not bind the image"
            case .appContainer:
                return "Image must execute in an AppContainer"
            case .wdmDriver:
                return "A WDM driver"
            case .guardCF:
                return "Image supports Control Flow Guard"
            case .terminalServerAware:
                return "Terminal Server aware"
            default:
                return "Option is reserved for future use"
            }
        }
    }
}
