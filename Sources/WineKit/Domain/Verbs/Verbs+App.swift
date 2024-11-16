//
// Verbs+App.swift
// WineKit
// 
// Source: https://github.com/Winetricks/winetricks
//
// Automatically generated on 9.2.2025.
//

import Foundation

extension Winetricks {
	/// Winetricks verbs from App.txt
	public enum App: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		/// 3M Cloud Library (3M Company, 2015)
		case _3mLibrary = "3m_library"
		/// 7-Zip 24.09 (Igor Pavlov, 2024)
		case _7zip = "7zip"
		/// Adobe Digital Editions 1.7 (Adobe, 2011)
		case adobeDiged = "adobe_diged"
		/// Adobe Digital Editions 4.5 (Adobe, 2015)
		case adobeDiged4 = "adobe_diged4"
		/// AutoHotKey (autohotkey.org, 2010)
		case autohotkey = "autohotkey"
		/// BusyBox FRP-4621-gf3c5e8bc3 (Ron Yorston / Busybox authors, 2021)
		case busybox = "busybox"
		/// CMake 2.8 (Kitware, 2013)
		case cmake = "cmake"
		/// Standard RGB color profile (Microsoft, 2005)
		case colorprofile = "colorprofile"
		/// MS ActiveX Control Pad (Microsoft, 1997)
		case controlpad = "controlpad"
		/// Control Spy 6  (Microsoft, 2005)
		case controlspy = "controlspy"
		/// Debug monitor (Mark Russinovich, 2019)
		case dbgview = "dbgview"
		/// Dependency Walker (Steve P. Miller, 2006)
		case depends = "depends"
		/// MS .NET 2.0 SDK (Microsoft, 2006)
		case dotnet20sdk = "dotnet20sdk"
		/// MS DirectX SDK, August 2006 (developers only) (Microsoft, 2006)
		case dxsdkAug2006 = "dxsdk_aug2006"
		/// MS DirectX SDK, June 2010 (developers only) (Microsoft, 2010)
		case dxsdkJun2010 = "dxsdk_jun2010"
		/// Window hooker to run fullscreen programs in window and much more... (ghotik, 2011)
		case dxwnd = "dxwnd"
		/// emu8086 (emu8086.com, 2015)
		case emu8086 = "emu8086"
		/// Lego Mindstorms EV3 Home Edition (Lego, 2014)
		case ev3 = "ev3"
		/// Firefox 51.0 (Mozilla, 2017)
		case firefox = "firefox"
		/// Font Xplorer 1.2.2 (Moon Software, 2001)
		case fontxplorer = "fontxplorer"
		/// foobar2000 v1.4 (Peter Pawlowski, 2018)
		case foobar2000 = "foobar2000"
		/// HTML Help Workshop (Microsoft, 2000)
		case hhw = "hhw"
		/// GNU Icecat 31.7.0 (GNU Foundation, 2015)
		case iceweasel = "iceweasel"
		/// Irfanview (Irfan Skiljan, 2016)
		case irfanview = "irfanview"
		/// Amazon Kindle (Amazon, 2017)
		case kindle = "kindle"
		/// Kobo e-book reader (Kobo, 2011)
		case kobo = "kobo"
		/// Minimalist GNU for Windows, including GCC for Windows (GNU, 2013)
		case mingw = "mingw"
		/// Mozilla build environment (Mozilla Foundation, 2015)
		case mozillabuild = "mozillabuild"
		/// Media Player Classic - Home Cinema (doom9 folks, 2014)
		case mpc = "mpc"
		/// MS Paint (Microsoft, 2010)
		case mspaint = "mspaint"
		/// Meta Trader 4 (, 2005)
		case mt4 = "mt4"
		/// NJStar Chinese Word Processor trial (NJStar, 2015)
		case njcwpTrial = "njcwp_trial"
		/// NJStar Japanese Word Processor trial (NJStar, 2009)
		case njjwpTrial = "njjwp_trial"
		/// Nook for PC (e-book reader) (Barnes & Noble, 2011)
		case nook = "nook"
		/// Notepad++ (Don Ho, 2019)
		case npp = "npp"
		/// OllyDbg (ollydbg.de, 2004)
		case ollydbg110 = "ollydbg110"
		/// OllyDbg (ollydbg.de, 2010)
		case ollydbg200 = "ollydbg200"
		/// OllyDbg (ollydbg.de, 2013)
		case ollydbg201 = "ollydbg201"
		/// Open Watcom C/C++ compiler (can compile win16 code!) (Watcom, 2010)
		case openwatcom = "openwatcom"
		/// EA Origin (EA, 2011)
		case origin = "origin"
		/// Process Explorer (Steve P. Miller, 2006)
		case procexp = "procexp"
		/// Protection ID (CDKiLLER & TippeX, 2016)
		case protectionid = "protectionid"
		/// MS Platform SDK 2003 (Microsoft, 2003)
		case psdk2003 = "psdk2003"
		/// MS Windows 7.1 SDK (Microsoft, 2010)
		case psdkwin71 = "psdkwin71"
		/// Safari (Apple, 2010)
		case safari = "safari"
		/// SketchUp 8 (Google, 2012)
		case sketchup = "sketchup"
		/// Steam (Valve, 2010)
		case steam = "steam"
		/// Ubisoft Connect (Ubisoft, 2020)
		case ubisoftconnect = "ubisoftconnect"
		/// µTorrent 2.2.1 (BitTorrent, 2011)
		case utorrent = "utorrent"
		/// µTorrent 3.4 (BitTorrent, 2011)
		case utorrent3 = "utorrent3"
		/// MS Visual C++ 2005 Express (Microsoft, 2005)
		case vc2005express = "vc2005express"
		/// MS Visual C++ 2005 Express SP1 (Microsoft, 2007)
		case vc2005expresssp1 = "vc2005expresssp1"
		/// MS Visual C++ 2005 Trial (Microsoft, 2005)
		case vc2005trial = "vc2005trial"
		/// MS Visual C++ 2008 Express (Microsoft, 2008)
		case vc2008express = "vc2008express"
		/// MS Visual C++ 2010 Express (Microsoft, 2010)
		case vc2010express = "vc2010express"
		/// VLC media player 2.2.1 (VideoLAN, 2015)
		case vlc = "vlc"
		/// MS Visual Studio Build Tools 2019 (Microsoft, 2019)
		case vstools2019 = "vstools2019"
		/// Winamp (Radionomy (AOL (Nullsoft)), 2013)
		case winamp = "winamp"
		/// WinRAR 6.11 (RARLAB, 1993)
		case winrar = "winrar"
		/// MS Windows Media Encoder 9 (broken in Wine) (Microsoft, 2002)
		case wme9 = "wme9"

		// MARK: - CustomStringConvertible

		public var description: String {
			switch self {
			case ._3mLibrary:
				return "3M Cloud Library (3M Company, 2015)"
			case ._7zip:
				return "7-Zip 24.09 (Igor Pavlov, 2024)"
			case .adobeDiged:
				return "Adobe Digital Editions 1.7 (Adobe, 2011)"
			case .adobeDiged4:
				return "Adobe Digital Editions 4.5 (Adobe, 2015)"
			case .autohotkey:
				return "AutoHotKey (autohotkey.org, 2010)"
			case .busybox:
				return "BusyBox FRP-4621-gf3c5e8bc3 (Ron Yorston / Busybox authors, 2021)"
			case .cmake:
				return "CMake 2.8 (Kitware, 2013)"
			case .colorprofile:
				return "Standard RGB color profile (Microsoft, 2005)"
			case .controlpad:
				return "MS ActiveX Control Pad (Microsoft, 1997)"
			case .controlspy:
				return "Control Spy 6  (Microsoft, 2005)"
			case .dbgview:
				return "Debug monitor (Mark Russinovich, 2019)"
			case .depends:
				return "Dependency Walker (Steve P. Miller, 2006)"
			case .dotnet20sdk:
				return "MS .NET 2.0 SDK (Microsoft, 2006)"
			case .dxsdkAug2006:
				return "MS DirectX SDK, August 2006 (developers only) (Microsoft, 2006)"
			case .dxsdkJun2010:
				return "MS DirectX SDK, June 2010 (developers only) (Microsoft, 2010)"
			case .dxwnd:
				return "Window hooker to run fullscreen programs in window and much more... (ghotik, 2011)"
			case .emu8086:
				return "emu8086 (emu8086.com, 2015)"
			case .ev3:
				return "Lego Mindstorms EV3 Home Edition (Lego, 2014)"
			case .firefox:
				return "Firefox 51.0 (Mozilla, 2017)"
			case .fontxplorer:
				return "Font Xplorer 1.2.2 (Moon Software, 2001)"
			case .foobar2000:
				return "foobar2000 v1.4 (Peter Pawlowski, 2018)"
			case .hhw:
				return "HTML Help Workshop (Microsoft, 2000)"
			case .iceweasel:
				return "GNU Icecat 31.7.0 (GNU Foundation, 2015)"
			case .irfanview:
				return "Irfanview (Irfan Skiljan, 2016)"
			case .kindle:
				return "Amazon Kindle (Amazon, 2017)"
			case .kobo:
				return "Kobo e-book reader (Kobo, 2011)"
			case .mingw:
				return "Minimalist GNU for Windows, including GCC for Windows (GNU, 2013)"
			case .mozillabuild:
				return "Mozilla build environment (Mozilla Foundation, 2015)"
			case .mpc:
				return "Media Player Classic - Home Cinema (doom9 folks, 2014)"
			case .mspaint:
				return "MS Paint (Microsoft, 2010)"
			case .mt4:
				return "Meta Trader 4 (, 2005)"
			case .njcwpTrial:
				return "NJStar Chinese Word Processor trial (NJStar, 2015)"
			case .njjwpTrial:
				return "NJStar Japanese Word Processor trial (NJStar, 2009)"
			case .nook:
				return "Nook for PC (e-book reader) (Barnes & Noble, 2011)"
			case .npp:
				return "Notepad++ (Don Ho, 2019)"
			case .ollydbg110:
				return "OllyDbg (ollydbg.de, 2004)"
			case .ollydbg200:
				return "OllyDbg (ollydbg.de, 2010)"
			case .ollydbg201:
				return "OllyDbg (ollydbg.de, 2013)"
			case .openwatcom:
				return "Open Watcom C/C++ compiler (can compile win16 code!) (Watcom, 2010)"
			case .origin:
				return "EA Origin (EA, 2011)"
			case .procexp:
				return "Process Explorer (Steve P. Miller, 2006)"
			case .protectionid:
				return "Protection ID (CDKiLLER & TippeX, 2016)"
			case .psdk2003:
				return "MS Platform SDK 2003 (Microsoft, 2003)"
			case .psdkwin71:
				return "MS Windows 7.1 SDK (Microsoft, 2010)"
			case .safari:
				return "Safari (Apple, 2010)"
			case .sketchup:
				return "SketchUp 8 (Google, 2012)"
			case .steam:
				return "Steam (Valve, 2010)"
			case .ubisoftconnect:
				return "Ubisoft Connect (Ubisoft, 2020)"
			case .utorrent:
				return "µTorrent 2.2.1 (BitTorrent, 2011)"
			case .utorrent3:
				return "µTorrent 3.4 (BitTorrent, 2011)"
			case .vc2005express:
				return "MS Visual C++ 2005 Express (Microsoft, 2005)"
			case .vc2005expresssp1:
				return "MS Visual C++ 2005 Express SP1 (Microsoft, 2007)"
			case .vc2005trial:
				return "MS Visual C++ 2005 Trial (Microsoft, 2005)"
			case .vc2008express:
				return "MS Visual C++ 2008 Express (Microsoft, 2008)"
			case .vc2010express:
				return "MS Visual C++ 2010 Express (Microsoft, 2010)"
			case .vlc:
				return "VLC media player 2.2.1 (VideoLAN, 2015)"
			case .vstools2019:
				return "MS Visual Studio Build Tools 2019 (Microsoft, 2019)"
			case .winamp:
				return "Winamp (Radionomy (AOL (Nullsoft)), 2013)"
			case .winrar:
				return "WinRAR 6.11 (RARLAB, 1993)"
			case .wme9:
				return "MS Windows Media Encoder 9 (broken in Wine) (Microsoft, 2002)"
			}
		}
	}
}
