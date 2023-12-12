//
//  WineCommands.swift
//  WineKit
//
//  Created by David Walter on 03.12.23.
//

import Foundation

/// A collection of helper commands
public final class WineCommands {
    private let wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    
    /// Open the Wine Control Panel
    public func controlPanel() async throws {
        try await wine.runSystem(["control"])
    }
    
    /// Open the registry editor
    public func registryEditor() async throws {
        try await wine.runSystem(["regedit"])
    }
    
    /// Open the Wine Configuration GUI
    public func configurationGUI() async throws {
        try await wine.runSystem(["winecfg"])
    }
    
    /// Open the Wine Task Manager
    public func taskManager() async throws {
        try await wine.runSystem(["taskmgr"])
    }
}
