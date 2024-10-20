//
//  UInt64Extensions.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

extension UInt64 {
    mutating func move<T>(by identifier: T.Type) {
        self += UInt64(MemoryLayout<T>.size)
    }
    
    func moved<T>(by identifier: T.Type) -> UInt64 {
        self + UInt64(MemoryLayout<T>.size)
    }
}
