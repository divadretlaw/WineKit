//
//  ProgramReference.swift
//  WineKit
//
//  Created by David Walter on 07.12.23.
//

import Foundation
import OSLog

/// A reference of a ``Program`` to store on disk
struct ProgramReference: Hashable, Equatable, Codable, Sendable {
    /// The name of the program
    let name: String
    /// Custom settings of the program
    let settings: ProgramSettings
    
    init(program: Program) {
        self.name = program.name
        self.settings = program.settings
    }
}
