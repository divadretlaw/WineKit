//
//  Verbs+DLL.swift
//  WineKit
//
//  Created by David Walter on 15.12.23.
//

import Foundation

extension Winetricks {
    public enum DLL: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		case allcodecs = "allcodecs"
		case amstream = "amstream"
		case art2k7min = "art2k7min"
		case art2kmin = "art2kmin"
		case atmlib = "atmlib"
		case avifil32 = "avifil32"
		case binkw32 = "binkw32"
		case cabinet = "cabinet"
		case cinepak = "cinepak"
		case cmd = "cmd"
		case cncDdraw = "cnc_ddraw"
		case comctl32 = "comctl32"
		case comctl32ocx = "comctl32ocx"
		case comdlg32ocx = "comdlg32ocx"
		case crypt32 = "crypt32"
		case crypt32Winxp = "crypt32_winxp"
		case d3dcompiler42 = "d3dcompiler_42"
		case d3dcompiler43 = "d3dcompiler_43"
		case d3dcompiler46 = "d3dcompiler_46"
		case d3dcompiler47 = "d3dcompiler_47"
		case d3drm = "d3drm"
		case d3dx10 = "d3dx10"
		case d3dx1043 = "d3dx10_43"
		case d3dx1142 = "d3dx11_42"
		case d3dx1143 = "d3dx11_43"
		case d3dx9 = "d3dx9"
		case d3dx924 = "d3dx9_24"
		case d3dx925 = "d3dx9_25"
		case d3dx926 = "d3dx9_26"
		case d3dx927 = "d3dx9_27"
		case d3dx928 = "d3dx9_28"
		case d3dx929 = "d3dx9_29"
		case d3dx930 = "d3dx9_30"
		case d3dx931 = "d3dx9_31"
		case d3dx932 = "d3dx9_32"
		case d3dx933 = "d3dx9_33"
		case d3dx934 = "d3dx9_34"
		case d3dx935 = "d3dx9_35"
		case d3dx936 = "d3dx9_36"
		case d3dx937 = "d3dx9_37"
		case d3dx938 = "d3dx9_38"
		case d3dx939 = "d3dx9_39"
		case d3dx940 = "d3dx9_40"
		case d3dx941 = "d3dx9_41"
		case d3dx942 = "d3dx9_42"
		case d3dx943 = "d3dx9_43"
		case d3dxof = "d3dxof"
		case dbghelp = "dbghelp"
		case devenum = "devenum"
		case dinput = "dinput"
		case dinput8 = "dinput8"
		case dirac = "dirac"
		case directmusic = "directmusic"
		case directplay = "directplay"
		case directshow = "directshow"
		case directx9 = "directx9"
		case dmband = "dmband"
		case dmcompos = "dmcompos"
		case dmime = "dmime"
		case dmloader = "dmloader"
		case dmscript = "dmscript"
		case dmstyle = "dmstyle"
		case dmsynth = "dmsynth"
		case dmusic = "dmusic"
		case dmusic32 = "dmusic32"
		case dotnet11 = "dotnet11"
		case dotnet11sp1 = "dotnet11sp1"
		case dotnet20 = "dotnet20"
		case dotnet20sp1 = "dotnet20sp1"
		case dotnet20sp2 = "dotnet20sp2"
		case dotnet30 = "dotnet30"
		case dotnet30sp1 = "dotnet30sp1"
		case dotnet35 = "dotnet35"
		case dotnet35sp1 = "dotnet35sp1"
		case dotnet40 = "dotnet40"
		case dotnet40Kb2468871 = "dotnet40_kb2468871"
		case dotnet45 = "dotnet45"
		case dotnet452 = "dotnet452"
		case dotnet46 = "dotnet46"
		case dotnet461 = "dotnet461"
		case dotnet462 = "dotnet462"
		case dotnet471 = "dotnet471"
		case dotnet472 = "dotnet472"
		case dotnet48 = "dotnet48"
		case dotnet6 = "dotnet6"
		case dotnet7 = "dotnet7"
		case dotnetVerifier = "dotnet_verifier"
		case dotnetcore2 = "dotnetcore2"
		case dotnetcore3 = "dotnetcore3"
		case dotnetcoredesktop3 = "dotnetcoredesktop3"
		case dotnetdesktop6 = "dotnetdesktop6"
		case dotnetdesktop7 = "dotnetdesktop7"
		case dpvoice = "dpvoice"
		case dsdmo = "dsdmo"
		case dsound = "dsound"
		case dswave = "dswave"
		case dx8vb = "dx8vb"
		case dxdiag = "dxdiag"
		case dxdiagn = "dxdiagn"
		case dxdiagnFeb2010 = "dxdiagn_feb2010"
		case dxtrans = "dxtrans"
		case dxvk = "dxvk"
		case dxvk0054 = "dxvk0054"
		case dxvk0060 = "dxvk0060"
		case dxvk0061 = "dxvk0061"
		case dxvk0062 = "dxvk0062"
		case dxvk0063 = "dxvk0063"
		case dxvk0064 = "dxvk0064"
		case dxvk0065 = "dxvk0065"
		case dxvk0070 = "dxvk0070"
		case dxvk0071 = "dxvk0071"
		case dxvk0072 = "dxvk0072"
		case dxvk0080 = "dxvk0080"
		case dxvk0081 = "dxvk0081"
		case dxvk0090 = "dxvk0090"
		case dxvk0091 = "dxvk0091"
		case dxvk0092 = "dxvk0092"
		case dxvk0093 = "dxvk0093"
		case dxvk0094 = "dxvk0094"
		case dxvk0095 = "dxvk0095"
		case dxvk0096 = "dxvk0096"
		case dxvk1000 = "dxvk1000"
		case dxvk1001 = "dxvk1001"
		case dxvk1002 = "dxvk1002"
		case dxvk1003 = "dxvk1003"
		case dxvk1011 = "dxvk1011"
		case dxvk1020 = "dxvk1020"
		case dxvk1021 = "dxvk1021"
		case dxvk1022 = "dxvk1022"
		case dxvk1023 = "dxvk1023"
		case dxvk1030 = "dxvk1030"
		case dxvk1031 = "dxvk1031"
		case dxvk1032 = "dxvk1032"
		case dxvk1033 = "dxvk1033"
		case dxvk1034 = "dxvk1034"
		case dxvk1040 = "dxvk1040"
		case dxvk1041 = "dxvk1041"
		case dxvk1042 = "dxvk1042"
		case dxvk1043 = "dxvk1043"
		case dxvk1044 = "dxvk1044"
		case dxvk1045 = "dxvk1045"
		case dxvk1046 = "dxvk1046"
		case dxvk1050 = "dxvk1050"
		case dxvk1051 = "dxvk1051"
		case dxvk1052 = "dxvk1052"
		case dxvk1053 = "dxvk1053"
		case dxvk1054 = "dxvk1054"
		case dxvk1055 = "dxvk1055"
		case dxvk1060 = "dxvk1060"
		case dxvk1061 = "dxvk1061"
		case dxvk1070 = "dxvk1070"
		case dxvk1071 = "dxvk1071"
		case dxvk1072 = "dxvk1072"
		case dxvk1073 = "dxvk1073"
		case dxvk1080 = "dxvk1080"
		case dxvk1081 = "dxvk1081"
		case dxvk1090 = "dxvk1090"
		case dxvk1091 = "dxvk1091"
		case dxvk1092 = "dxvk1092"
		case dxvk1093 = "dxvk1093"
		case dxvk1094 = "dxvk1094"
		case dxvk1100 = "dxvk1100"
		case dxvk1101 = "dxvk1101"
		case dxvk1102 = "dxvk1102"
		case dxvk1103 = "dxvk1103"
		case dxvk2000 = "dxvk2000"
		case dxvk2010 = "dxvk2010"
		case dxvk2020 = "dxvk2020"
		case dxvk2030 = "dxvk2030"
		case dxvkNvapi0061 = "dxvk_nvapi0061"
		case esent = "esent"
		case faudio = "faudio"
		case faudio1901 = "faudio1901"
		case faudio1902 = "faudio1902"
		case faudio1903 = "faudio1903"
		case faudio1904 = "faudio1904"
		case faudio1905 = "faudio1905"
		case faudio1906 = "faudio1906"
		case faudio190607 = "faudio190607"
		case ffdshow = "ffdshow"
		case filever = "filever"
		case galliumnine = "galliumnine"
		case galliumnine02 = "galliumnine02"
		case galliumnine03 = "galliumnine03"
		case galliumnine04 = "galliumnine04"
		case galliumnine05 = "galliumnine05"
		case galliumnine06 = "galliumnine06"
		case galliumnine07 = "galliumnine07"
		case galliumnine08 = "galliumnine08"
		case galliumnine09 = "galliumnine09"
		case gdiplus = "gdiplus"
		case gdiplusWinxp = "gdiplus_winxp"
		case gfw = "gfw"
		case glidewrapper = "glidewrapper"
		case glut = "glut"
		case gmdls = "gmdls"
		case hid = "hid"
		case icodecs = "icodecs"
		case ie6 = "ie6"
		case ie7 = "ie7"
		case ie8 = "ie8"
		case ie8Kb2936068 = "ie8_kb2936068"
		case ie8Tls12 = "ie8_tls12"
		case iertutil = "iertutil"
		case itircl = "itircl"
		case itss = "itss"
		case jet40 = "jet40"
		case l3codecx = "l3codecx"
		case lavfilters = "lavfilters"
		case lavfilters702 = "lavfilters702"
		case mdac27 = "mdac27"
		case mdac28 = "mdac28"
		case mdx = "mdx"
		case mf = "mf"
		case mfc100 = "mfc100"
		case mfc110 = "mfc110"
		case mfc120 = "mfc120"
		case mfc140 = "mfc140"
		case mfc40 = "mfc40"
		case mfc42 = "mfc42"
		case mfc70 = "mfc70"
		case mfc71 = "mfc71"
		case mfc80 = "mfc80"
		case mfc90 = "mfc90"
		case msaa = "msaa"
		case msacm32 = "msacm32"
		case msasn1 = "msasn1"
		case msctf = "msctf"
		case msdelta = "msdelta"
		case msdxmocx = "msdxmocx"
		case msflxgrd = "msflxgrd"
		case msftedit = "msftedit"
		case mshflxgd = "mshflxgd"
		case msls31 = "msls31"
		case msmask = "msmask"
		case mspatcha = "mspatcha"
		case msscript = "msscript"
		case msvcirt = "msvcirt"
		case msvcrt40 = "msvcrt40"
		case msxml3 = "msxml3"
		case msxml4 = "msxml4"
		case msxml6 = "msxml6"
		case nuget = "nuget"
		case ogg = "ogg"
		case ole32 = "ole32"
		case oleaut32 = "oleaut32"
		case openal = "openal"
		case pdh = "pdh"
		case pdhNt4 = "pdh_nt4"
		case peverify = "peverify"
		case physx = "physx"
		case pngfilt = "pngfilt"
		case powershell = "powershell"
		case powershellCore = "powershell_core"
		case prntvpt = "prntvpt"
		case python26 = "python26"
		case python27 = "python27"
		case qasf = "qasf"
		case qcap = "qcap"
		case qdvd = "qdvd"
		case qedit = "qedit"
		case quartz = "quartz"
		case quartzFeb2010 = "quartz_feb2010"
		case quicktime72 = "quicktime72"
		case quicktime76 = "quicktime76"
		case riched20 = "riched20"
		case riched30 = "riched30"
		case richtx32 = "richtx32"
		case sapi = "sapi"
		case sdl = "sdl"
		case secur32 = "secur32"
		case setupapi = "setupapi"
		case shockwave = "shockwave"
		case speechsdk = "speechsdk"
		case tabctl32 = "tabctl32"
		case ucrtbase2019 = "ucrtbase2019"
		case uiribbon = "uiribbon"
		case updspapi = "updspapi"
		case urlmon = "urlmon"
		case usp10 = "usp10"
		case vb2run = "vb2run"
		case vb3run = "vb3run"
		case vb4run = "vb4run"
		case vb5run = "vb5run"
		case vb6run = "vb6run"
		case vcrun2003 = "vcrun2003"
		case vcrun2005 = "vcrun2005"
		case vcrun2008 = "vcrun2008"
		case vcrun2010 = "vcrun2010"
		case vcrun2012 = "vcrun2012"
		case vcrun2013 = "vcrun2013"
		case vcrun2015 = "vcrun2015"
		case vcrun2017 = "vcrun2017"
		case vcrun2019 = "vcrun2019"
		case vcrun2022 = "vcrun2022"
		case vcrun6 = "vcrun6"
		case vcrun6sp6 = "vcrun6sp6"
		case vjrun20 = "vjrun20"
		case vkd3d = "vkd3d"
		case webio = "webio"
		case windowscodecs = "windowscodecs"
		case winhttp = "winhttp"
		case wininet = "wininet"
		case wininetWin2k = "wininet_win2k"
		case wmi = "wmi"
		case wmp10 = "wmp10"
		case wmp11 = "wmp11"
		case wmp9 = "wmp9"
		case wmv9vcm = "wmv9vcm"
		case wsh57 = "wsh57"
		case xact = "xact"
		case xactX64 = "xact_x64"
		case xinput = "xinput"
		case xmllite = "xmllite"
		case xna31 = "xna31"
		case xna40 = "xna40"
		case xvid = "xvid"

        // MARK: - CustomStringConvertible
    
        public var description: String {
            switch self {
			case .allcodecs:
				return "All codecs (dirac, ffdshow, icodecs, cinepak, l3codecx, xvid) except wmp (various, 1995-2009)"
			case .amstream:
				return "MS amstream.dll (Microsoft, 2011)"
			case .art2k7min:
				return "MS Access 2007 runtime (Microsoft, 2007)"
			case .art2kmin:
				return "MS Access 2000 runtime (Microsoft, 2000)"
			case .atmlib:
				return "Adobe Type Manager (Adobe, 2009)"
			case .avifil32:
				return "MS avifil32 (Microsoft, 2004)"
			case .binkw32:
				return "RAD Game Tools binkw32.dll (RAD Game Tools, Inc., 2000)"
			case .cabinet:
				return "Microsoft cabinet.dll (Microsoft, 2002)"
			case .cinepak:
				return "Cinepak Codec (Radius, 1995)"
			case .cmd:
				return "MS cmd.exe (Microsoft, 2004)"
			case .cncDdraw:
				return "Reimplentation of ddraw for CnC games (CnCNet, 2021)"
			case .comctl32:
				return "MS common controls 5.80 (Microsoft, 2001)"
			case .comctl32ocx:
				return "MS comctl32.ocx and mscomctl.ocx, comctl32 wrappers for VB6 (Microsoft, 2012)"
			case .comdlg32ocx:
				return "Common Dialog ActiveX Control for VB6 (Microsoft, 2012)"
			case .crypt32:
				return "MS crypt32 (Microsoft, 2011)"
			case .crypt32Winxp:
				return "MS crypt32 (Microsoft, 2004)"
			case .d3dcompiler42:
				return "MS d3dcompiler_42.dll (Microsoft, 2010)"
			case .d3dcompiler43:
				return "MS d3dcompiler_43.dll (Microsoft, 2010)"
			case .d3dcompiler46:
				return "MS d3dcompiler_46.dll (Microsoft, 2010)"
			case .d3dcompiler47:
				return "MS d3dcompiler_47.dll (Microsoft, FIXME)"
			case .d3drm:
				return "MS d3drm.dll (Microsoft, 2010)"
			case .d3dx10:
				return "MS d3dx10_??.dll from DirectX user redistributable (Microsoft, 2010)"
			case .d3dx1043:
				return "MS d3dx10_43.dll (Microsoft, 2010)"
			case .d3dx1142:
				return "MS d3dx11_42.dll (Microsoft, 2010)"
			case .d3dx1143:
				return "MS d3dx11_43.dll (Microsoft, 2010)"
			case .d3dx9:
				return "MS d3dx9_??.dll from DirectX 9 redistributable (Microsoft, 2010)"
			case .d3dx924:
				return "MS d3dx9_24.dll (Microsoft, 2010)"
			case .d3dx925:
				return "MS d3dx9_25.dll (Microsoft, 2010)"
			case .d3dx926:
				return "MS d3dx9_26.dll (Microsoft, 2010)"
			case .d3dx927:
				return "MS d3dx9_27.dll (Microsoft, 2010)"
			case .d3dx928:
				return "MS d3dx9_28.dll (Microsoft, 2010)"
			case .d3dx929:
				return "MS d3dx9_29.dll (Microsoft, 2010)"
			case .d3dx930:
				return "MS d3dx9_30.dll (Microsoft, 2010)"
			case .d3dx931:
				return "MS d3dx9_31.dll (Microsoft, 2010)"
			case .d3dx932:
				return "MS d3dx9_32.dll (Microsoft, 2010)"
			case .d3dx933:
				return "MS d3dx9_33.dll (Microsoft, 2010)"
			case .d3dx934:
				return "MS d3dx9_34.dll (Microsoft, 2010)"
			case .d3dx935:
				return "MS d3dx9_35.dll (Microsoft, 2010)"
			case .d3dx936:
				return "MS d3dx9_36.dll (Microsoft, 2010)"
			case .d3dx937:
				return "MS d3dx9_37.dll (Microsoft, 2010)"
			case .d3dx938:
				return "MS d3dx9_38.dll (Microsoft, 2010)"
			case .d3dx939:
				return "MS d3dx9_39.dll (Microsoft, 2010)"
			case .d3dx940:
				return "MS d3dx9_40.dll (Microsoft, 2010)"
			case .d3dx941:
				return "MS d3dx9_41.dll (Microsoft, 2010)"
			case .d3dx942:
				return "MS d3dx9_42.dll (Microsoft, 2010)"
			case .d3dx943:
				return "MS d3dx9_43.dll (Microsoft, 2010)"
			case .d3dxof:
				return "MS d3dxof.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dbghelp:
				return "MS dbghelp (Microsoft, 2008)"
			case .devenum:
				return "MS devenum.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dinput:
				return "MS dinput.dll; breaks mouse, use only on Rayman 2 etc. (Microsoft, 2010)"
			case .dinput8:
				return "MS DirectInput 8 from DirectX user redistributable (Microsoft, 2010)"
			case .dirac:
				return "The Dirac directshow filter v1.0.2 (Dirac, 2009)"
			case .directmusic:
				return "MS DirectMusic from DirectX user redistributable (Microsoft, 2010)"
			case .directplay:
				return "MS DirectPlay from DirectX user redistributable (Microsoft, 2010)"
			case .directshow:
				return "DirectShow runtime DLLs (amstream, qasf, qcap, qdvd, qedit, quartz) (Microsoft, 2011)"
			case .directx9:
				return "MS DirectX 9 (Deprecated, no-op) (Microsoft, 2010)"
			case .dmband:
				return "MS dmband.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmcompos:
				return "MS dmcompos.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmime:
				return "MS dmime.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmloader:
				return "MS dmloader.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmscript:
				return "MS dmscript.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmstyle:
				return "MS dmstyle.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmsynth:
				return "MS dmsynth.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmusic:
				return "MS dmusic.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dmusic32:
				return "MS dmusic32.dll from DirectX user redistributable (Microsoft, 2006)"
			case .dotnet11:
				return "MS .NET 1.1 (Microsoft, 2003)"
			case .dotnet11sp1:
				return "MS .NET 1.1 SP1 (Microsoft, 2004)"
			case .dotnet20:
				return "MS .NET 2.0 (Microsoft, 2006)"
			case .dotnet20sp1:
				return "MS .NET 2.0 SP1 (Microsoft, 2008)"
			case .dotnet20sp2:
				return "MS .NET 2.0 SP2 (Microsoft, 2009)"
			case .dotnet30:
				return "MS .NET 3.0 (Microsoft, 2006)"
			case .dotnet30sp1:
				return "MS .NET 3.0 SP1 (Microsoft, 2007)"
			case .dotnet35:
				return "MS .NET 3.5 (Microsoft, 2007)"
			case .dotnet35sp1:
				return "MS .NET 3.5 SP1 (Microsoft, 2008)"
			case .dotnet40:
				return "MS .NET 4.0 (Microsoft, 2011)"
			case .dotnet40Kb2468871:
				return "MS .NET 4.0 KB2468871 (Microsoft, 2011)"
			case .dotnet45:
				return "MS .NET 4.5 (Microsoft, 2012)"
			case .dotnet452:
				return "MS .NET 4.5.2 (Microsoft, 2012)"
			case .dotnet46:
				return "MS .NET 4.6 (Microsoft, 2015)"
			case .dotnet461:
				return "MS .NET 4.6.1 (Microsoft, 2015)"
			case .dotnet462:
				return "MS .NET 4.6.2 (Microsoft, 2016)"
			case .dotnet471:
				return "MS .NET 4.7.1 (Microsoft, 2017)"
			case .dotnet472:
				return "MS .NET 4.7.2 (Microsoft, 2018)"
			case .dotnet48:
				return "MS .NET 4.8 (Microsoft, 2019)"
			case .dotnet6:
				return "MS .NET Runtime 6.0 LTS (Microsoft, 2023)"
			case .dotnet7:
				return "MS .NET Runtime 7.0 LTS (Microsoft, 2023)"
			case .dotnetVerifier:
				return "MS .NET Verifier (Microsoft, 2016)"
			case .dotnetcore2:
				return "MS .NET Core Runtime 2.1 LTS (Microsoft, 2020)"
			case .dotnetcore3:
				return "MS .NET Core Runtime 3.1 LTS (Microsoft, 2020)"
			case .dotnetcoredesktop3:
				return "MS .NET Core Desktop Runtime 3.1 LTS (Microsoft, 2020)"
			case .dotnetdesktop6:
				return "MS .NET Desktop Runtime 6.0 LTS (Microsoft, 2023)"
			case .dotnetdesktop7:
				return "MS .NET Desktop Runtime 7.0 LTS (Microsoft, 2023)"
			case .dpvoice:
				return "Microsoft dpvoice dpvvox dpvacm Audio dlls (Microsoft, 2002)"
			case .dsdmo:
				return "MS dsdmo.dll (Microsoft, 2010)"
			case .dsound:
				return "MS DirectSound from DirectX user redistributable (Microsoft, 2010)"
			case .dswave:
				return "MS dswave.dll from DirectX user redistributable (Microsoft, 2010)"
			case .dx8vb:
				return "MS dx8vb.dll from DirectX 8.1 runtime (Microsoft, 2001)"
			case .dxdiag:
				return "DirectX Diagnostic Tool (Microsoft, 2010)"
			case .dxdiagn:
				return "DirectX Diagnostic Library (Microsoft, 2011)"
			case .dxdiagnFeb2010:
				return "DirectX Diagnostic Library (February 2010) (Microsoft, 2010)"
			case .dxtrans:
				return "MS dxtrans.dll (Microsoft, 2002)"
			case .dxvk:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (latest) (Philip Rebohle, 2023)"
			case .dxvk0054:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.54) (Philip Rebohle, 2017)"
			case .dxvk0060:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.60) (Philip Rebohle, 2017)"
			case .dxvk0061:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.61) (Philip Rebohle, 2017)"
			case .dxvk0062:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.62) (Philip Rebohle, 2017)"
			case .dxvk0063:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.63) (Philip Rebohle, 2017)"
			case .dxvk0064:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.64) (Philip Rebohle, 2017)"
			case .dxvk0065:
				return "Vulkan-based D3D11 implementation for Linux / Wine (0.65) (Philip Rebohle, 2017)"
			case .dxvk0070:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.70) (Philip Rebohle, 2017)"
			case .dxvk0071:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.71) (Philip Rebohle, 2017)"
			case .dxvk0072:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.72) (Philip Rebohle, 2017)"
			case .dxvk0080:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.80) (Philip Rebohle, 2017)"
			case .dxvk0081:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.81) (Philip Rebohle, 2017)"
			case .dxvk0090:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.90) (Philip Rebohle, 2017)"
			case .dxvk0091:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.91) (Philip Rebohle, 2017)"
			case .dxvk0092:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.92) (Philip Rebohle, 2017)"
			case .dxvk0093:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.93) (Philip Rebohle, 2017)"
			case .dxvk0094:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.94) (Philip Rebohle, 2017)"
			case .dxvk0095:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.95) (Philip Rebohle, 2017)"
			case .dxvk0096:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.96) (Philip Rebohle, 2017)"
			case .dxvk1000:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0) (Philip Rebohle, 2017)"
			case .dxvk1001:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0.1) (Philip Rebohle, 2017)"
			case .dxvk1002:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0.2) (Philip Rebohle, 2017)"
			case .dxvk1003:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0.3) (Philip Rebohle, 2017)"
			case .dxvk1011:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.1.1) (Philip Rebohle, 2017)"
			case .dxvk1020:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2) (Philip Rebohle, 2017)"
			case .dxvk1021:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2.1) (Philip Rebohle, 2017)"
			case .dxvk1022:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2.2) (Philip Rebohle, 2017)"
			case .dxvk1023:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2.3) (Philip Rebohle, 2017)"
			case .dxvk1030:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3) (Philip Rebohle, 2017)"
			case .dxvk1031:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.1) (Philip Rebohle, 2017)"
			case .dxvk1032:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.2) (Philip Rebohle, 2017)"
			case .dxvk1033:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.3) (Philip Rebohle, 2017)"
			case .dxvk1034:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.4) (Philip Rebohle, 2017)"
			case .dxvk1040:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4) (Philip Rebohle, 2017)"
			case .dxvk1041:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.1) (Philip Rebohle, 2017)"
			case .dxvk1042:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.2) (Philip Rebohle, 2017)"
			case .dxvk1043:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.3) (Philip Rebohle, 2017)"
			case .dxvk1044:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.4) (Philip Rebohle, 2017)"
			case .dxvk1045:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.5) (Philip Rebohle, 2017)"
			case .dxvk1046:
				return "Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.6) (Philip Rebohle, 2017)"
			case .dxvk1050:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5) (Philip Rebohle, 2017)"
			case .dxvk1051:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.1) (Philip Rebohle, 2017)"
			case .dxvk1052:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.2) (Philip Rebohle, 2017)"
			case .dxvk1053:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.3) (Philip Rebohle, 2017)"
			case .dxvk1054:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.4) (Philip Rebohle, 2017)"
			case .dxvk1055:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.5) (Philip Rebohle, 2017)"
			case .dxvk1060:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.6) (Philip Rebohle, 2017)"
			case .dxvk1061:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.6.1) (Philip Rebohle, 2017)"
			case .dxvk1070:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7) (Philip Rebohle, 2017)"
			case .dxvk1071:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7.1) (Philip Rebohle, 2017)"
			case .dxvk1072:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7.2) (Philip Rebohle, 2017)"
			case .dxvk1073:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7.3) (Philip Rebohle, 2017)"
			case .dxvk1080:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.8) (Philip Rebohle, 2017)"
			case .dxvk1081:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.8.1) (Philip Rebohle, 2017)"
			case .dxvk1090:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9) (Philip Rebohle, 2017)"
			case .dxvk1091:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.1) (Philip Rebohle, 2017)"
			case .dxvk1092:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.2) (Philip Rebohle, 2017)"
			case .dxvk1093:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.3) (Philip Rebohle, 2017)"
			case .dxvk1094:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.4) (Philip Rebohle, 2017)"
			case .dxvk1100:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10) (Philip Rebohle, 2017)"
			case .dxvk1101:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10.1) (Philip Rebohle, 2017)"
			case .dxvk1102:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10.2) (Philip Rebohle, 2017)"
			case .dxvk1103:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10.3) (Philip Rebohle, 2022)"
			case .dxvk2000:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (2.0) (Philip Rebohle, 2022)"
			case .dxvk2010:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (2.1) (Philip Rebohle, 2023)"
			case .dxvk2020:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (2.2) (Philip Rebohle, 2023)"
			case .dxvk2030:
				return "Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (2.3) (Philip Rebohle, 2023)"
			case .dxvkNvapi0061:
				return "Alternative NVAPI Vulkan implementation on top of DXVK for Linux / Wine (0.6.1) (Jens Peters, 2023)"
			case .esent:
				return "MS Extensible Storage Engine (Microsoft, 2011)"
			case .faudio:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (20.07) (Kron4ek, 2019)"
			case .faudio1901:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.01) (Kron4ek, 2019)"
			case .faudio1902:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.02) (Kron4ek, 2019)"
			case .faudio1903:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.03) (Kron4ek, 2019)"
			case .faudio1904:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.04) (Kron4ek, 2019)"
			case .faudio1905:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.05) (Kron4ek, 2019)"
			case .faudio1906:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.06) (Kron4ek, 2019)"
			case .faudio190607:
				return "FAudio (xaudio reimplementation, with xna support) builds for win32 (19.06.07) (Kron4ek, 2019)"
			case .ffdshow:
				return "ffdshow video codecs (doom9 folks, 2010)"
			case .filever:
				return "Microsoft's filever, for dumping file version info (Microsoft, 20??)"
			case .galliumnine:
				return "Gallium Nine Standalone (latest) (Gallium Nine Team, 2023)"
			case .galliumnine02:
				return "Gallium Nine Standalone (v0.2) (Gallium Nine Team, 2019)"
			case .galliumnine03:
				return "Gallium Nine Standalone (v0.3) (Gallium Nine Team, 2019)"
			case .galliumnine04:
				return "Gallium Nine Standalone (v0.4) (Gallium Nine Team, 2019)"
			case .galliumnine05:
				return "Gallium Nine Standalone (v0.5) (Gallium Nine Team, 2019)"
			case .galliumnine06:
				return "Gallium Nine Standalone (v0.6) (Gallium Nine Team, 2020)"
			case .galliumnine07:
				return "Gallium Nine Standalone (v0.7) (Gallium Nine Team, 2020)"
			case .galliumnine08:
				return "Gallium Nine Standalone (v0.8) (Gallium Nine Team, 2021)"
			case .galliumnine09:
				return "Gallium Nine Standalone (v0.9) (Gallium Nine Team, 2023)"
			case .gdiplus:
				return "MS GDI+ (Microsoft, 2011)"
			case .gdiplusWinxp:
				return "MS GDI+ (Microsoft, 2009)"
			case .gfw:
				return "MS Games For Windows Live (xlive.dll) (Microsoft, 2008)"
			case .glidewrapper:
				return "GlideWrapper (Rolf Neuberger, 2005)"
			case .glut:
				return "The glut utility library for OpenGL (Mark J. Kilgard, 2001)"
			case .gmdls:
				return "General MIDI DLS Collection (Microsoft / Roland, 1999)"
			case .hid:
				return "MS hid (Microsoft, 2003)"
			case .icodecs:
				return "Indeo codecs (Intel, 1998)"
			case .ie6:
				return "Internet Explorer 6 (Microsoft, 2002)"
			case .ie7:
				return "Internet Explorer 7 (Microsoft, 2008)"
			case .ie8:
				return "Internet Explorer 8 (Microsoft, 2009)"
			case .ie8Kb2936068:
				return "Cumulative Security Update for Internet Explorer 8 (Microsoft, 2014)"
			case .ie8Tls12:
				return "TLS 1.1 and 1.2 for Internet Explorer 8 (Microsoft, 2017)"
			case .iertutil:
				return "MS Runtime Utility (Microsoft, 2011)"
			case .itircl:
				return "MS itircl.dll (Microsoft, 1999)"
			case .itss:
				return "MS itss.dll (Microsoft, 1999)"
			case .jet40:
				return "MS Jet 4.0 Service Pack 8 (Microsoft, 2003)"
			case .l3codecx:
				return "MPEG Layer-3 Audio Codec for Microsoft DirectShow (Microsoft, 2010)"
			case .lavfilters:
				return "LAV Filters (Hendrik Leppkes, 2019)"
			case .lavfilters702:
				return "LAV Filters 0.70.2 (Hendrik Leppkes, 2017)"
			case .mdac27:
				return "Microsoft Data Access Components 2.7 sp1 (Microsoft, 2006)"
			case .mdac28:
				return "Microsoft Data Access Components 2.8 sp1 (Microsoft, 2005)"
			case .mdx:
				return "Managed DirectX (Microsoft, 2006)"
			case .mf:
				return "MS Media Foundation (Microsoft, 2011)"
			case .mfc100:
				return "Visual C++ 2010 mfc100 library; part of vcrun2010 (Microsoft, 2010)"
			case .mfc110:
				return "Visual C++ 2012 mfc110 library; part of vcrun2012 (Microsoft, 2012)"
			case .mfc120:
				return "Visual C++ 2013 mfc120 library; part of vcrun2013 (Microsoft, 2013)"
			case .mfc140:
				return "Visual C++ 2015 mfc140 library; part of vcrun2015 (Microsoft, 2015)"
			case .mfc40:
				return "MS mfc40 (Microsoft Foundation Classes from win7sp1) (Microsoft, 1999)"
			case .mfc42:
				return "Visual C++ 6 SP4 mfc42 library; part of vcrun6 (Microsoft, 2000)"
			case .mfc70:
				return "Visual Studio (.NET) 2002 mfc70 library (Microsoft, 2006)"
			case .mfc71:
				return "Visual C++ 2003 mfc71 library; part of vcrun2003 (Microsoft, 2003)"
			case .mfc80:
				return "Visual C++ 2005 mfc80 library; part of vcrun2005 (Microsoft, 2011)"
			case .mfc90:
				return "Visual C++ 2008 mfc90 library; part of vcrun2008 (Microsoft, 2011)"
			case .msaa:
				return "MS Active Accessibility (oleacc.dll, oleaccrc.dll, msaatext.dll) (Microsoft, 2003)"
			case .msacm32:
				return "MS ACM32 (Microsoft, 2003)"
			case .msasn1:
				return "MS ASN1 (Microsoft, 2003)"
			case .msctf:
				return "MS Text Service Module (Microsoft, 2003)"
			case .msdelta:
				return "MSDelta differential compression library (Microsoft, 2011)"
			case .msdxmocx:
				return "MS Windows Media Player 2 ActiveX control for VB6 (Microsoft, 1999)"
			case .msflxgrd:
				return "MS FlexGrid Control (msflxgrd.ocx) (Microsoft, 2012)"
			case .msftedit:
				return "Microsoft RichEdit Control (Microsoft, 2011)"
			case .mshflxgd:
				return "MS Hierarchical FlexGrid Control (mshflxgd.ocx) (Microsoft, 2012)"
			case .msls31:
				return "MS Line Services (Microsoft, 2001)"
			case .msmask:
				return "MS Masked Edit Control (Microsoft, 2009)"
			case .mspatcha:
				return "MS mspatcha (Microsoft, 2004)"
			case .msscript:
				return "MS Windows Script Control (Microsoft, 2004)"
			case .msvcirt:
				return "Visual C++ 6 SP4 msvcirt library; part of vcrun6 (Microsoft, 2000)"
			case .msvcrt40:
				return "fixme (Microsoft, 2011)"
			case .msxml3:
				return "MS XML Core Services 3.0 (Microsoft, 2005)"
			case .msxml4:
				return "MS XML Core Services 4.0 (Microsoft, 2009)"
			case .msxml6:
				return "MS XML Core Services 6.0 sp2 (Microsoft, 2014)"
			case .nuget:
				return "NuGet Package manager (Outercurve Foundation, 2013)"
			case .ogg:
				return "OpenCodecs 0.85: FLAC, Speex, Theora, Vorbis, WebM (Xiph.Org Foundation, 2011)"
			case .ole32:
				return "MS ole32 Module (ole32.dll) (Microsoft, 2004)"
			case .oleaut32:
				return "MS oleaut32.dll (Microsoft, 2011)"
			case .openal:
				return "OpenAL Runtime (Creative, 2023)"
			case .pdh:
				return "MS pdh.dll (Performance Data Helper) (Microsoft, 2011)"
			case .pdhNt4:
				return "MS pdh.dll (Performance Data Helper); WinNT 4.0 Version (Microsoft, 1997)"
			case .peverify:
				return "MS peverify (from .NET 2.0 SDK) (Microsoft, 2006)"
			case .physx:
				return "PhysX (Nvidia, 2021)"
			case .pngfilt:
				return "pngfilt.dll (from winxp) (Microsoft, 2004)"
			case .powershell:
				return "Windows PowerShell Wrapper for PowerShell Core (ProjectSynchro, 2024)"
			case .powershellCore:
				return "PowerShell Core (Microsoft, 2016)"
			case .prntvpt:
				return "prntvpt.dll (Microsoft, 2011)"
			case .python26:
				return "Python interpreter 2.6.2 (Python Software Foundaton, 2009)"
			case .python27:
				return "Python interpreter 2.7.16 (Python Software Foundaton, 2019)"
			case .qasf:
				return "qasf.dll (Microsoft, 2011)"
			case .qcap:
				return "qcap.dll (Microsoft, 2011)"
			case .qdvd:
				return "qdvd.dll (Microsoft, 2011)"
			case .qedit:
				return "qedit.dll (Microsoft, 2011)"
			case .quartz:
				return "quartz.dll (Microsoft, 2011)"
			case .quartzFeb2010:
				return "quartz.dll (February 2010) (Microsoft, 2010)"
			case .quicktime72:
				return "Apple QuickTime 7.2 (Apple, 2010)"
			case .quicktime76:
				return "Apple QuickTime 7.6 (Apple, 2010)"
			case .riched20:
				return "MS RichEdit Control 2.0 (riched20.dll) (Microsoft, 2004)"
			case .riched30:
				return "MS RichEdit Control 3.0 (riched20.dll, msls31.dll) (Microsoft, 2001)"
			case .richtx32:
				return "MS Rich TextBox Control 6.0 (Microsoft, 2012)"
			case .sapi:
				return "MS Speech API (Microsoft, 2011)"
			case .sdl:
				return "Simple DirectMedia Layer (Sam Lantinga, 2012)"
			case .secur32:
				return "MS Security Support Provider Interface (Microsoft, 2011)"
			case .setupapi:
				return "MS Setup API (Microsoft, 2004)"
			case .shockwave:
				return "Shockwave (Adobe, 2018)"
			case .speechsdk:
				return "MS Speech SDK 5.1 (Microsoft, 2009)"
			case .tabctl32:
				return "Microsoft Tabbed Dialog Control 6.0 (tabctl32.ocx) (Microsoft, 2012)"
			case .ucrtbase2019:
				return "Visual C++ 2019 library (ucrtbase.dll) (Microsoft, 2019)"
			case .uiribbon:
				return "Windows UIRibbon (Microsoft, 2011)"
			case .updspapi:
				return "Windows Update Service API (Microsoft, 2004)"
			case .urlmon:
				return "MS urlmon (Microsoft, 2011)"
			case .usp10:
				return "Uniscribe (Microsoft, 2011)"
			case .vb2run:
				return "MS Visual Basic 2 runtime (Microsoft, 1993)"
			case .vb3run:
				return "MS Visual Basic 3 runtime (Microsoft, 1998)"
			case .vb4run:
				return "MS Visual Basic 4 runtime (Microsoft, 1998)"
			case .vb5run:
				return "MS Visual Basic 5 runtime (Microsoft, 2001)"
			case .vb6run:
				return "MS Visual Basic 6 runtime sp6 (Microsoft, 2004)"
			case .vcrun2003:
				return "Visual C++ 2003 libraries (mfc71,msvcp71,msvcr71) (Microsoft, 2003)"
			case .vcrun2005:
				return "Visual C++ 2005 libraries (mfc80,msvcp80,msvcr80) (Microsoft, 2011)"
			case .vcrun2008:
				return "Visual C++ 2008 libraries (mfc90,msvcp90,msvcr90) (Microsoft, 2011)"
			case .vcrun2010:
				return "Visual C++ 2010 libraries (mfc100,msvcp100,msvcr100) (Microsoft, 2010)"
			case .vcrun2012:
				return "Visual C++ 2012 libraries (atl110,mfc110,mfc110u,msvcp110,msvcr110,vcomp110) (Microsoft, 2012)"
			case .vcrun2013:
				return "Visual C++ 2013 libraries (mfc120,mfc120u,msvcp120,msvcr120,vcomp120) (Microsoft, 2013)"
			case .vcrun2015:
				return "Visual C++ 2015 libraries (concrt140.dll,mfc140.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_atomic_wait.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll) (Microsoft, 2015)"
			case .vcrun2017:
				return "Visual C++ 2017 libraries (concrt140.dll,mfc140.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_2.dll,msvcp140_atomic_wait.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll) (Microsoft, 2017)"
			case .vcrun2019:
				return "Visual C++ 2015-2019 libraries (concrt140.dll,mfc140.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_2.dll,msvcp140_atomic_wait.dll,msvcp140_codecvt_ids.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll (Microsoft, 2019)"
			case .vcrun2022:
				return "Visual C++ 2015-2022 libraries (concrt140.dll,mfc140.dll,mfc140chs.dll,mfc140cht.dll,mfc140deu.dll,mfc140enu.dll,mfc140esn.dll,mfc140fra.dll,mfc140ita.dll,mfc140jpn.dll,mfc140kor.dll,mfc140rus.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_2.dll,msvcp140_atomic_wait.dll,msvcp140_codecvt_ids.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll) (Microsoft, 2022)"
			case .vcrun6:
				return "Visual C++ 6 SP4 libraries (mfc42, msvcp60, msvcirt) (Microsoft, 2000)"
			case .vcrun6sp6:
				return "Visual C++ 6 SP6 libraries (with fixes in ATL and MFC) (Microsoft, 2004)"
			case .vjrun20:
				return "MS Visual J# 2.0 SE libraries (requires dotnet20) (Microsoft, 2007)"
			case .vkd3d:
				return "Vulkan-based D3D12 implementation for Linux / Wine (latest) (Hans-Kristian Arntzen , 2020)"
			case .webio:
				return "MS Windows Web I/O (Microsoft, 2011)"
			case .windowscodecs:
				return "MS Windows Imaging Component (Microsoft, 2006)"
			case .winhttp:
				return "MS Windows HTTP Services (Microsoft, 2005)"
			case .wininet:
				return "MS Windows Internet API (Microsoft, 2011)"
			case .wininetWin2k:
				return "MS Windows Internet API (Microsoft, 2008)"
			case .wmi:
				return "Windows Management Instrumentation (aka WBEM) Core 1.5 (Microsoft, 2000)"
			case .wmp10:
				return "Windows Media Player 10 (Microsoft, 2006)"
			case .wmp11:
				return "Windows Media Player 11 (Microsoft, 2007)"
			case .wmp9:
				return "Windows Media Player 9 (Microsoft, 2003)"
			case .wmv9vcm:
				return "MS Windows Media Video 9 Video Compression Manager (Microsoft, 2013)"
			case .wsh57:
				return "MS Windows Script Host 5.7 (Microsoft, 2007)"
			case .xact:
				return "MS XACT Engine (32-bit only) (Microsoft, 2010)"
			case .xactX64:
				return "MS XACT Engine (64-bit only) (Microsoft, 2010)"
			case .xinput:
				return "Microsoft XInput (Xbox controller support) (Microsoft, 2010)"
			case .xmllite:
				return "MS xmllite dll (Microsoft, 2011)"
			case .xna31:
				return "MS XNA Framework Redistributable 3.1 (Microsoft, 2009)"
			case .xna40:
				return "MS XNA Framework Redistributable 4.0 (Microsoft, 2010)"
			case .xvid:
				return "Xvid Video Codec (xvid.org, 2019)"
            }
        }
    }
}