//
//  WineLoader.swift
//  WineKit
//
//  Created by David Walter on 03.12.23.
//

import Foundation
@testable import WineKit

enum WineLoader {
    private static var _wine: Wine?
    static var wine: Wine {
        get async throws {
            if let wine = _wine {
                return wine
            } else {
                let folder = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/bin", directoryHint: .isDirectory, relativeTo: nil)
                let prefix = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
                try? FileManager.default.createDirectory(at: prefix, withIntermediateDirectories: true)
                let wine = Wine(binFolder: folder, prefix: prefix)
                try await wine.registry.changeWindowsVersion(.windows10)
                self._wine = wine
                return wine
            }
        }
    }
    
    static func delete() throws {
        guard let wine = _wine else { return }
        try FileManager.default.removeItem(at: wine.prefix)
    }
}
