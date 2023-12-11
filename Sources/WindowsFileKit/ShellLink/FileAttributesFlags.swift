//
//  FileAttributesFlags.swift
//  LinkKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

extension ShellLink {
    /// File Attributes Flags
    ///
    /// For more information see
    /// [Shell Link - FileAttributesFlags](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/378f485c-0be9-47a4-a261-7df467c3c9c6)
    /// on *Microsoft Learn*.
    public struct FileAttributesFlags: OptionSet, Hashable, Equatable, Sendable {
        public var rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        public static let readOnly = FileAttributesFlags(rawValue: 1 << 0)
        public static let hidden = FileAttributesFlags(rawValue: 1 << 1)
        public static let system = FileAttributesFlags(rawValue: 1 << 2)
        // public static let reserved = FileAttributesFlags(rawValue: 1 << 3)
        public static let directory = FileAttributesFlags(rawValue: 1 << 4)
        public static let archive = FileAttributesFlags(rawValue: 1 << 5)
        // public static let reserved = FileAttributesFlags(rawValue: 1 << 6)
        public static let normal = FileAttributesFlags(rawValue: 1 << 7)
        public static let temporary = FileAttributesFlags(rawValue: 1 << 8)
        public static let sparseFile = FileAttributesFlags(rawValue: 1 << 9)
        public static let reparsePoint = FileAttributesFlags(rawValue: 1 << 10)
        public static let compressed = FileAttributesFlags(rawValue: 1 << 11)
        public static let offline = FileAttributesFlags(rawValue: 1 << 12)
        public static let noContentIndexed = FileAttributesFlags(rawValue: 1 << 13)
        public static let encrypted = FileAttributesFlags(rawValue: 1 << 14)
    }
}
