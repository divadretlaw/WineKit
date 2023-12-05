//
//  PortableExecutableTests.swift
//  PortableExecutable
//
//  Created by David Walter on 04.12.23.
//

import XCTest
@testable import PortableExecutable

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
    
    func testCOFFHeaderMemoryLayout() async throws {
        XCTAssertEqual(MemoryLayout<COFFHeader>.size, 24)
    }
    
    func testSectionMemoryLayout() async throws {
        XCTAssertEqual(MemoryLayout<Section>.size, 40)
    }
    
    func testResourceDirectoryEntryMemoryLayout() async throws {
        XCTAssertEqual(MemoryLayout<ResourceDirectoryEntry.Name>.size, 8)
        XCTAssertEqual(MemoryLayout<ResourceDirectoryEntry.ID>.size, 8)
    }
}
