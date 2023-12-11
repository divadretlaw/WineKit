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
                let executable = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/bin/wine64", directoryHint: .isDirectory, relativeTo: nil)
                let prefix = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
                try? FileManager.default.createDirectory(at: prefix, withIntermediateDirectories: true)
                let wine = Wine(executable: executable, bottle: prefix)
                try await wine.registry.changeWindowsVersion(.windows10)
                self._wine = wine
                return wine
            }
        }
    }
    
    private static var _wineServer: WineServer?
    static var wineServer: WineServer {
        get async throws {
            if let wineServer = _wineServer {
                return wineServer
            } else {
                let wine = try await wine
                let executable = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/bin/wineServer", directoryHint: .isDirectory, relativeTo: nil)
                let wineServer = WineServer(executable: executable, bottle: wine.bottle)
                self._wineServer = wineServer
                return wineServer
            }
        }
    }
    
    static func delete() throws {
        guard let wine = _wine else { return }
        try FileManager.default.removeItem(at: wine.bottle.url)
    }
}
