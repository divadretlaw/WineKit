//
//  Characteristics.swift
//  WineKit
//
//  Created by David Walter on 01.12.23.
//

import Foundation

/// Characteristics
///
/// For more information see
/// [PE Format - Characteristics](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#characteristics)
/// on *Microsoft Learn*.
public enum Characteristic: UInt16, CaseIterable, Hashable, Equatable, CustomStringConvertible, Sendable {
    case relocsStripped = 0x0001
    case executableImage = 0x0002
    case lineNumsStripped = 0x0004
    case localSymsStripped = 0x0008
    case aggressiveWSTrim = 0x0010
    case largeAddressAware = 0x0020
    // case reserved = 0x0040
    case bytesReservedLo = 0x0080
    case machine32bit = 0x0100
    case debugStripped = 0x0200
    case removableRunFromSwap = 0x0400
    case netRunFromSwap = 0x0800
    case system = 0x1000
    case dll = 0x2000
    case upSystemOnly = 0x4000
    case bytesReservedHi = 0x8000
    
    // MARK: - CustomStringConvertible
    
    // swiftlint:disable line_length
    public var description: String {
        switch self {
        case .relocsStripped:
            return "Image only, Windows CE, and Microsoft Windows NT and later. This indicates that the file does not contain base relocations and must therefore be loaded at its preferred base address. If the base address is not available, the loader reports an error. The default behavior of the linker is to strip base relocations from executable (EXE) files"
        case .executableImage:
            return "Image only. This indicates that the image file is valid and can be run. If this flag is not set, it indicates a linker error"
        case .lineNumsStripped:
            return "COFF line numbers have been removed. This flag is deprecated and should be zero"
        case .localSymsStripped:
            return "COFF symbol table entries for local symbols have been removed. This flag is deprecated and should be zero"
        case .aggressiveWSTrim:
            return "Obsolete. Aggressively trim working set. This flag is deprecated for Windows 2000 and later and must be zero"
        case .largeAddressAware:
            return "Image can handle a high entropy 64-bit virtual address space"
        case .bytesReservedLo:
            return "Little endian: the least significant bit (LSB) precedes the most significant bit (MSB) in memory. This flag is deprecated and should be zero"
        case .machine32bit:
            return "Machine is based on a 32-bit-word architecture"
        case .debugStripped:
            return "Debugging information is removed from the image file"
        case .removableRunFromSwap:
            return "If the image is on removable media, fully load it and copy it to the swap file"
        case .netRunFromSwap:
            return "If the image is on network media, fully load it and copy it to the swap file"
        case .system:
            return "The image file is a system file, not a user program"
        case .dll:
            return "The image file is a dynamic-link library (DLL). Such files are considered executable files for almost all purposes, although they cannot be directly run"
        case .upSystemOnly:
            return "The file should be run only on a uniprocessor machine"
        case .bytesReservedHi:
            return "Big endian: the MSB precedes the LSB in memory. This flag is deprecated and should be zero"
        }
        // swiftlint:enable line_length
    }
}

extension Set where Element == Characteristic {
    init(rawValue: UInt16) {
        let values = Characteristic.allCases
            .filter { flag in
                (flag.rawValue & rawValue) != 0
            }
        self = Set(values)
    }
}
