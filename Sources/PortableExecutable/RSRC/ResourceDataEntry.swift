//
//  ResourceDataEntry.swift
//  WineKit
//
//  Created by David Walter on 09.11.23.
//

import Foundation
#if canImport(AppKit)
import AppKit
#endif

/// Each Resource Data entry describes an actual unit of raw data in the Resource Data area
///
/// For more information see
/// [PE Format - Resource Data Entry](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#resource-data-entry)
/// on *Microsoft Learn*.
public struct ResourceDataEntry: Hashable, Equatable, Sendable {
    /// The address of a unit of resource data in the Resource Data area.
    public let dataRVA: UInt32
    /// The size, in bytes, of the resource data that is pointed to by the Data RVA field.
    public let size: UInt32
    /// The code page that is used to decode code point values within the resource data.
    ///
    /// Typically, the code page would be the Unicode code page.
    public let codePage: UInt32
    
    init?(fileHandle: FileHandle, offset: UInt64) {
        var offset = offset
        self.dataRVA = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
        offset.move(by: UInt32.self)
        self.size = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
        offset.move(by: UInt32.self)
        self.codePage = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
        offset.move(by: UInt32.self)
        let reserved = fileHandle.load(fromByteOffset: offset, as: UInt32.self) ?? 0
        offset.move(by: UInt32.self)
        guard reserved == 0 else { return nil }
    }
    
    /// Resolve the RVA in the given sections
    ///
    /// - Parameter sections: The sections this entry is part of.
    ///
    /// - Returns: The offset to the data
    public func resolveRVA(sections: [Section]) -> UInt32? {
        sections
            .first { section in
                section.virtualAddress <= dataRVA && dataRVA < (section.virtualAddress + section.virtualSize)
            }
            .map { section in
                section.pointerToRawData + (dataRVA - section.virtualAddress)
            }
    }
}
