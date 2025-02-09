//
//  WineOutput.swift
//  WineKit
//
//  Created by David Walter on 24.11.23.
//

import Foundation

/// The output of a ``WineProcess``
public enum WineOutput: Hashable, Equatable, Sendable {
    /// The process has launched
    case launched
    /// The process wrote to `stdout`
    case output(String)
    /// The process wrote to `stderr`
    case error(String)
    /// The process has terminated
    case terminated
}
