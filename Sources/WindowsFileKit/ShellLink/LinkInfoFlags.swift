//
//  LinkInfoFlags.swift
//  WineKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

extension ShellLink {
    /// Link Info Flag
    public struct LinkInfoFlags: OptionSet, Hashable, Equatable, Sendable {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        public static let volumeIDAndLocalBasePath = LinkInfoFlags(rawValue: 1 << 0)
        public static let commonNetworkRelativeLinkAndPathSuffix = LinkInfoFlags(rawValue: 1 << 1)
    }
}
