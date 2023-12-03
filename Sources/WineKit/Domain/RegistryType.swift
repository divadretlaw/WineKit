//
//  RegistryType.swift
//  WineKit
//
//  Created by David Walter on 05.11.23.
//

import Foundation

/// List of Registry Types
public enum RegistryType: String {
    /// No Type
    case none
    /// String Type (ASCII)
    case string
    /// String, includes %ENVVAR% (expanded by caller) (ASCII)
    case stringExpanded
    /// Binary Format
    case binary
    /// `DWORD` in little endian format
    case dword
    /// `DWORD` in big endian format
    case dwordBigEndian
    /// Symbolic Link
    case link
    /// Multiple Strings, delimited by \0, terminated by \0\0 (ASCII)
    case multipleStrings
    /// Resource List
    case resourceList
    /// Full Resource Descriptor
    case fullResourceDescriptor
    /// Resource Requirements List
    case resourceRequirementsList
    /// `QWORD` in little endian format
    case qword
    
    public init?(rawValue: String) {
        switch rawValue {
        case "REG_NONE":
            self = .none
        case "REG_SZ":
            self = .string
        case "REG_EXPAND_SZ":
            self = .stringExpanded
        case "REG_BINARY":
            self = .binary
        case "REG_DWORD", "REG_DWORD_LITTLE_ENDIAN":
            self = .dword
        case "REG_LINK":
            self = .link
        case "REG_MULTI_SZ":
            self = .multipleStrings
        case "REG_RESOURCE_LIST":
            self = .resourceList
        case "REG_FULL_RESOURCE_DESCRIPTOR":
            self = .fullResourceDescriptor
        case "REG_RESOURCE_REQUIREMENTS_LIST":
            self = .resourceRequirementsList
        case "REG_QWORD", "QEG_DWORD_LITTLE_ENDIAN":
            self = .qword
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .none:
            return "REG_NONE"
        case .string:
            return "REG_SZ"
        case .stringExpanded:
            return "REG_EXPAND_SZ"
        case .binary:
            return "REG_BINARY"
        case .dword:
            return "REG_DWORD"
        case .dwordBigEndian:
            return "REG_DWORD_BIG_ENDIAN"
        case .link:
            return "REG_LINK"
        case .multipleStrings:
            return "REG_MULTI_SZ"
        case .resourceList:
            return "REG_RESOURCE_LIST"
        case .fullResourceDescriptor:
            return "REG_FULL_RESOURCE_DESCRIPTOR"
        case .resourceRequirementsList:
            return "REG_RESOURCE_REQUIREMENTS_LIST"
        case .qword:
            return "REG_QWORD"
        }
    }
}
