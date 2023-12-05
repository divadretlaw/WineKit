//
//  ResourceType.swift
//  WineKit
//
//  Created by David Walter on 10.11.23.
//

import Foundation

/// The type of the resource
///
/// For more information see
/// [Resource Types](https://learn.microsoft.com/en-us/windows/win32/menurc/resource-types)
/// on *Microsoft Learn*.
public enum ResourceType: UInt32, CaseIterable, Hashable, Equatable {
    /// Hardware-dependent cursor resource
    case cursor = 1
    /// Bitmap resource
    case bitmap = 2
    /// Hardware-dependent icon resource
    case icon = 3
    /// Menu resource
    case menu = 4
    /// Dialog box
    case dialog = 5
    /// String-table entr
    case string = 6
    /// Font directory resource
    case fontDirectory = 7
    /// Font resource
    case font = 8
    /// Accelerator table
    case accelerator = 9
    /// Application-defined resource (raw data)
    case rcData = 10
    /// Message-table entry
    case messageTable = 11
    /// Hardware-independent cursor resource
    case groupCursor = 12 // cursor + 11
    /// Hardware-independent icon resource
    case groupIcon = 14 // icon + 11
    /// Version resource
    case version = 16
    /// Allows a resource editing tool to associate a string with an .rc file.
    ///
    /// Typically, the string is the name of the header file that provides symbolic names.
    /// The resource compiler parses the string but otherwise ignores the value. For example,
    case dlgInclude = 17
    /// Plug and Play resource
    case plugAndPlay = 19
    /// VXD
    case vxd = 20
    /// Animated cursor
    case animatedCursor = 21
    /// Animated icon
    case animatedIcon = 22
    /// HTML resource
    case html = 23
    /// Side-by-Side Assembly Manifest
    case manifest = 24
}
