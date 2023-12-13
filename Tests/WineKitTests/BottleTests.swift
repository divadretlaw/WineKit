//
//  BottleTests.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import XCTest
@testable import WineKit

final class BottleTests: XCTestCase {
    func testEncodeBottle() async throws {
        let bottle = Bottle(name: "Test", icon: .systemName("waterbottle"), url: FileManager.default.temporaryDirectory, wine: .wine(.stable))
        try await bottle.write()
        
        let data = try Data(contentsOf: FileManager.default.temporaryDirectory.appending(path: ".config/bottle.plist"))
        if let string = String(data: data, encoding: .utf8) {
            print(string)
        } else {
            XCTFail("Data is not XML")
        }
    }
    
    func testEncodeDecode() async throws {
        let bottle = Bottle(name: "Test", icon: .systemName("waterbottle"), url: FileManager.default.temporaryDirectory, wine: .wine(.stable))
        try await bottle.write()
        
        let decodedBottle = try Bottle(url: bottle.url)
        XCTAssertEqual(bottle, decodedBottle)
    }
}
