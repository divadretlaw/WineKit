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
    
    // MARK: - DXMT
    
    public var dxmt: DXMT
    
    // MARK: - GPTK
    
    public var gptk: GPTK
    
    // MARK: -
    
    init() {
        self.synchronizationMode = .esync
        self.dxvk = DXVK()
        self.dxmt = DXMT()
        self.gptk = GPTK()
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
        
        // DXMT
        
        environment.merge(dxmt.environment) { _, new in
            new
        }
        
        // GPTK
        
        environment.merge(gptk.environment) { _, new in
            new
        }
        
        return environment
    }
}
