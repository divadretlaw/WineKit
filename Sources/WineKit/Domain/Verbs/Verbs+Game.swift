//
//  Verbs+Game.swift
//  WineKit
//
//  Created by David Walter on 15.12.23.
//

import Foundation

extension Winetricks {
    public enum Game: String, Hashable, Equatable, Codable, CustomStringConvertible {
		case acreedbro = "acreedbro"
		case algodooDemo = "algodoo_demo"
		case amnesiaTddDemo = "amnesia_tdd_demo"
		case aoe3Demo = "aoe3_demo"
		case avatarDemo = "avatar_demo"
		case bfbc2 = "bfbc2"
		case bioshock2 = "bioshock2"
		case bioshockDemo = "bioshock_demo"
		case blobbyVolley = "blobby_volley"
		case bttf101 = "bttf101"
		case cimDemo = "cim_demo"
		case civ4Demo = "civ4_demo"
		case cnc3Demo = "cnc3_demo"
		case cncRedalert3Demo = "cnc_redalert3_demo"
		case cod1 = "cod1"
		case cod4mwDemo = "cod4mw_demo"
		case cod5Waw = "cod5_waw"
		case codDemo = "cod_demo"
		case crayonphysicsDemo = "crayonphysics_demo"
		case crysis2 = "crysis2"
		case csi6Demo = "csi6_demo"
		case darknesswithin2Demo = "darknesswithin2_demo"
		case darkspore = "darkspore"
		case dcuo = "dcuo"
		case deadspace = "deadspace"
		case deadspace2 = "deadspace2"
		case demolitionCompanyDemo = "demolition_company_demo"
		case deusex2Demo = "deusex2_demo"
		case diablo2 = "diablo2"
		case dirt2Demo = "dirt2_demo"
		case dragonage = "dragonage"
		case dragonage2Demo = "dragonage2_demo"
		case dragonageUe = "dragonage_ue"
		case eve = "eve"
		case fableTlc = "fable_tlc"
		case fifa11Demo = "fifa11_demo"
		case gtaVc = "gta_vc"
		case hordesoforcs2Demo = "hordesoforcs2_demo"
		case kotor1 = "kotor1"
		case lemonysnicket = "lemonysnicket"
		case lhpDemo = "lhp_demo"
		case losthorizonDemo = "losthorizon_demo"
		case lswcs = "lswcs"
		case luxorAr = "luxor_ar"
		case masseffect2 = "masseffect2"
		case masseffect2Demo = "masseffect2_demo"
		case maxmagicmarkerDemo = "maxmagicmarker_demo"
		case mdk = "mdk"
		case menofwar = "menofwar"
		case mfsxDemo = "mfsx_demo"
		case mfsxde = "mfsxde"
		case myth2Demo = "myth2_demo"
		case nfsshiftDemo = "nfsshift_demo"
		case oblivion = "oblivion"
		case penpenxmas = "penpenxmas"
		case popfs = "popfs"
		case rct3deluxe = "rct3deluxe"
		case riseofnationsDemo = "riseofnations_demo"
		case sammax301Demo = "sammax301_demo"
		case sammax304Demo = "sammax304_demo"
		case secondlife = "secondlife"
		case sims3 = "sims3"
		case sims3Gen = "sims3_gen"
		case simsmed = "simsmed"
		case singularity = "singularity"
		case splitsecond = "splitsecond"
		case spore = "spore"
		case sporeCcDemo = "spore_cc_demo"
		case starcraft2Demo = "starcraft2_demo"
		case theundergardenDemo = "theundergarden_demo"
		case tmnationsforever = "tmnationsforever"
		case torchlight = "torchlight"
		case trainztcc2004 = "trainztcc_2004"
		case tropico3Demo = "tropico3_demo"
		case twfc = "twfc"
		case typingofthedeadDemo = "typingofthedead_demo"
		case ut3 = "ut3"
		case wog = "wog"

        // MARK: - CustomStringConvertible
    
        public var description: String {
            switch self {
			case .acreedbro:
				return "Assassin's Creed Brotherhood (Ubisoft, 2011)"
			case .algodooDemo:
				return "Algodoo Demo (Algoryx, 2009)"
			case .amnesiaTddDemo:
				return "Amnesia: The Dark Descent Demo (Frictional Games, 2010)"
			case .aoe3Demo:
				return "Age of Empires III Trial (Microsoft, 2005)"
			case .avatarDemo:
				return "James Camerons Avatar: The Game Demo (Ubisoft, 2009)"
			case .bfbc2:
				return "Battlefield Bad Company 2 (EA, 2010)"
			case .bioshock2:
				return "Bioshock 2 (2K Games, 2010)"
			case .bioshockDemo:
				return "Bioshock Demo (2K Games, 2007)"
			case .blobbyVolley:
				return "Blobby Volley (Daniel Skoraszewsky, 2000)"
			case .bttf101:
				return "Back to the Future Episode 1 (Telltale, 2011)"
			case .cimDemo:
				return "Cities In Motion Demo (Paradox Interactive, 2010)"
			case .civ4Demo:
				return "Civilization IV Demo (Firaxis Games, 2005)"
			case .cnc3Demo:
				return "Command & Conquer 3 Demo (EA, 2007)"
			case .cncRedalert3Demo:
				return "Command & Conquer Red Alert 3 Demo (EA, 2008)"
			case .cod1:
				return "Call of Duty (Activision, 2003)"
			case .cod4mwDemo:
				return "Call of Duty 4: Modern Warfare (Activision, 2007)"
			case .cod5Waw:
				return "Call of Duty 5: World at War (Activision, 2008)"
			case .codDemo:
				return "Call of Duty demo (Activision, 2003)"
			case .crayonphysicsDemo:
				return "Crayon Physics Deluxe demo (Kloonigames, 2011)"
			case .crysis2:
				return "Crysis 2 (EA, 2011)"
			case .csi6Demo:
				return "CSI: Fatal Conspiracy Demo (Ubisoft, 2010)"
			case .darknesswithin2Demo:
				return "Darkness Within 2 Demo (Zoetrope Interactive, 2010)"
			case .darkspore:
				return "Darkspore (EA, 2011)"
			case .dcuo:
				return "DC Universe Online (EA, 2011)"
			case .deadspace:
				return "Dead Space (EA, 2008)"
			case .deadspace2:
				return "Dead Space 2 (EA, 2011)"
			case .demolitionCompanyDemo:
				return "Demolition Company demo (Giants Software, 2010)"
			case .deusex2Demo:
				return "Deus Ex 2 / Deus Ex: Invisible War Demo (Eidos, 2003)"
			case .diablo2:
				return "Diablo II (Blizzard, 2000)"
			case .dirt2Demo:
				return "Dirt 2 Demo (Codemasters, 2009)"
			case .dragonage:
				return "Dragon Age: Origins (Bioware / EA, 2009)"
			case .dragonage2Demo:
				return "Dragon Age II demo (EA/Bioware, 2011)"
			case .dragonageUe:
				return "Dragon Age: Origins - Ultimate Edition (Bioware / EA, 2010)"
			case .eve:
				return "EVE Online Tyrannis (CCP Games, 2017)"
			case .fableTlc:
				return "Fable: The Lost Chapters (Microsoft, 2005)"
			case .fifa11Demo:
				return "FIFA 11 Demo (EA Sports, 2010)"
			case .gtaVc:
				return "Grand Theft Auto: Vice City (Rockstar, 2003)"
			case .hordesoforcs2Demo:
				return "Hordes of Orcs 2 Demo (Freeverse, 2010)"
			case .kotor1:
				return "Star Wars: Knights of the Old Republic (LucasArts, 2003)"
			case .lemonysnicket:
				return "Lemony Snicket: A Series of Unfortunate Events (Activision, 2004)"
			case .lhpDemo:
				return "LEGO Harry Potter Demo [Years 1-4] (Travellers Tales / WB, 2010)"
			case .losthorizonDemo:
				return "Lost Horizon Demo (Deep Silver, 2010)"
			case .lswcs:
				return "Lego Star Wars Complete Saga (Lucasarts, 2009)"
			case .luxorAr:
				return "Luxor Amun Rising (MumboJumbo, 2006)"
			case .masseffect2:
				return "Mass Effect 2 (DRM broken on Wine) (BioWare, 2010)"
			case .masseffect2Demo:
				return "Mass Effect 2 (BioWare, 2010)"
			case .maxmagicmarkerDemo:
				return "Max & the Magic Marker Demo (Press Play, 2010)"
			case .mdk:
				return "MDK (3dfx) (Playmates International, 1997)"
			case .menofwar:
				return "Men of War (Aspyr Media, 2009)"
			case .mfsxDemo:
				return "Microsoft Flight Simulator X Demo (Microsoft, 2006)"
			case .mfsxde:
				return "Microsoft Flight Simulator X: Deluxe Edition (Microsoft, 2006)"
			case .myth2Demo:
				return "Myth II demo 1.8.0 (Project Magma, 2011)"
			case .nfsshiftDemo:
				return "Need for Speed: SHIFT Demo (EA, 2009)"
			case .oblivion:
				return "Elder Scrolls: Oblivion (Bethesda Game Studios, 2006)"
			case .penpenxmas:
				return "Pen-Pen Xmas Olympics (Army of Trolls / Black Cat, 2007)"
			case .popfs:
				return "Prince of Persia: The Forgotten Sands (Ubisoft, 2010)"
			case .rct3deluxe:
				return "RollerCoaster Tycoon 3 Deluxe (DRM broken on Wine) (Atari, 2004)"
			case .riseofnationsDemo:
				return "Rise of Nations Trial (Microsoft, 2003)"
			case .sammax301Demo:
				return "Sam & Max 301: The Penal Zone (Telltale Games, 2010)"
			case .sammax304Demo:
				return "Sam & Max 304: Beyond the Alley of the Dolls (Telltale Games, 2010)"
			case .secondlife:
				return "Second Life Viewer (Linden Labs, 2003-2011)"
			case .sims3:
				return "The Sims 3 (DRM broken on Wine) (EA, 2009)"
			case .sims3Gen:
				return "The Sims 3: Generations (DRM broken on Wine) (EA, 2011)"
			case .simsmed:
				return "The Sims Medieval (DRM broken on Wine) (EA, 2011)"
			case .singularity:
				return "Singularity (Activision, 2010)"
			case .splitsecond:
				return "Split Second (Disney, 2010)"
			case .spore:
				return "Spore (EA, 2008)"
			case .sporeCcDemo:
				return "Spore Creature Creator trial (EA, 2008)"
			case .starcraft2Demo:
				return "Starcraft II Demo (Blizzard, 2010)"
			case .theundergardenDemo:
				return "The UnderGarden Demo (Atari, 2010)"
			case .tmnationsforever:
				return "TrackMania Nations Forever (Nadeo, 2009)"
			case .torchlight:
				return "Torchlight - boxed version (Runic Games, 2009)"
			case .trainztcc2004:
				return "Trainz: The Complete Collection: TRS2004 (Paradox Interactive, 2008)"
			case .tropico3Demo:
				return "Tropico 3 Demo (Kalypso Media GmbH, 2009)"
			case .twfc:
				return "Transformers: War for Cybertron (Activision, 2010)"
			case .typingofthedeadDemo:
				return "Typing of the Dead Demo (Sega, 1999)"
			case .ut3:
				return "Unreal Tournament 3 (Midway Games, 2007)"
			case .wog:
				return "World of Goo Demo (2D Boy, 2008)"
            }
        }
    }
}