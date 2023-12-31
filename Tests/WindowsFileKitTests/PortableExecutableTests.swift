//
//  PortableExecutableTests.swift
//  WindowsFileKit
//
//  Created by David Walter on 04.12.23.
//

import XCTest
@testable import WindowsFileKit

final class PortableExecutableTests: XCTestCase {
    func testPortableExecutable32() {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/i386-windows/winecfg.exe")
        let peFile = PortableExecutable(url: url)
        XCTAssertNotNil(peFile)
        guard let peFile else { return }
        XCTAssertEqual(peFile.optionalHeader?.magic, .pe32)
        // PE32 contains BaseOfData
        XCTAssertNotNil(peFile.optionalHeader?.baseOfData)
    }
    
    func testPortableExecutable32Plus() {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/x86_64-windows/winecfg.exe")
        let peFile = PortableExecutable(url: url)
        XCTAssertNotNil(peFile)
        guard let peFile else { return }
        XCTAssertEqual(peFile.optionalHeader?.magic, .pe32Plus)
        // PE32+ does not contain BaseOfData
        XCTAssertNil(peFile.optionalHeader?.baseOfData)
    }
    
    func testIconData() {
        let url = URL(filePath: "/Applications/Wine Stable.app/Contents/Resources/wine/lib/wine/x86_64-windows/iexplore.exe")
        let peFile = PortableExecutable(url: url)
        XCTAssertNotNil(peFile)
        guard let peFile else { return }
        XCTAssertNotNil(peFile.iconData)
        guard let iconData = peFile.iconData else { return }
        XCTAssertFalse(iconData.isEmpty)
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
