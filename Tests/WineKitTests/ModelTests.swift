//
//  ModelTests.swift
//  WineKit
//
//  Created by David Walter on 14.12.23.
//

import XCTest
@testable import WineKit

final class ModelTests: XCTestCase {
    func testWineEnvironments() async throws {
        let environments: [WineEnvironment] = [.wine(.stable), .wine(.development), .wine(.staging), .gptk]
        for wine in environments {
            let encoded = try JSONEncoder().encode(wine)
            XCTAssertEqual(wine, try JSONDecoder().decode(WineEnvironment.self, from: encoded))
        }
    }
    
    func testDXVKHUD() async throws {
        var hud: [DXVK.HUD] = []
        XCTAssertNil(hud.environment)
        hud.append(.fps)
        XCTAssertEqual(hud.environment, "fps")
        hud.append(.memory)
        XCTAssertEqual(hud.environment, "fps,memory")
        hud.append(.full)
        XCTAssertEqual(hud.environment, "full")
        hud = [.full]
        XCTAssertEqual(hud.environment, "full")
    }
    
    func testBottleIcons() async throws {
        let icons: [BottleIcon] = [.systemName("waterbottle"), .url(nil), .url(URL(filePath: "test.png")), .png(Data()), .jpeg(Data())]
        for icon in icons {
            let encoded = try JSONEncoder().encode(icon)
            XCTAssertEqual(icon, try JSONDecoder().decode(BottleIcon.self, from: encoded))
        }
    }
}
