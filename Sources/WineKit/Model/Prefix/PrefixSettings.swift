//
//  PrefixSettings.swift
//  WineKit
//
//  Created by David Walter on 05.11.23.
//

import Foundation

public struct PrefixSettings: Hashable, Equatable, Codable, Sendable {
    // MARK: - Synchronization Mode
    
    public var synchronizationMode: SynchronizationMode
    
    // MARK: - DXVK
    
    public var dxvk: DXVK
    public var dxvkHud: [DXVK.HUD]
    
    // MARK: - DXMT
    
    public var dxmt: DXMT
    
    // MARK: - Rosetta 2
    
    public var advertiseAVX: Bool
    
    // MARK: - Metal
    
    public var showMetalHud: Bool
    
    // MARK: -
    
    init() {
        self.synchronizationMode = .esync
        self.dxvk = .disabled
        self.dxvkHud = []
        self.dxmt = .disabled
        self.showMetalHud = false
        self.advertiseAVX = false
    }
    
    public var environment: [String: String] {
        var environment: [String: String] = [:]
        
        // Synchronization Mode
        
        environment.merge(synchronizationMode.environment) { _, new in
            new
        }
        
        // DXVK
        
        environment.merge(dxvk.environment) { _, new in
            new
        }
        
        environment.merge(dxvkHud.environment) { _, new in
            new
        }
        
        // DXMT
        
        environment.merge(dxmt.environment) { _, new in
            new
        }
        
        // Metal
        
        if showMetalHud {
            environment["MTL_HUD_ENABLED"] = "1"
        }
        
        // Rosetta 2
        
        if #available(macOS 15, *) {
            if advertiseAVX {
                environment["ROSETTA_ADVERTISE_AVX"] = "1"
            }
        }
        
        return environment
    }
}
