//
//  PortableExecutableTests.swift
//  WindowsFileKit
//
//  Created by David Walter on 04.12.23.
//

import XCTest
@testable import WindowsFileKit

final class PortableExecutableTests: XCTestCase {
    func testPortableExecutable32() throws {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/i386-windows/winecfg.exe")
        let peFile = try XCTUnwrap(PortableExecutable(url: url))
        XCTAssertEqual(peFile.optionalHeader?.magic, .pe32)
        // PE32 contains BaseOfData
        XCTAssertNotNil(peFile.optionalHeader?.baseOfData)
    }
    
    func testPortableExecutable32Plus() throws {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/x86_64-windows/winecfg.exe")
        let peFile = try XCTUnwrap(PortableExecutable(url: url))
        XCTAssertEqual(peFile.optionalHeader?.magic, .pe32Plus)
        // PE32+ does not contain BaseOfData
        XCTAssertNil(peFile.optionalHeader?.baseOfData)
    }
    
    func testIconData() throws {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/x86_64-windows/iexplore.exe")
        let peFile = try XCTUnwrap(PortableExecutable(url: url))
        XCTAssertNotNil(peFile.iconData)
        let iconData = try XCTUnwrap(peFile.iconData)
        XCTAssertFalse(iconData.isEmpty)
    }
    
    func testVersionData() throws {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/x86_64-windows/iexplore.exe")
        let peFile = try XCTUnwrap(PortableExecutable(url: url))
        let version = try XCTUnwrap(peFile.version)
        XCTAssertFalse(version.isEmpty)
        let versionInfo = try XCTUnwrap(version.first)
        let stringFileInfo = try XCTUnwrap(versionInfo.stringFileInfo)
        let stringTable = try XCTUnwrap(stringFileInfo.children.first)
        XCTAssertEqual(stringTable[.productName]?.stringValue, "Wine")
        XCTAssertEqual(stringTable[.fileDescription]?.stringValue, "Wine Internet Explorer")
    }
    
    func testCOFFHeaderMemoryLayout() async throws {
        XCTAssertEqual(MemoryLayout<PortableExecutable.COFFHeader>.size, 24)
    }
    
    func testSectionMemoryLayout() async throws {
        XCTAssertEqual(MemoryLayout<PortableExecutable.Section>.size, 40)
    }
    
    func testResourceDirectoryEntryMemoryLayout() async throws {
        XCTAssertEqual(MemoryLayout<PortableExecutable.ResourceDirectoryEntry.Name>.size, 8)
        XCTAssertEqual(MemoryLayout<PortableExecutable.ResourceDirectoryEntry.ID>.size, 8)
    }
}
