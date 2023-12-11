//
//  ShellLinkTests.swift
//  WindowsFileKit
//
//  Created by David Walter on 11.12.23.
//

import XCTest
@testable import WindowsFileKit

final class ShellLinkTests: XCTestCase {
    func testLink() {
        guard let url = Bundle.module.url(forResource: "explorer", withExtension: "lnk") else {
            XCTFail("Resource is missing.")
            return
        }
        
        let shellLink = ShellLink(url: url)
        XCTAssertNotNil(shellLink)
        guard let shellLink else { return }
        XCTAssertEqual(shellLink.linkInfo?.localBasePath, "C:\\Windows\\explorer.exe")
        print(shellLink)
    }
}
