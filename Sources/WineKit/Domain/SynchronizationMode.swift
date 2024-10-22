//
//  SynchronizationMode.swift
//  WineKit
//
//  Created by David Walter on 05.11.23.
//

import Foundation

/// WineServer synchronization mode
public enum SynchronizationMode: String, CaseIterable, Codable, Identifiable, Hashable, Equatable, Sendable {
    case disabled
    /// eventfd-based synchronization
    case esync = "WINEESYNC"
    /// Mach semaphore-based synchronization
    ///
    /// See [Wine MSync](https://github.com/marzent/wine-msync)
    case msync = "WINEMSYNC"
    
    // MARK: - Identifiable
    
    public var id: String {
        rawValue
    }
}

extension SynchronizationMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .disabled:
            return "Disabled"
        case .esync:
            return "ESync"
        case .msync:
            return "MSync"
        }
    }
}
