//
//  WineKitTests.swift
//  WineKit
//
//  Created by David Walter on 03.12.23.
//

import XCTest
@testable import WineKit

final class WineKitTests: XCTestCase {
    override class func tearDown() {
        do {
            try WineLoader.delete()
        } catch {
            print("Deleting Wine test instance failed. \(error.localizedDescription)")
        }
    }
    
    func testWindowVersion() async throws {
        let wine = try await WineLoader.wine
        var windowsVersion: WindowsVersion?
        
        // Change to Windows 7
        try await wine.registry.changeWindowsVersion(.windows7)
        windowsVersion = try await wine.registry.windowsVersion
        XCTAssertEqual(windowsVersion, .windows7)
        // Change to Windows 10
        try await wine.registry.changeWindowsVersion(.windows10)
        windowsVersion = try await wine.registry.windowsVersion
        XCTAssertEqual(windowsVersion, .windows10)
    }
    
    func testBuildVersion() async throws {
        let wine = try await WineLoader.wine
        
        try await wine.registry.changeBuildVersion("12345")
        let newWindowVersion = try await wine.registry.buildVersion
        XCTAssertEqual(newWindowVersion, "12345")
    }
    
    func testRetinaMode() async throws {
        let wine = try await WineLoader.wine
        var retinaMode: Bool?
        
        // Set retina mode to true
        try await wine.registry.changeRetinaMode(true)
        retinaMode = try await wine.registry.usesRetinaMode
        XCTAssertEqual(retinaMode, true)
        // Set retina mode to false
        try await wine.registry.changeRetinaMode(false)
        retinaMode = try await wine.registry.usesRetinaMode
        XCTAssertEqual(retinaMode, false)
    }
    
    func testDPI() async throws {
        let wine = try await WineLoader.wine
        var dpi: Int?
        
        // Sets the DPI to 144
        try await wine.registry.changeDPI(144)
        dpi = try await wine.registry.dpi
        XCTAssertEqual(dpi, 144)
        // Sets the default DPI
        let defaultDpi = try await wine.registry.changeDPI()
        dpi = try await wine.registry.dpi
        XCTAssertEqual(dpi, defaultDpi)
    }
    
    func testProgram() async throws {
        let wine = try await WineLoader.wine
        let wineServer = try await WineLoader.wineServer
        
        Task {
            try await wine.commands.taskManager()
        }
        try await Task.sleep(for: .seconds(1))
        XCTAssertFalse(TaskManager.shared.systemTasks.isEmpty)
        
        try await Task.sleep(for: .seconds(2))
        
        try wineServer.run(["-k"])
        try await Task.sleep(for: .seconds(1))
        XCTAssertTrue(TaskManager.shared.systemTasks.isEmpty)
    }
}
