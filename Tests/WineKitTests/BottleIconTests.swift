//
//  BottleTests.swift
//  WineKit
//
//  Created by David Walter on 10.12.23.
//

import XCTest
@testable import WineKit

final class BottleIconTests: XCTestCase {
	func testSystem() async throws {
		let icon = BottleIcon.systemName("test")
		let encoded = try JSONEncoder().encode(icon)
		let decoded = try JSONDecoder().decode(BottleIcon.self, from: encoded)
		XCTAssertEqual(icon, decoded)
	}
	
	func testPng() async throws {
		let data = Data([0x42])
		let icon = BottleIcon.png(data)
		let encoded = try JSONEncoder().encode(icon)
		let decoded = try JSONDecoder().decode(BottleIcon.self, from: encoded)
		XCTAssertEqual(icon, decoded)
	}
	
	func testJpeg() async throws {
		let data = Data([0x42])
		let icon = BottleIcon.jpeg(data)
		let encoded = try JSONEncoder().encode(icon)
		let decoded = try JSONDecoder().decode(BottleIcon.self, from: encoded)
		XCTAssertEqual(icon, decoded)
	}
	
	func testHeic() async throws {
		let data = Data([0x42])
		let icon = BottleIcon.heic(data)
		let encoded = try JSONEncoder().encode(icon)
		let decoded = try JSONDecoder().decode(BottleIcon.self, from: encoded)
		XCTAssertEqual(icon, decoded)
	}
}
