//
//  BottleReference.swift
//  WineKit
//
//  Created by David Walter on 07.12.23.
//

import Foundation
import OSLog

/// A reference of a ``Bottle`` to store on disk
struct BottleReference: Hashable, Equatable, Codable {
    /// The unique id of the bottle
    let identifier: BottleIdentifier
    /// The name of the bottle
    let name: String
    /// The icon of the bottle
    let icon: BottleIcon
    /// Custom settings of the bottle
    let settings: BottleSettings
    
    init(bottle: Bottle) {
        self.identifier = bottle.identifier
        self.name = bottle.name
        self.icon = bottle.icon
        self.settings = bottle.settings
    }
}
