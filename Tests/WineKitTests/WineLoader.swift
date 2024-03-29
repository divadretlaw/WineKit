//
//  WineLoader.swift
//  WineKit
//
//  Created by David Walter on 03.12.23.
//

import Foundation
@testable import WineKit

final actor WineLoader: @unchecked Sendable {
    private var wine: Wine?
    private var wineServer: WineServer?
    
    static let shared = WineLoader()
    
    private func set(wine: Wine?) {
        self.wine = wine
    }
    
    private func set(wineServer: WineServer?) {
        self.wineServer = wineServer
    }
    
    static var wine: Wine {
        get async throws {
            if let wine = await shared.wine {
                return wine
            } else {
                let executable = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/bin/wine64", directoryHint: .isDirectory, relativeTo: nil)
                let prefix = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
                try? FileManager.default.createDirectory(at: prefix, withIntermediateDirectories: true)
                let wine = Wine(executable: executable, prefix: prefix)
                try await wine.registry.changeWindowsVersion(.windows10)
                await shared.set(wine: wine)
                return wine
            }
        }
    }
    
    static var wineServer: WineServer {
        get async throws {
            if let wineServer = await shared.wineServer {
                return wineServer
            } else {
                let wine = try await wine
                let executable = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/bin/wineServer", directoryHint: .isDirectory, relativeTo: nil)
                let wineServer = WineServer(executable: executable, prefix: wine.prefix)
                await shared.set(wineServer: wineServer)
                return wineServer
            }
        }
    }
    
    static func delete() async throws {
        guard let wine = await shared.wine else { return }
        try FileManager.default.removeItem(at: wine.prefix.url)
    }
}
