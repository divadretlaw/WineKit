//
//  PrefixSettings.swift
//  WineKit
//
//  Created by David Walter on 05.11.23.
//

import Foundation

public struct PrefixSettings: Hashable, Equatable, Codable {
    // MARK: - Synchronization Mode
    
    public var synchronizationMode: SynchronizationMode
    
    // MARK: - DXVK
    
    public var dxvk: DXVK
    public var dxvkHud: [DXVK.HUD]
    
    // MARK: - Metal
    
    public var showMetalHud: Bool
    
    init() {
        self.synchronizationMode = .esync
        self.dxvk = .disabled
        self.dxvkHud = []
        self.showMetalHud = false
    }
    
    public var environment: [String: String] {
        var environment: [String: String] = [:]
        switch synchronizationMode {
        case .disabled:
            break
        default:
            environment[synchronizationMode.rawValue] = "1"
        }
        
        environment.merge(dxvk.environment) { _, new in
            new
        }
        
        environment["DXVK_HUD"] = dxvkHud.environment
        
        if showMetalHud {
            environment["MTL_HUD_ENABLED"] = "1"
        }
        
        return environment
    }
}
