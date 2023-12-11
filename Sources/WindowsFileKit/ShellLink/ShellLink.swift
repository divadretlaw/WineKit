//
//  ShellLink.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import Foundation

/// Shell Link
///
/// For more information see
/// [Shell Link](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/)
/// on *Microsoft Learn*.
public struct ShellLink: Hashable, Equatable, Sendable {
    /// The location of the shell link
    public let url: URL
    ///  A ``ShellLinkHeader`` structure, which contains identification information, timestamps, and flags that specify the presence of optional structures.
    public let header: ShellLinkHeader
    ///  An optional ``LinkTargetIDList`` structure, which specifies the target of the link.
    ///
    ///  The presence of this structure is specified by the ``LinkFlags/hasLinkTargetIDList`` bit in ``ShellLinkHeader/linkFlags``.
    public let targetIDList: LinkTargetIDList?
    /// An optional ``LinkInfo`` structure, which specifies information necessary to resolve the link target.
    ///
    /// The presence of this structure is specified by the ``LinkFlags/hasLinkInfo`` bit in ``ShellLinkHeader/linkFlags``.
    public let linkInfo: LinkInfo?
    
    /// Initialize a ``ShellLink``
    ///
    /// - Parameter url: The location of the shell link
    ///
    /// Returns `nil` if the file at the location is not a valid shell link file.
    public init?(url: URL) {
        self.url = url
        guard let fileHandle = try? FileHandle(forReadingFrom: url) else {
            return nil
        }
        
        defer {
            try? fileHandle.close()
        }
        
        var offset: UInt64 = 0
        guard let header = ShellLinkHeader(fileHandle: fileHandle, offset: offset) else {
            return nil
        }
        
        self.header = header
        offset += UInt64(header.headerSize)
        if header.linkFlags.contains(.hasLinkTargetIDList) {
            let targetIDList = LinkTargetIDList(fileHandle: fileHandle, offset: offset)
            self.targetIDList = targetIDList
            offset.move(by: UInt16.self) // Move by size of targetIDList
            offset += UInt64(targetIDList.size) // Move by value of targetIDList
        } else {
            self.targetIDList = nil
        }
        
        if header.linkFlags.contains(.hasLinkInfo) {
            self.linkInfo = LinkInfo(fileHandle: fileHandle, offset: offset)
        } else {
            self.linkInfo = nil
        }
    }
}
