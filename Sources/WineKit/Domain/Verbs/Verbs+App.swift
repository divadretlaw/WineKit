//
//  Verbs+App.swift
//  WineKit
//
//  Created by David Walter on 15.12.23.
//

import Foundation

extension Winetricks {
    public enum App: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		case _3mLibrary = "3m_library"
		case _7zip = "7zip"
		case adobeDiged = "adobe_diged"
		case adobeDiged4 = "adobe_diged4"
		case autohotkey = "autohotkey"
		case busybox = "busybox"
		case cmake = "cmake"
		case colorprofile = "colorprofile"
		case controlpad = "controlpad"
		case controlspy = "controlspy"
		case dbgview = "dbgview"
		case depends = "depends"
		case dotnet20sdk = "dotnet20sdk"
		case dxsdkAug2006 = "dxsdk_aug2006"
		case dxsdkJun2010 = "dxsdk_jun2010"
		case dxwnd = "dxwnd"
		case emu8086 = "emu8086"
		case ev3 = "ev3"
		case firefox = "firefox"
		case fontxplorer = "fontxplorer"
		case foobar2000 = "foobar2000"
		case hhw = "hhw"
		case iceweasel = "iceweasel"
		case irfanview = "irfanview"
		case kindle = "kindle"
		case kobo = "kobo"
		case mingw = "mingw"
		case mozillabuild = "mozillabuild"
		case mpc = "mpc"
		case mspaint = "mspaint"
		case mt4 = "mt4"
		case njcwpTrial = "njcwp_trial"
		case njjwpTrial = "njjwp_trial"
		case nook = "nook"
		case npp = "npp"
		case office2003pro = "office2003pro"
		case office2007pro = "office2007pro"
		case office2013pro = "office2013pro"
		case ollydbg110 = "ollydbg110"
		case ollydbg200 = "ollydbg200"
		case ollydbg201 = "ollydbg201"
		case openwatcom = "openwatcom"
		case origin = "origin"
		case procexp = "procexp"
		case protectionid = "protectionid"
		case psdk2003 = "psdk2003"
		case psdkwin71 = "psdkwin71"
		case qq = "qq"
		case qqintl = "qqintl"
		case safari = "safari"
		case sketchup = "sketchup"
		case steam = "steam"
		case ubisoftconnect = "ubisoftconnect"
		case utorrent = "utorrent"
		case utorrent3 = "utorrent3"
		case vc2005express = "vc2005express"
		case vc2005expresssp1 = "vc2005expresssp1"
		case vc2005trial = "vc2005trial"
		case vc2008express = "vc2008express"
		case vc2010express = "vc2010express"
		case vlc = "vlc"
		case vstools2019 = "vstools2019"
		case winamp = "winamp"
		case winrar = "winrar"
		case wme9 = "wme9"

        // MARK: - CustomStringConvertible
    
        public var description: String {
            switch self {
			case ._3mLibrary:
				return "3M Cloud Library (3M Company, 2015)"
			case ._7zip:
				return "7-Zip 19.00 (Igor Pavlov, 2019)"
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
			case .office2003pro:
				return "Microsoft Office 2003 Professional (Microsoft, 2002)"
			case .office2007pro:
				return "Microsoft Office 2007 Professional (Microsoft, 2006)"
			case .office2013pro:
				return "Microsoft Office 2013 Professional (Microsoft, 2013)"
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
				return "Process Explorer (Microsoft, 2023)"
			case .protectionid:
				return "Protection ID (CDKiLLER & TippeX, 2016)"
			case .psdk2003:
				return "MS Platform SDK 2003 (Microsoft, 2003)"
			case .psdkwin71:
				return "MS Windows 7.1 SDK (Microsoft, 2010)"
			case .qq:
				return "QQ 8.9.6(Chinese chat app) (Tencent, 2017)"
			case .qqintl:
				return "QQ International Instant Messenger 2.11 (Tencent, 2014)"
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
