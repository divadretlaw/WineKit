//
//  WinePackageVersion.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import Foundation

public enum WinePackageVersion: String, Identifiable, Hashable, Equatable, Codable, Sendable {
    case stable = "stable"
    case development = "devel"
    case staging = "staging"
    
    // MARK: - Identifiable
    
    public var id: String {
        rawValue
    }
}
