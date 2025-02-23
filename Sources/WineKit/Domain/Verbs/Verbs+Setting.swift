//
// Verbs+Setting.swift
// WineKit
// 
// Source: https://github.com/Winetricks/winetricks
//
// Automatically generated on 1.3.2025.
//

import Foundation

extension Winetricks {
	/// Winetricks verbs from Setting.txt
	public enum Setting: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		/// Override most common DLLs to builtin
		case alldllsBuiltin = "alldlls=builtin"
		/// Remove all DLL overrides
		case alldllsDefault = "alldlls=default"
		/// Prevent winedbg from launching when an unhandled exception occurs
		case autostartWinedbgDisabled = "autostart_winedbg=disabled"
		/// Automatically launch winedbg when an unhandled exception occurs (default)
		case autostartWinedbgEnabled = "autostart_winedbg=enabled"
		/// Fake verb that always returns false
		case bad = "bad"
		/// Disable CheckFloatConstants (default)
		case cfcDisabled = "cfc=disabled"
		/// Enable CheckFloatConstants
		case cfcEnabled = "cfc=enabled"
		/// Enable and force serialisation of OpenGL or Vulkan commands between multiple command streams in the same application
		case csmtForce = "csmt=force"
		/// Disable Command Stream Multithreading
		case csmtOff = "csmt=off"
		/// Enable Command Stream Multithreading (default)
		case csmtOn = "csmt=on"
		/// Check for broken fonts
		case fontfix = "fontfix"
		/// Enable subpixel font smoothing for BGR LCDs
		case fontsmoothBgr = "fontsmooth=bgr"
		/// Disable font smoothing
		case fontsmoothDisable = "fontsmooth=disable"
		/// Enable subpixel font smoothing
		case fontsmoothGray = "fontsmooth=gray"
		/// Enable subpixel font smoothing for RGB LCDs
		case fontsmoothRgb = "fontsmooth=rgb"
		/// Force using Mono instead of .NET (for debugging)
		case forcemono = "forcemono"
		/// Fake verb that always returns true
		case good = "good"
		/// Disable cursor clipping for full-screen windows (default)
		case grabfullscreenN = "grabfullscreen=n"
		/// Force cursor clipping for full-screen windows (needed by some games)
		case grabfullscreenY = "grabfullscreen=y"
		/// Set graphics driver to default
		case graphicsDefault = "graphics=default"
		/// Set graphics driver to Quartz (for macOS)
		case graphicsMac = "graphics=mac"
		/// Set graphics driver to Wayland
		case graphicsWayland = "graphics=wayland"
		/// Set graphics driver to X11
		case graphicsX11 = "graphics=x11"
		/// Set MaxShaderModelGS to 0
		case gsm0 = "gsm=0"
		/// Set MaxShaderModelGS to 1
		case gsm1 = "gsm=1"
		/// Set MaxShaderModelGS to 2
		case gsm2 = "gsm=2"
		/// Set MaxShaderModelGS to 3
		case gsm3 = "gsm=3"
		/// Enable heap checking with GlobalFlag
		case heapcheck = "heapcheck"
		/// Disable hiding Wine exports from applications (wine-staging)
		case hidewineexportsDisable = "hidewineexports=disable"
		/// Enable hiding Wine exports from applications (wine-staging)
		case hidewineexportsEnable = "hidewineexports=enable"
		/// Add empty C:\windows\system32\driverstc\{hosts,services} files
		case hosts = "hosts"
		/// Remove wineprefix links to /home/austin
		case isolateHome = "isolate_home"
		/// Enable mapping opt->alt and cmd->ctrl keys for the Mac native driver
		case mackeyremapBoth = "mackeyremap=both"
		/// Enable mapping of left opt->alt and cmd->ctrl keys for the Mac native driver
		case mackeyremapLeft = "mackeyremap=left"
		/// Do not remap keys for the Mac native driver (default)
		case mackeyremapNone = "mackeyremap=none"
		/// Disable exporting MIME-type file associations to the native desktop
		case mimeassocOff = "mimeassoc=off"
		/// Enable exporting MIME-type file associations to the native desktop (default)
		case mimeassocOn = "mimeassoc=on"
		/// Set DirectInput MouseWarpOverride to disable
		case mwoDisable = "mwo=disable"
		/// Set DirectInput MouseWarpOverride to enabled (default)
		case mwoEnabled = "mwo=enabled"
		/// Set DirectInput MouseWarpOverride to force (needed by some games)
		case mwoForce = "mwo=force"
		/// Override odbc32, odbccp32 and oledb32
		case nativeMdac = "native_mdac"
		/// Override oleaut32
		case nativeOleaut32 = "native_oleaut32"
		/// Disable crash dialog
		case nocrashdialog = "nocrashdialog"
		/// Set NonPower2Mode to repack
		case npmRepack = "npm=repack"
		/// Set Windows version to Windows NT 3.51
		case nt351 = "nt351"
		/// Set Windows version to Windows NT 4.0
		case nt40 = "nt40"
		/// Set OffscreenRenderingMode=backbuffer
		case ormBackbuffer = "orm=backbuffer"
		/// Set OffscreenRenderingMode=fbo (default)
		case ormFbo = "orm=fbo"
		/// Set MaxShaderModelPS to 0
		case psm0 = "psm=0"
		/// Set MaxShaderModelPS to 1
		case psm1 = "psm=1"
		/// Set MaxShaderModelPS to 2
		case psm2 = "psm=2"
		/// Set MaxShaderModelPS to 3
		case psm3 = "psm=3"
		/// Remove builtin wine-mono
		case removeMono = "remove_mono"
		/// Set renderer to gdi
		case rendererGdi = "renderer=gdi"
		/// Set renderer to gl
		case rendererGl = "renderer=gl"
		/// Set renderer to no3d
		case rendererNo3d = "renderer=no3d"
		/// Set renderer to vulkan
		case rendererVulkan = "renderer=vulkan"
		/// Set RenderTargetLockMode to auto (default)
		case rtlmAuto = "rtlm=auto"
		/// Set RenderTargetLockMode to disabled
		case rtlmDisabled = "rtlm=disabled"
		/// Set RenderTargetLockMode to readdraw
		case rtlmReaddraw = "rtlm=readdraw"
		/// Set RenderTargetLockMode to readtex
		case rtlmReadtex = "rtlm=readtex"
		/// Set RenderTargetLockMode to texdraw
		case rtlmTexdraw = "rtlm=texdraw"
		/// Set RenderTargetLockMode to textex
		case rtlmTextex = "rtlm=textex"
		/// Sandbox the wineprefix - remove links to /home/austin
		case sandbox = "sandbox"
		/// Set MIDImap device to the value specified in the MIDI_DEVICE environment variable
		case setMididevice = "set_mididevice"
		/// set user PATH variable in wine prefix specified by native and/or wine paths in WINEPATH environment variable with ';' as path separator
		case setUserpath = "set_userpath"
		/// Set shader_backend to arb
		case shaderBackendArb = "shader_backend=arb"
		/// Set shader_backend to glsl
		case shaderBackendGlsl = "shader_backend=glsl"
		/// Set shader_backend to none
		case shaderBackendNone = "shader_backend=none"
		/// Set sound driver to ALSA
		case soundAlsa = "sound=alsa"
		/// Set sound driver to Mac CoreAudio
		case soundCoreaudio = "sound=coreaudio"
		/// Set sound driver to disabled
		case soundDisabled = "sound=disabled"
		/// Set sound driver to OSS
		case soundOss = "sound=oss"
		/// Set sound driver to PulseAudio
		case soundPulse = "sound=pulse"
		/// Disable Struct Shader Math (default)
		case ssmDisabled = "ssm=disabled"
		/// Enable Struct Shader Math
		case ssmEnabled = "ssm=enabled"
		/// Disable UseTakeFocus (default)
		case usetakefocusN = "usetakefocus=n"
		/// Enable UseTakeFocus
		case usetakefocusY = "usetakefocus=y"
		/// Enable virtual desktop, set size to 1024x768
		case vd1024x768 = "vd=1024x768"
		/// Enable virtual desktop, set size to 1280x1024
		case vd1280x1024 = "vd=1280x1024"
		/// Enable virtual desktop, set size to 1440x900
		case vd1440x900 = "vd=1440x900"
		/// Enable virtual desktop, set size to 640x480
		case vd640x480 = "vd=640x480"
		/// Enable virtual desktop, set size to 800x600
		case vd800x600 = "vd=800x600"
		/// Disable virtual desktop
		case vdOff = "vd=off"
		/// Tell Wine your video card has 1024MB RAM
		case videomemorysize1024 = "videomemorysize=1024"
		/// Tell Wine your video card has 2048MB RAM
		case videomemorysize2048 = "videomemorysize=2048"
		/// Tell Wine your video card has 512MB RAM
		case videomemorysize512 = "videomemorysize=512"
		/// Let Wine detect amount of video card memory
		case videomemorysizeDefault = "videomemorysize=default"
		/// Set Windows version to Windows Vista
		case vista = "vista"
		/// Set MaxShaderModelVS to 0
		case vsm0 = "vsm=0"
		/// Set MaxShaderModelVS to 1
		case vsm1 = "vsm=1"
		/// Set MaxShaderModelVS to 2
		case vsm2 = "vsm=2"
		/// Set MaxShaderModelVS to 3
		case vsm3 = "vsm=3"
		/// Set Windows version to Windows 10
		case win10 = "win10"
		/// Set Windows version to Windows 11
		case win11 = "win11"
		/// Set Windows version to Windows 2.0
		case win20 = "win20"
		/// Set Windows version to Windows 2000
		case win2k = "win2k"
		/// Set Windows version to Windows 2003
		case win2k3 = "win2k3"
		/// Set Windows version to Windows 2008
		case win2k8 = "win2k8"
		/// Set Windows version to Windows 2008 R2
		case win2k8r2 = "win2k8r2"
		/// Set Windows version to Windows 3.0
		case win30 = "win30"
		/// Set Windows version to Windows 3.1
		case win31 = "win31"
		/// Set Windows version to Windows 7
		case win7 = "win7"
		/// Set Windows version to Windows 8
		case win8 = "win8"
		/// Set Windows version to Windows 8.1
		case win81 = "win81"
		/// Set Windows version to Windows 95
		case win95 = "win95"
		/// Set Windows version to Windows 98
		case win98 = "win98"
		/// Prevent the window manager from decorating windows
		case windowmanagerdecoratedN = "windowmanagerdecorated=n"
		/// Allow the window manager to decorate windows (default)
		case windowmanagerdecoratedY = "windowmanagerdecorated=y"
		/// Prevent the window manager from controlling windows
		case windowmanagermanagedN = "windowmanagermanaged=n"
		/// Allow the window manager to control windows (default)
		case windowmanagermanagedY = "windowmanagermanaged=y"
		/// Set Windows version to Windows ME
		case winme = "winme"
		/// Set Windows version to default (win7)
		case winver = "winver="
		/// Set Windows version to Windows XP
		case winxp = "winxp"

		// MARK: - CustomStringConvertible

		public var description: String {
			switch self {
			case .alldllsBuiltin:
				return "Override most common DLLs to builtin"
			case .alldllsDefault:
				return "Remove all DLL overrides"
			case .autostartWinedbgDisabled:
				return "Prevent winedbg from launching when an unhandled exception occurs"
			case .autostartWinedbgEnabled:
				return "Automatically launch winedbg when an unhandled exception occurs (default)"
			case .bad:
				return "Fake verb that always returns false"
			case .cfcDisabled:
				return "Disable CheckFloatConstants (default)"
			case .cfcEnabled:
				return "Enable CheckFloatConstants"
			case .csmtForce:
				return "Enable and force serialisation of OpenGL or Vulkan commands between multiple command streams in the same application"
			case .csmtOff:
				return "Disable Command Stream Multithreading"
			case .csmtOn:
				return "Enable Command Stream Multithreading (default)"
			case .fontfix:
				return "Check for broken fonts"
			case .fontsmoothBgr:
				return "Enable subpixel font smoothing for BGR LCDs"
			case .fontsmoothDisable:
				return "Disable font smoothing"
			case .fontsmoothGray:
				return "Enable subpixel font smoothing"
			case .fontsmoothRgb:
				return "Enable subpixel font smoothing for RGB LCDs"
			case .forcemono:
				return "Force using Mono instead of .NET (for debugging)"
			case .good:
				return "Fake verb that always returns true"
			case .grabfullscreenN:
				return "Disable cursor clipping for full-screen windows (default)"
			case .grabfullscreenY:
				return "Force cursor clipping for full-screen windows (needed by some games)"
			case .graphicsDefault:
				return "Set graphics driver to default"
			case .graphicsMac:
				return "Set graphics driver to Quartz (for macOS)"
			case .graphicsWayland:
				return "Set graphics driver to Wayland"
			case .graphicsX11:
				return "Set graphics driver to X11"
			case .gsm0:
				return "Set MaxShaderModelGS to 0"
			case .gsm1:
				return "Set MaxShaderModelGS to 1"
			case .gsm2:
				return "Set MaxShaderModelGS to 2"
			case .gsm3:
				return "Set MaxShaderModelGS to 3"
			case .heapcheck:
				return "Enable heap checking with GlobalFlag"
			case .hidewineexportsDisable:
				return "Disable hiding Wine exports from applications (wine-staging)"
			case .hidewineexportsEnable:
				return "Enable hiding Wine exports from applications (wine-staging)"
			case .hosts:
				return "Add empty C:\\windows\\system32\\driverstc\\{hosts,services} files"
			case .isolateHome:
				return "Remove wineprefix links to /home/austin"
			case .mackeyremapBoth:
				return "Enable mapping opt->alt and cmd->ctrl keys for the Mac native driver"
			case .mackeyremapLeft:
				return "Enable mapping of left opt->alt and cmd->ctrl keys for the Mac native driver"
			case .mackeyremapNone:
				return "Do not remap keys for the Mac native driver (default)"
			case .mimeassocOff:
				return "Disable exporting MIME-type file associations to the native desktop"
			case .mimeassocOn:
				return "Enable exporting MIME-type file associations to the native desktop (default)"
			case .mwoDisable:
				return "Set DirectInput MouseWarpOverride to disable"
			case .mwoEnabled:
				return "Set DirectInput MouseWarpOverride to enabled (default)"
			case .mwoForce:
				return "Set DirectInput MouseWarpOverride to force (needed by some games)"
			case .nativeMdac:
				return "Override odbc32, odbccp32 and oledb32"
			case .nativeOleaut32:
				return "Override oleaut32"
			case .nocrashdialog:
				return "Disable crash dialog"
			case .npmRepack:
				return "Set NonPower2Mode to repack"
			case .nt351:
				return "Set Windows version to Windows NT 3.51"
			case .nt40:
				return "Set Windows version to Windows NT 4.0"
			case .ormBackbuffer:
				return "Set OffscreenRenderingMode=backbuffer"
			case .ormFbo:
				return "Set OffscreenRenderingMode=fbo (default)"
			case .psm0:
				return "Set MaxShaderModelPS to 0"
			case .psm1:
				return "Set MaxShaderModelPS to 1"
			case .psm2:
				return "Set MaxShaderModelPS to 2"
			case .psm3:
				return "Set MaxShaderModelPS to 3"
			case .removeMono:
				return "Remove builtin wine-mono"
			case .rendererGdi:
				return "Set renderer to gdi"
			case .rendererGl:
				return "Set renderer to gl"
			case .rendererNo3d:
				return "Set renderer to no3d"
			case .rendererVulkan:
				return "Set renderer to vulkan"
			case .rtlmAuto:
				return "Set RenderTargetLockMode to auto (default)"
			case .rtlmDisabled:
				return "Set RenderTargetLockMode to disabled"
			case .rtlmReaddraw:
				return "Set RenderTargetLockMode to readdraw"
			case .rtlmReadtex:
				return "Set RenderTargetLockMode to readtex"
			case .rtlmTexdraw:
				return "Set RenderTargetLockMode to texdraw"
			case .rtlmTextex:
				return "Set RenderTargetLockMode to textex"
			case .sandbox:
				return "Sandbox the wineprefix - remove links to /home/austin"
			case .setMididevice:
				return "Set MIDImap device to the value specified in the MIDI_DEVICE environment variable"
			case .setUserpath:
				return "set user PATH variable in wine prefix specified by native and/or wine paths in WINEPATH environment variable with ';' as path separator"
			case .shaderBackendArb:
				return "Set shader_backend to arb"
			case .shaderBackendGlsl:
				return "Set shader_backend to glsl"
			case .shaderBackendNone:
				return "Set shader_backend to none"
			case .soundAlsa:
				return "Set sound driver to ALSA"
			case .soundCoreaudio:
				return "Set sound driver to Mac CoreAudio"
			case .soundDisabled:
				return "Set sound driver to disabled"
			case .soundOss:
				return "Set sound driver to OSS"
			case .soundPulse:
				return "Set sound driver to PulseAudio"
			case .ssmDisabled:
				return "Disable Struct Shader Math (default)"
			case .ssmEnabled:
				return "Enable Struct Shader Math"
			case .usetakefocusN:
				return "Disable UseTakeFocus (default)"
			case .usetakefocusY:
				return "Enable UseTakeFocus"
			case .vd1024x768:
				return "Enable virtual desktop, set size to 1024x768"
			case .vd1280x1024:
				return "Enable virtual desktop, set size to 1280x1024"
			case .vd1440x900:
				return "Enable virtual desktop, set size to 1440x900"
			case .vd640x480:
				return "Enable virtual desktop, set size to 640x480"
			case .vd800x600:
				return "Enable virtual desktop, set size to 800x600"
			case .vdOff:
				return "Disable virtual desktop"
			case .videomemorysize1024:
				return "Tell Wine your video card has 1024MB RAM"
			case .videomemorysize2048:
				return "Tell Wine your video card has 2048MB RAM"
			case .videomemorysize512:
				return "Tell Wine your video card has 512MB RAM"
			case .videomemorysizeDefault:
				return "Let Wine detect amount of video card memory"
			case .vista:
				return "Set Windows version to Windows Vista"
			case .vsm0:
				return "Set MaxShaderModelVS to 0"
			case .vsm1:
				return "Set MaxShaderModelVS to 1"
			case .vsm2:
				return "Set MaxShaderModelVS to 2"
			case .vsm3:
				return "Set MaxShaderModelVS to 3"
			case .win10:
				return "Set Windows version to Windows 10"
			case .win11:
				return "Set Windows version to Windows 11"
			case .win20:
				return "Set Windows version to Windows 2.0"
			case .win2k:
				return "Set Windows version to Windows 2000"
			case .win2k3:
				return "Set Windows version to Windows 2003"
			case .win2k8:
				return "Set Windows version to Windows 2008"
			case .win2k8r2:
				return "Set Windows version to Windows 2008 R2"
			case .win30:
				return "Set Windows version to Windows 3.0"
			case .win31:
				return "Set Windows version to Windows 3.1"
			case .win7:
				return "Set Windows version to Windows 7"
			case .win8:
				return "Set Windows version to Windows 8"
			case .win81:
				return "Set Windows version to Windows 8.1"
			case .win95:
				return "Set Windows version to Windows 95"
			case .win98:
				return "Set Windows version to Windows 98"
			case .windowmanagerdecoratedN:
				return "Prevent the window manager from decorating windows"
			case .windowmanagerdecoratedY:
				return "Allow the window manager to decorate windows (default)"
			case .windowmanagermanagedN:
				return "Prevent the window manager from controlling windows"
			case .windowmanagermanagedY:
				return "Allow the window manager to control windows (default)"
			case .winme:
				return "Set Windows version to Windows ME"
			case .winver:
				return "Set Windows version to default (win7)"
			case .winxp:
				return "Set Windows version to Windows XP"
			}
		}
	}
}
