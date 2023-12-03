//
//  PortableExecutable+WindowsSubsystem.swift
//  WineKit
//
//  Created by David Walter on 01.12.23.
//

import Foundation

extension PortableExecutable {
    /// Windows Subsystem
    ///
    /// For more information see
    /// [PE Format - Windows Subsystem](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#windows-subsystem)
    /// on *Microsoft Learn*.
    public enum WindowsSubsystem: UInt16, Hashable, Equatable, CustomStringConvertible, Sendable {
        case unknown = 0
        case native = 1
        case windowsGUI = 2
        case windowsCUI = 3
        case os2CUI = 5
        case posixCUI = 7
        case nativeWindows = 8
        case windowsCEGUI = 9
        case efiApplication = 10
        case efiBootServiceDriver = 11
        case efiRuntimeDriver = 12
        case efiRom = 13
        case xbox = 14
        case windowsBootApplication = 16
        
        // MARK: - CustomStringConvertible
        
        public var description: String {
            switch self {
            case .unknown:
                return "An unknown subsystem"
            case .native:
                return "Device drivers and native Windows processes"
            case .windowsGUI:
                return "The Windows graphical user interface (GUI) subsystem"
            case .windowsCUI:
                return "The Windows character subsystem"
            case .os2CUI:
                return "The OS/2 character subsystem"
            case .posixCUI:
                return "The Posix character subsystem"
            case .nativeWindows:
                return "Native Win9x driver"
            case .windowsCEGUI:
                return "Windows CE"
            case .efiApplication:
                return "An Extensible Firmware Interface (EFI) application"
            case .efiBootServiceDriver:
                return "An EFI driver with boot services"
            case .efiRuntimeDriver:
                return "An EFI driver with run-time services"
            case .efiRom:
                return "An EFI ROM image"
            case .xbox:
                return "XBOX"
            case .windowsBootApplication:
                return "Windows boot application"
            }
        }
    }
}
