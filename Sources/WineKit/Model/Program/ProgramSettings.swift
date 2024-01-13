//
//  ProgramSettings.swift
//  CellarKit
//
//  Created by David Walter on 12.11.23.
//

import Foundation

public struct ProgramSettings: Hashable, Equatable, Codable, Sendable {
    public var arguments: String
    public var environment: [String: String]
    
    init() {
        self.arguments = ""
        self.environment = [:]
    }
}
