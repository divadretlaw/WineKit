//
//  ShowCommand.swift
//  LinkKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

extension ShellLink {
    public enum ShowCommand: UInt32, Hashable, Equatable, Sendable {
        case normal = 0x00000001
        case maximized = 0x00000003
        case minNoActive = 0x00000007
    }
}
