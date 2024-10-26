//
//  File.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

/// Represents the organization of data in a file-version resource.
///
/// It is the root structure that contains all other file-version information structures.
///
/// For more information see
/// [VS_VERSIONINFO](https://learn.microsoft.com/en-us/windows/win32/menurc/vs-versioninfo)
/// on *Microsoft Learn*.
public struct VersionInfo: Hashable, Equatable, Sendable {
    private static let KEY = Data(
        [
            0x56, 0x00, // V
            0x53, 0x00, // S
            0x5f, 0x00, // _
            0x56, 0x00, // V
            0x45, 0x00, // E
            0x52, 0x00, // R
            0x53, 0x00, // S
            0x49, 0x00, // I
            0x4f, 0x00, // O
            0x4e, 0x00, // N
            0x5f, 0x00, // _
            0x49, 0x00, // I
            0x4e, 0x00, // N
            0x46, 0x00, // F
            0x4f, 0x00, // O
        ]
    )
    
    public let length: UInt16
    public let valueLength: UInt16
    public let type: VersionInfoType
    public let value: FixedFileInfo?
    public let stringFileInfo: StringFileInfo?
    public let varFileInfo: VarFileInfo?
    
    init?(data: Data) {
        var offset = 0
        
        let length = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
        self.length = length
        offset.move(by: UInt16.self)
        
        let valueLength = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
        offset.move(by: UInt16.self)
        self.valueLength = valueLength
        
        let rawType = data.load(fromByteOffset: offset, as: UInt16.self) ?? 0
        offset.move(by: UInt16.self)
        guard let type = VersionInfoType(rawValue: rawType) else { return nil }
        self.type = type
        
        let keyCount = VersionInfo.KEY.count
        guard
            let key = data.loadData(fromByteOffset: offset, upToCount: keyCount),
            key == VersionInfo.KEY
        else {
            return nil
        }
        offset += keyCount
        
        // Apply padding if needed
        offset = data.paddedOffset(fromByteOffset: offset)
        
        if valueLength == 0 {
            self.value = nil
        } else {
            guard let value = data.load(fromByteOffset: offset, as: FixedFileInfo.self) else { return nil }
            self.value = value
        }
        offset += Int(valueLength)
        
        // Apply padding if needed
        offset = data.paddedOffset(fromByteOffset: offset)
        
        if let stringFileInfo = StringFileInfo(data: data.copyBytes(offset...)) {
            self.stringFileInfo = stringFileInfo
            offset += Int(stringFileInfo.length)
        } else {
            self.stringFileInfo = nil
        }
        
        // Apply padding if needed
        offset = data.paddedOffset(fromByteOffset: offset)
        
        if let varFileInfo = VarFileInfo(data: data.copyBytes(offset...)) {
            self.varFileInfo = varFileInfo
            offset += Int(varFileInfo.length)
        } else {
            self.varFileInfo = nil
        }
    }
}

extension VersionInfo {
    public enum VersionInfoType: UInt16, Hashable, Equatable, Sendable {
        case binary = 0
        case text = 1
    }
    
}
