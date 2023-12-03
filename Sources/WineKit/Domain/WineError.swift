//
//  WineError.swift
//  WineKit
//
//  Created by David Walter on 06.11.23.
//

import Foundation

/// Errors in WineKit
public enum WineError: Error {
    /// The wine process exited with an error
    case crash(String)
    /// The response was invalid
    case invalidResponse
}
