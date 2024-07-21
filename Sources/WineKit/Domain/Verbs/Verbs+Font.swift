//
//  Verbs+Font.swift
//  WineKit
//
//  Created by David Walter on 15.12.23.
//

import Foundation

extension Winetricks {
    public enum Font: String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
		case allfonts = "allfonts"
		case andale = "andale"
		case arial = "arial"
		case baekmuk = "baekmuk"
		case calibri = "calibri"
		case cambria = "cambria"
		case candara = "candara"
		case cjkfonts = "cjkfonts"
		case comicsans = "comicsans"
		case consolas = "consolas"
		case constantia = "constantia"
		case corbel = "corbel"
		case corefonts = "corefonts"
		case courier = "courier"
		case droid = "droid"
		case eufonts = "eufonts"
		case fakechinese = "fakechinese"
		case fakejapanese = "fakejapanese"
		case fakejapaneseIpamona = "fakejapanese_ipamona"
		case fakejapaneseVlgothic = "fakejapanese_vlgothic"
		case fakekorean = "fakekorean"
		case georgia = "georgia"
		case impact = "impact"
		case ipamona = "ipamona"
		case liberation = "liberation"
		case lucida = "lucida"
		case meiryo = "meiryo"
		case opensymbol = "opensymbol"
		case pptfonts = "pptfonts"
		case sourcehansans = "sourcehansans"
		case tahoma = "tahoma"
		case takao = "takao"
		case times = "times"
		case trebuchet = "trebuchet"
		case uff = "uff"
		case unifont = "unifont"
		case verdana = "verdana"
		case vlgothic = "vlgothic"
		case webdings = "webdings"
		case wenquanyi = "wenquanyi"
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