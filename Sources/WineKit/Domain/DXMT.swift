//
//  DXMT.swift
//  WineKit
//
//  Created by David Walter on 22.10.24.
//

import Foundation

public enum DXMT: Hashable, Equatable, Codable, Sendable {
    /// DXMT is disabled
    case disabled
    /// DXMT is enabled
    case enabled
    
    /// Environment values for ``DXMT``
    public var environment: [String: String] {
        switch self {
        case .disabled:
            return [:]
        case .enabled:
            return ["WINEDLLOVERRIDES": "dxgi,d3d11,d3d10core=n,b"]
        }
    }
}
