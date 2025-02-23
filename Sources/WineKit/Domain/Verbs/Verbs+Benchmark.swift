//
// Verbs+Benchmark.swift
// WineKit
// 
// Source: https://github.com/Winetricks/winetricks
//
// Automatically generated on 1.3.2025.
//

import Foundation

extension Winetricks {
	/// Winetricks verbs from Benchmark.txt
	public enum Benchmark: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		/// 3D Mark 03 (Futuremark, 2003)
		case _3dmark03 = "3dmark03"
		/// 3D Mark 05 (Futuremark, 2005)
		case _3dmark05 = "3dmark05"
		/// 3D Mark 06 (Futuremark, 2006)
		case _3dmark06 = "3dmark06"
		/// 3DMark2000 (MadOnion.com, 2000)
		case _3dmark2000 = "3dmark2000"
		/// 3DMark2001 (MadOnion.com, 2001)
		case _3dmark2001 = "3dmark2001"
		/// S.T.A.L.K.E.R.: Call of Pripyat benchmark (GSC Game World, 2009)
		case stalkerPripyatBench = "stalker_pripyat_bench"
		/// Unigen Heaven 2.1 Benchmark (Unigen, 2010)
		case unigineHeaven = "unigine_heaven"
		/// wglgears (Clinton L. Jeffery, 2005)
		case wglgears = "wglgears"

		// MARK: - CustomStringConvertible

		public var description: String {
			switch self {
			case ._3dmark03:
				return "3D Mark 03 (Futuremark, 2003)"
			case ._3dmark05:
				return "3D Mark 05 (Futuremark, 2005)"
			case ._3dmark06:
				return "3D Mark 06 (Futuremark, 2006)"
			case ._3dmark2000:
				return "3DMark2000 (MadOnion.com, 2000)"
			case ._3dmark2001:
				return "3DMark2001 (MadOnion.com, 2001)"
			case .stalkerPripyatBench:
				return "S.T.A.L.K.E.R.: Call of Pripyat benchmark (GSC Game World, 2009)"
			case .unigineHeaven:
				return "Unigen Heaven 2.1 Benchmark (Unigen, 2010)"
			case .wglgears:
				return "wglgears (Clinton L. Jeffery, 2005)"
			}
		}
	}
}
