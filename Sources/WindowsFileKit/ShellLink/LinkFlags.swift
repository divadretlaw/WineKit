//
//  LinkFlags.swift
//  LinkKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

extension ShellLink {
    /// Link Flags
    ///
    /// For more information see
    /// [Shell Link - LinkFlags](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/ae350202-3ba9-4790-9e9e-98935f4ee5af)
    /// on *Microsoft Learn*.
    public struct LinkFlags: OptionSet, Hashable, Equatable, Sendable {
        public var rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        public static let hasLinkTargetIDList = LinkFlags(rawValue: 1 << 0)
        public static let hasLinkInfo = LinkFlags(rawValue: 1 << 1)
        public static let hasName = LinkFlags(rawValue: 1 << 2)
        public static let hasRelativePath = LinkFlags(rawValue: 1 << 3)
        public static let HasWorkingDir = LinkFlags(rawValue: 1 << 4)
        public static let HasArguments = LinkFlags(rawValue: 1 << 5)
        public static let hasIconLocation = LinkFlags(rawValue: 1 << 6)
        public static let isUnicode = LinkFlags(rawValue: 1 << 7)
        public static let ForceNoLinkInfo = LinkFlags(rawValue: 1 << 8)
        public static let HasExpString = LinkFlags(rawValue: 1 << 9)
        public static let RunInSeparateProcess = LinkFlags(rawValue: 1 << 10)
        // public static let unused = LinkFlags(rawValue: 1 << 11)
        public static let HasDarwinID = LinkFlags(rawValue: 1 << 12)
        public static let RunAsUser = LinkFlags(rawValue: 1 << 13)
        public static let HasExpIcon = LinkFlags(rawValue: 1 << 14)
        public static let NoPidlAlias = LinkFlags(rawValue: 1 << 15)
        // public static let unused = LinkFlags(rawValue: 1 << 16)
        public static let RunWithShimLayer = LinkFlags(rawValue: 1 << 17)
        public static let ForceNoLinkTrack = LinkFlags(rawValue: 1 << 18)
        public static let EnableTargetMetadata = LinkFlags(rawValue: 1 << 19)
        public static let DisableLinkPathTracking = LinkFlags(rawValue: 1 << 20)
        public static let DisableKnownFolderTracking = LinkFlags(rawValue: 1 << 21)
        public static let DisableKnownFolderAlias = LinkFlags(rawValue: 1 << 22)
        public static let AllowLinkToLink = LinkFlags(rawValue: 1 << 23)
        public static let UnaliasOnSave = LinkFlags(rawValue: 1 << 24)
        public static let PreferEnvironmentPath = LinkFlags(rawValue: 1 << 25)
        public static let KeepLocalIDListForUNCTarget = LinkFlags(rawValue: 1 << 26)
    }
}
