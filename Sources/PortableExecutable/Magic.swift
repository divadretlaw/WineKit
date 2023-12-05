//
//  PortableExecutable+Magic.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

/// The magic number that identifies the type of the PE image
public enum Magic: UInt16, Hashable, Equatable, CustomStringConvertible, Sendable {
    /// Unknown
    case unknown = 0x0
    /// ROM
    case rom = 0x107
    /// PE32
    case pe32 = 0x10b
    /// PE32+
    case pe32Plus = 0x20b
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        switch self {
        case .unknown:
            return "unknown"
        case .rom:
            return "ROM"
        case .pe32:
            return "PE32"
        case .pe32Plus:
            return "PE32+"
        }
    }
}
