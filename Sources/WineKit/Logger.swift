//
//  Logger.swift
//  WineKit
//
//  Created by David Walter on 03.11.23.
//

import Foundation
import OSLog

extension Logger {
    static var wine: Logger {
        Logger(subsystem: "at.davidwalter.WineKit", category: "Wine")
    }
    
    static var wineKit: Logger {
        Logger(subsystem: "at.davidwalter.WineKit", category: "WineKit")
    }
    
    init(process: WineProcess) {
        self = Logger(subsystem: "at.davidwalter.WineKit", category: process.description)
    }
}
