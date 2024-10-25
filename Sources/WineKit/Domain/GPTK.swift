//
//  GPTK.swift
//  WineKit
//
//  Created by David Walter on 22.10.24.
//

import Foundation
import Metal

public struct GPTK: Hashable, Equatable, Codable, Sendable {
    /// Advertise AVX
    /// > Note:
    /// > Will only be enabled on macOS 15+
    public var avx: Bool
    /// Enable DirectX Ray-Tracing
    /// > Note:
    /// > Will only be enabled on device that support ray tracing
    public var dxr: Bool
    /// Enable Metal HUD
    public var hud: Bool
    
    public init() {
        self.avx = false
        self.dxr = false
        self.hud = false
    }
    
    /// Environment value for `GPTK` values
    public var environment: [String: String] {
        var environment: [String: String] = [:]
        
        if #available(macOS 15, *) {
            if avx {
                environment["ROSETTA_ADVERTISE_AVX"] = "1"
            }
        }
        
        if dxr, let device = MTLCreateSystemDefaultDevice(), device.supportsRaytracing {
            environment["D3DM_SUPPORT_DXR"] = "1"
        }
        
        if hud {
            environment["MTL_HUD_ENABLED"] = "1"
        }
        
        return environment
    }
}
