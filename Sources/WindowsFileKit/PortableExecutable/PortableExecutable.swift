//
//  COFFHeader.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

/// Microsoft Portable Executable
///
/// For more information see
/// [PE Format](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format)
/// on *Microsoft Learn*.
public struct PortableExecutable: Hashable, Equatable, Sendable {
    /// The location of the portable executable
    public let url: URL
    /// COFF File Header (Object and Image)
    public let coffHeader: COFFHeader
    /// Optional Header
    public let optionalHeader: OptionalHeader?
    /// Section Table (Section Headers)
    public let sections: [Section]
    
    /// Initialize a ``PortableExecutable``
    ///
    /// - Parameter url: The location of the portable executable
    ///
    /// Returns `nil` if the file at the location is not a valid portable executable file.
    public init?(url: URL?) {
        guard let url else { return nil }
        self.init(url: url)
    }
    
    /// Initialize a ``PortableExecutable``
    ///
    /// - Parameter url: The location of the portable executable
    ///
    /// Returns `nil` if the file at the location is not a valid portable executable file.
    public init?(url: URL) {
        self.url = url
        guard let fileHandle = try? FileHandle(forReadingFrom: url) else {
            return nil
        }
        
        defer {
            try? fileHandle.close()
        }
        
        // (0x3C) Pointer to PE Header
        guard let peOffset = fileHandle.load(fromByteOffset: 0x3C, as: UInt32.self) else {
            return nil
        }
        
        guard let coffHeader = COFFHeader(fileHandle: fileHandle, offset: UInt64(peOffset)) else {
            return nil
        }
        self.coffHeader = coffHeader
        
        var offset = UInt64(peOffset).moved(by: COFFHeader.self)
        
        if coffHeader.sizeOfOptionalHeader > 0 {
            let optionalHeader = OptionalHeader(fileHandle: fileHandle, offset: offset)
            self.optionalHeader = optionalHeader
        } else {
            self.optionalHeader = nil
        }
        offset += UInt64(coffHeader.sizeOfOptionalHeader)
        
        var sections: [Section] = []
        for _ in 0..<coffHeader.numberOfSections {
            if let section = Section(fileHandle: fileHandle, offset: offset) {
                sections.append(section)
            }
            offset.move(by: Section.self)
        }
        self.sections = sections
    }
    
    /// The name of the executable
    public var name: String {
        url.lastPathComponent
    }
    
    public subscript(section name: String) -> Section? {
        sections.first { $0.name == name }
    }
    
    /// The resource directory table of the given section
    ///
    /// - Parameters:
    ///   - types: Only read entrys of the given types. Only applies to the root table. Defaults to `nil`.
    /// - Returns: The ``ResourceDirectoryTable`` for the section
    public func rsrc(types: [ResourceType]? = nil) throws -> ResourceDirectoryTable? {
        guard let section = self[section: ".rsrc"] else { return nil }
        
        let fileHandle = try FileHandle(forReadingFrom: url)
        defer {
            try? fileHandle.close()
        }
        
        return ResourceDirectoryTable(
            fileHandle: fileHandle,
            pointerToRawData: UInt64(section.pointerToRawData),
            types: types
        )
    }
    
    /// The resource directory table of the given section
    ///
    /// - Parameters:
    ///   - types: Only read entrys of the given types. Only applies to the root table. Defaults to `nil`.
    /// - Returns: The ``ResourceDirectoryTable`` for the section
    public func rsrcEntryData(types: [ResourceType]? = nil) throws -> [Data]? {
        guard let section = self[section: ".rsrc"] else { return nil }
        
        let fileHandle = try FileHandle(forReadingFrom: url)
        defer {
            try? fileHandle.close()
        }
        
        let table = ResourceDirectoryTable(
            fileHandle: fileHandle,
            pointerToRawData: UInt64(section.pointerToRawData),
            types: types
        )
        
        return table.allEntries
            .compactMap { entry -> Data? in
                guard let offset = entry.resolveRVA(sections: sections) else { return nil }
                return fileHandle.loadData(fromByteOffset: UInt64(offset), upToCount: Int(entry.size))
            }
    }
    
    // MARK: - Raw Data
    
    public func rawData(section: Section) throws -> Data? {
        let fileHandle = try FileHandle(forReadingFrom: url)
        defer {
            try? fileHandle.close()
        }
        return try section.rawData(from: fileHandle)
    }
    
    public func rawData(section: String) throws -> Data? {
        guard let section = self[section: section] else { return nil }
        let fileHandle = try FileHandle(forReadingFrom: url)
        defer {
            try? fileHandle.close()
        }
        return try section.rawData(from: fileHandle)
    }
    
    // MARK: - Helper
    
    /// All icon data found in the `.rsrc` section
    public var iconData: [Data]? {
        do {
            return try rsrcEntryData(types: [.icon])
        } catch {
            return nil
        }
    }
    
    /// All version data found in the `.rsrc` section
    public var version: [VersionInfo]? {
        do {
            guard let data = try rsrcEntryData(types: [.version]) else {
                return nil
            }
            return data
                .compactMap { data -> VersionInfo? in
                    VersionInfo(data: data)
                }
        } catch {
            return nil
        }
    }
}
