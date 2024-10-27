//
//  Machine.swift
//  WineKit
//
//  Created by David Walter on 08.11.23.
//

import Foundation

extension PortableExecutable {
    /// Machine Types
    ///
    /// For more information see
    /// [PE Format - Machine Types](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#machine-types)
    /// on *Microsoft Learn*.
    public enum Machine: UInt16, Hashable, Equatable, CustomStringConvertible, Sendable {
        /// The content of this field is assumed to be applicable to any machine type
        case unknown = 0x0
        /// Alpha AXP, 32-bit address space
        case alpha = 0x184
        /// Alpha 64, 64-bit address space or AXP 64
        ///
        /// Alpha 64 and AXP 64 share the same value.
        /// Matsushita AM33
        case alpha64orAXP64 = 0x284  // Alpha 64 and AXP 64 share the same value
        case am33 = 0x1d3
        /// x64
        case amd64 = 0x8664
        /// ARM little endian
        case arm = 0x1c0
        /// ARM64 little endian
        case arm64 = 0xaa64
        /// ARM Thumb-2 little endian
        case armNt = 0x1c4
        /// EFI byte code
        case ebc = 0xebc
        /// Intel 386 or later processors and compatible processors
        case i386 = 0x14c
        /// Intel Itanium processor family
        case ia64 = 0x200
        /// LoongArch 32-bit processor family
        case loongArch32 = 0x6232
        /// LoongArch 64-bit processor family
        case loongArch64 = 0x6264
        /// Mitsubishi M32R little endian
        case m32r = 0x9041
        /// MIPS16
        case mips16 = 0x266
        /// MIPS with FPU
        case mipsFpu = 0x366
        /// MIPS16 with FPU
        case mipsFpu16 = 0x466
        /// Power PC little endian
        case powerPc = 0x1f0
        /// Power PC with floating point support
        case powerPcFp = 0x1f1
        /// MIPS little endian
        case r4000 = 0x166
        /// RISC-V 32-bit address space
        case riscV32 = 0x5032
        /// RISC-V 64-bit address space
        case riscV64 = 0x5064
        /// RISC-V 128-bit address space
        case riscV128 = 0x5128
        /// Hitachi SH3
        case sh3 = 0x1a2
        /// Hitachi SH3 DSP
        case sh3dsp = 0x1a3
        /// Hitachi SH4
        case sh4 = 0x1a6
        /// Hitachi SH5
        case sh5 = 0x1a8
        /// Thumb
        case thumb = 0x1c2
        /// MIPS little-endian WCE v2
        case wceMipsV2 = 0x169
        
        // MARK: - CustomStringConvertible
        
        public var description: String {
            switch self {
            case .unknown:
                return "The content of this field is assumed to be applicable to any machine type"
            case .alpha:
                return "Alpha AXP, 32-bit address space"
            case .alpha64orAXP64:
                return "Alpha 64, 64-bit address space or AXP 64"
            case .am33:
                return "Matsushita AM33"
            case .amd64:
                return "x64"
            case .arm:
                return "ARM little endian"
            case .arm64:
                return "ARM64 little endian"
            case .armNt:
                return "ARM Thumb-2 little endian"
            case .ebc:
                return "EFI byte code"
            case .i386:
                return "Intel 386 or later processors and compatible processors"
            case .ia64:
                return "Intel Itanium processor family"
            case .loongArch32:
                return "LoongArch 32-bit processor family"
            case .loongArch64:
                return "LoongArch 64-bit processor family"
            case .m32r:
                return "Mitsubishi M32R little endian"
            case .mips16:
                return "MIPS16"
            case .mipsFpu:
                return "MIPS with FPU"
            case .mipsFpu16:
                return "MIPS16 with FPU"
            case .powerPc:
                return "Power PC little endian"
            case .powerPcFp:
                return "Power PC with floating point support"
            case .r4000:
                return "MIPS little endian"
            case .riscV32:
                return "RISC-V 32-bit address space"
            case .riscV64:
                return "RISC-V 64-bit address space"
            case .riscV128:
                return "RISC-V 128-bit address space"
            case .sh3:
                return "Hitachi SH3"
            case .sh3dsp:
                return "Hitachi SH3 DSP"
            case .sh4:
                return "Hitachi SH4"
            case .sh5:
                return "Hitachi SH5"
            case .thumb:
                return "Thumb"
            case .wceMipsV2:
                return "MIPS little-endian WCE v2"
            }
        }
    }
}
