//
//  DictionaryExtensions.swift
//  WineKit
//
//  Created by David Walter on 04.12.23.
//

import Foundation

extension Dictionary where Key: Hashable {
    func merging(
        _ other: [Key: Value]?,
        uniquingKeysWith combine: (Value, Value) throws -> Value
    ) rethrows -> [Key: Value] {
        guard let other else { return self }
        return try merging(other, uniquingKeysWith: combine)
    }
}
