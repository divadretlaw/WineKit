//
// Verbs+Font.swift
// WineKit
// 
// Source: https://github.com/Winetricks/winetricks
//
// Automatically generated on 9.2.2025.
//

import Foundation

extension Winetricks {
	/// Winetricks verbs from Font.txt
	public enum Font: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		/// All fonts (various, 1998-2010)
		case allfonts = "allfonts"
		/// MS Andale Mono font (Microsoft, 2008)
		case andale = "andale"
		/// MS Arial / Arial Black fonts (Microsoft, 2008)
		case arial = "arial"
		/// Baekmuk Korean fonts (Wooderart Inc. / kldp.net, 1999)
		case baekmuk = "baekmuk"
		/// MS Calibri font (Microsoft, 2007)
		case calibri = "calibri"
		/// MS Cambria font (Microsoft, 2009)
		case cambria = "cambria"
		/// MS Candara font (Microsoft, 2009)
		case candara = "candara"
		/// All Chinese, Japanese, Korean fonts and aliases (Various, )
		case cjkfonts = "cjkfonts"
		/// MS Comic Sans fonts (Microsoft, 2008)
		case comicsans = "comicsans"
		/// MS Consolas console font (Microsoft, 2011)
		case consolas = "consolas"
		/// MS Constantia font (Microsoft, 2009)
		case constantia = "constantia"
		/// MS Corbel font (Microsoft, 2009)
		case corbel = "corbel"
		/// MS Arial, Courier, Times fonts (Microsoft, 2008)
		case corefonts = "corefonts"
		/// MS Courier fonts (Microsoft, 2008)
		case courier = "courier"
		/// Droid fonts (Ascender Corporation, 2009)
		case droid = "droid"
		/// Updated fonts for Romanian and Bulgarian (Microsoft, 2008)
		case eufonts = "eufonts"
		/// Creates aliases for Chinese fonts using Source Han Sans fonts (Adobe, 2019)
		case fakechinese = "fakechinese"
		/// Creates aliases for Japanese fonts using Source Han Sans fonts (Adobe, 2019)
		case fakejapanese = "fakejapanese"
		/// Creates aliases for Japanese fonts using IPAMona fonts (Jun Kobayashi, 2008)
		case fakejapaneseIpamona = "fakejapanese_ipamona"
		/// Creates aliases for Japanese Meiryo fonts using VLGothic fonts (Project Vine / Daisuke Suzuki, 2014)
		case fakejapaneseVlgothic = "fakejapanese_vlgothic"
		/// Creates aliases for Korean fonts using Source Han Sans fonts (Adobe, 2019)
		case fakekorean = "fakekorean"
		/// MS Georgia fonts (Microsoft, 2008)
		case georgia = "georgia"
		/// MS Impact fonts (Microsoft, 2008)
		case impact = "impact"
		/// IPAMona Japanese fonts (Jun Kobayashi, 2008)
		case ipamona = "ipamona"
		/// Red Hat Liberation fonts (Mono, Sans, SansNarrow, Serif) (Red Hat, 2008)
		case liberation = "liberation"
		/// MS Lucida Console font (Microsoft, 1998)
		case lucida = "lucida"
		/// MS Meiryo font (Microsoft, 2009)
		case meiryo = "meiryo"
		/// MS Sans Serif font (Microsoft, 2004)
		case micross = "micross"
		/// OpenSymbol fonts (replacement for Wingdings) (libreoffice.org, 2022)
		case opensymbol = "opensymbol"
		/// All MS PowerPoint Viewer fonts (various, )
		case pptfonts = "pptfonts"
		/// Source Han Sans fonts (Adobe, 2021)
		case sourcehansans = "sourcehansans"
		/// MS Tahoma font (not part of corefonts) (Microsoft, 1999)
		case tahoma = "tahoma"
		/// Takao Japanese fonts (Jun Kobayashi, 2010)
		case takao = "takao"
		/// MS Times fonts (Microsoft, 2008)
		case times = "times"
		/// MS Trebuchet fonts (Microsoft, 2008)
		case trebuchet = "trebuchet"
		/// Ubuntu Font Family (Ubuntu, 2010)
		case uff = "uff"
		/// Unifont alternative to Arial Unicode MS (Roman Czyborra / GNU, 2021)
		case unifont = "unifont"
		/// MS Verdana fonts (Microsoft, 2008)
		case verdana = "verdana"
		/// VLGothic Japanese fonts (Project Vine / Daisuke Suzuki, 2014)
		case vlgothic = "vlgothic"
		/// MS Webdings fonts (Microsoft, 2008)
		case webdings = "webdings"
		/// WenQuanYi CJK font (wenq.org, 2009)
		case wenquanyi = "wenquanyi"
		/// WenQuanYi ZenHei font (wenq.org, 2009)
		case wenquanyizenhei = "wenquanyizenhei"

		// MARK: - CustomStringConvertible

		public var description: String {
			switch self {
			case .allfonts:
				return "All fonts (various, 1998-2010)"
			case .andale:
				return "MS Andale Mono font (Microsoft, 2008)"
			case .arial:
				return "MS Arial / Arial Black fonts (Microsoft, 2008)"
			case .baekmuk:
				return "Baekmuk Korean fonts (Wooderart Inc. / kldp.net, 1999)"
			case .calibri:
				return "MS Calibri font (Microsoft, 2007)"
			case .cambria:
				return "MS Cambria font (Microsoft, 2009)"
			case .candara:
				return "MS Candara font (Microsoft, 2009)"
			case .cjkfonts:
				return "All Chinese, Japanese, Korean fonts and aliases (Various, )"
			case .comicsans:
				return "MS Comic Sans fonts (Microsoft, 2008)"
			case .consolas:
				return "MS Consolas console font (Microsoft, 2011)"
			case .constantia:
				return "MS Constantia font (Microsoft, 2009)"
			case .corbel:
				return "MS Corbel font (Microsoft, 2009)"
			case .corefonts:
				return "MS Arial, Courier, Times fonts (Microsoft, 2008)"
			case .courier:
				return "MS Courier fonts (Microsoft, 2008)"
			case .droid:
				return "Droid fonts (Ascender Corporation, 2009)"
			case .eufonts:
				return "Updated fonts for Romanian and Bulgarian (Microsoft, 2008)"
			case .fakechinese:
				return "Creates aliases for Chinese fonts using Source Han Sans fonts (Adobe, 2019)"
			case .fakejapanese:
				return "Creates aliases for Japanese fonts using Source Han Sans fonts (Adobe, 2019)"
			case .fakejapaneseIpamona:
				return "Creates aliases for Japanese fonts using IPAMona fonts (Jun Kobayashi, 2008)"
			case .fakejapaneseVlgothic:
				return "Creates aliases for Japanese Meiryo fonts using VLGothic fonts (Project Vine / Daisuke Suzuki, 2014)"
			case .fakekorean:
				return "Creates aliases for Korean fonts using Source Han Sans fonts (Adobe, 2019)"
			case .georgia:
				return "MS Georgia fonts (Microsoft, 2008)"
			case .impact:
				return "MS Impact fonts (Microsoft, 2008)"
			case .ipamona:
				return "IPAMona Japanese fonts (Jun Kobayashi, 2008)"
			case .liberation:
				return "Red Hat Liberation fonts (Mono, Sans, SansNarrow, Serif) (Red Hat, 2008)"
			case .lucida:
				return "MS Lucida Console font (Microsoft, 1998)"
			case .meiryo:
				return "MS Meiryo font (Microsoft, 2009)"
			case .micross:
				return "MS Sans Serif font (Microsoft, 2004)"
			case .opensymbol:
				return "OpenSymbol fonts (replacement for Wingdings) (libreoffice.org, 2022)"
			case .pptfonts:
				return "All MS PowerPoint Viewer fonts (various, )"
			case .sourcehansans:
				return "Source Han Sans fonts (Adobe, 2021)"
			case .tahoma:
				return "MS Tahoma font (not part of corefonts) (Microsoft, 1999)"
			case .takao:
				return "Takao Japanese fonts (Jun Kobayashi, 2010)"
			case .times:
				return "MS Times fonts (Microsoft, 2008)"
			case .trebuchet:
				return "MS Trebuchet fonts (Microsoft, 2008)"
			case .uff:
				return "Ubuntu Font Family (Ubuntu, 2010)"
			case .unifont:
				return "Unifont alternative to Arial Unicode MS (Roman Czyborra / GNU, 2021)"
			case .verdana:
				return "MS Verdana fonts (Microsoft, 2008)"
			case .vlgothic:
				return "VLGothic Japanese fonts (Project Vine / Daisuke Suzuki, 2014)"
			case .webdings:
				return "MS Webdings fonts (Microsoft, 2008)"
			case .wenquanyi:
				return "WenQuanYi CJK font (wenq.org, 2009)"
			case .wenquanyizenhei:
				return "WenQuanYi ZenHei font (wenq.org, 2009)"
			}
		}
	}
}
