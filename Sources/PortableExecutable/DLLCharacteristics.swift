//
//  DLLCharacteristics.swift
//  WineKit
//
//  Created by David Walter on 01.12.23.
//

import Foundation

/// DLL Characteristics
///
/// For more information see
/// [PE Format - DLL Characteristics](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#dll-characteristics)
/// on *Microsoft Learn*.
public enum DLLCharacteristic: UInt16, CaseIterable, Hashable, Equatable, CustomStringConvertible, Sendable {
    // case reserved = 0x0001
    // case reserved = 0x0002
    // case reserved = 0x0004
    // case reserved = 0x0008
    // case reserved = 0x0010
    /// Image can handle a high entropy 64-bit virtual address space
    case highEntropyVA = 0x0020
    /// DLL can be relocated at load time
    case dynamicBase = 0x0040
    /// Code Integrity checks are enforced
    case forceIntegrity = 0x0080
    /// Image is NX compatible
    case nxCompact = 0x0100
    /// Isolation aware, but do not isolate the image
    case noIsolation = 0x0200
    /// Does not use structured exception (SE) handling
    ///
    /// No SE handler may be called in this image.
    case noSEH = 0x0400
    /// Do not bind the image
    case noBind = 0x0800
    /// Image must execute in an AppContainer
    case appContainer = 0x1000
    /// A WDM driver
    case wdmDriver = 0x2000
    /// Image supports Control Flow Guard
    case guardCF = 0x4000
    /// Terminal Server aware
    case terminalServerAware = 0x8000
    
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
        }
    }
}

extension Set where Element == DLLCharacteristic {
    init(rawValue: UInt16) {
        let values = DLLCharacteristic.allCases
            .filter { flag in
                (flag.rawValue & rawValue) != 0
            }
        self = Set(values)
    }
}
