//
//  Logger.swift
//  WineKit
//
//  Created by David Walter on 03.11.23.
//

import Foundation
import OSLog

extension Logger {
    static let wine: Logger = {
        Logger(subsystem: "at.davidwalter.WineKit", category: "Wine")
    }()
    
    static let wineKit: Logger = {
        Logger(subsystem: "at.davidwalter.WineKit", category: "WineKit")
    }()
    
    init(process: WineProcess) {
        self = Logger(subsystem: "at.davidwalter.WineKit", category: process.description)
    }
}
