//
//  FileHandleExtensions.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

extension FileHandle {
    @_disfavoredOverload
    func load<T>(fromByteOffset offset: UInt32 = 0, as type: T.Type) -> T? {
        load(fromByteOffset: UInt64(offset), as: type)
    }
    
    func load<T>(fromByteOffset offset: UInt64 = 0, as type: T.Type) -> T? {
        do {
            try seek(toOffset: offset)
            if let data = try read(upToCount: MemoryLayout<T>.size) {
                return data.withUnsafeBytes { pointer in
                    pointer.loadUnaligned(as: T.self)
                }
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    func loadData(fromByteOffset offset: UInt64 = 0, upToCount: Int) -> Data? {
        do {
            try seek(toOffset: offset)
            if let data = try read(upToCount: upToCount) {
                return data
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
