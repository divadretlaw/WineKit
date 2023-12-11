//
//  DXVK.swift
//  WineKit
//
//  Created by David Walter on 08.12.23.
//

import Foundation

public enum DXVK: Hashable, Equatable, Codable {
    case disabled
    case enabled
    case async
    
    var environment: [String: String] {
        switch self {
        case .disabled:
            return [:]
        case .enabled:
            return ["WINEDLLOVERRIDES": "d3d11,d3d10core,dxgi,d3d9=n,b"]
        case .async:
            return ["WINEDLLOVERRIDES": "d3d11,d3d10core,dxgi,d3d9=n,b", "DXVK_ASYNC": "1"]
        }
    }
}

extension DXVK {
    public enum HUD: Hashable, Equatable, Codable {
        case devinfo
        case fps
        case frametimes
        case submissions
        case drawcalls
        case pipelines
        case descriptors
        case memory
        case gpuload
        case version
        case api
        case cs
        case compiler
        case samplers
        case scale(Double)
        case opacity(Double)
        case full
        
        public var rawValue: String {
            switch self {
            case .devinfo:
                return "devinfo"
            case .fps:
                return "fps"
            case .frametimes:
                return "frametimes"
            case .submissions:
                return "submissions"
            case .drawcalls:
                return "drawcalls"
            case .pipelines:
                return "pipelines"
            case .descriptors:
                return "descriptors"
            case .memory:
                return "memory"
            case .gpuload:
                return "gpuload"
            case .version:
                return "version"
            case .api:
                return "api"
            case .cs:
                return "cs"
            case .compiler:
                return "compiler"
            case .samplers:
                return "samplers"
            case let .scale(value):
                return "scale=\(value)"
            case let .opacity(value):
                return "opacity=\(value)"
            case .full:
                return "full"
            }
        }
    }
}

extension [DXVK.HUD] {
    var environment: String? {
        guard !isEmpty else {
            return nil
        }
        
        if contains(.full) {
            return "full"
        } else {
            return map { $0.rawValue }.joined(separator: ",")
        }
    }
}
