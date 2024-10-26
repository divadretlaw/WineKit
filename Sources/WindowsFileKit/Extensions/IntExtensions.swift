//
//  IntExtensions.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension Int {
    mutating func move<T>(by identifier: T.Type) {
        self += MemoryLayout<T>.size
    }
    
    func moved<T>(by identifier: T.Type) -> Int {
        self + MemoryLayout<T>.size
    }
}
