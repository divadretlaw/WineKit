//
//  StringExtensions.swift
//  WineKit
//
//  Created by David Walter on 08.12.23.
//

import Foundation
import CryptoKit

extension String {
    var sha256: String {
        let data = Data(utf8)
        let hashed = SHA256.hash(data: data)
        return hashed
            .compactMap {
                String(format: "%02x", $0)
            }
            .joined()
    }
}
