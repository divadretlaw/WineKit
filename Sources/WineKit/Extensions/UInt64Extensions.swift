//
//  UInt64Extensions.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

extension UInt64 {
    mutating func move<T>(by: T.Type) { // swiftlint:disable:this identifier_name
        self += UInt64(MemoryLayout<T>.size)
    }
    
    func moved<T>(by: T.Type) -> UInt64 { // swiftlint:disable:this identifier_name
        self + UInt64(MemoryLayout<T>.size)
    }
}
