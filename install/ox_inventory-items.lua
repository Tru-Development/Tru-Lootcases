-- Add these to ox_inventory/data/items.lua
-- Case items need the client event or ox_inventory will close with no lootcase UI.
['common_case'] = {
  label = 'Common Case',
  weight = 500,
  stack = true,
  close = true,
  description = 'A common Tru-Lootcase.',
  client = { image = 'common_case.png', event = 'tru-lootcases:client:useCase' }
},
['rare_case'] = {
  label = 'Rare Case',
  weight = 500,
  stack = true,
  close = true,
  description = 'A rare Tru-Lootcase.',
  client = { image = 'rare_case.png', event = 'tru-lootcases:client:useCase' }
},
['legendary_case'] = {
  label = 'Legendary Case',
  weight = 500,
  stack = true,
  close = true,
  description = 'A legendary Tru-Lootcase.',
  client = { image = 'legendary_case.png', event = 'tru-lootcases:client:useCase' }
},
['knife_case'] = {
  label = 'Knife Case',
  weight = 500,
  stack = true,
  close = true,
  description = 'A knife Tru-Lootcase.',
  client = { image = 'knife_case.png', event = 'tru-lootcases:client:useCase' }
},

-- Knife weapon items for ox_inventory
['WEAPON_BF_BLUESTEEL'] = {
			label = 'Butterfly Blue Steel',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_BOREALFOREST'] = {
			label = 'Butterfly Boreal Forest',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_CASEHARDENED'] = {
			label = 'Butterfly Case Hardened',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_CRIMSONWEB'] = {
			label = 'Butterfly Crimson Web',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DAMASCUSSTEEL'] = {
			label = 'Butterfly Damascus Steel',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERBLACKPEARL'] = {
			label = 'Butterfly Doppler Black Pearl',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERPHASE1'] = {
			label = 'Butterfly Doppler Phase 1',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERPHASE2'] = {
			label = 'Butterfly Doppler Phase 2',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERPHASE3'] = {
			label = 'Butterfly Doppler Phase 3',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERPHASE4'] = {
			label = 'Butterfly Doppler Phase 4',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERRUBY'] = {
			label = 'Butterfly Doppler Ruby',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_DOPPLERSAPPHIRE'] = {
			label = 'Butterfly Doppler Sapphire',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_FADE'] = {
			label = 'Butterfly Fade',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_FOREST'] = {
			label = 'Butterfly Forest',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_NIGHT'] = {
			label = 'Butterfly Night',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_RUSTCOAT'] = {
			label = 'Butterfly Rust Coat',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_SAFARIMESH'] = {
			label = 'Butterfly Safari Mesh',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_SCORCHED'] = {
			label = 'Butterfly Scorched',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_SLAUGTHER'] = {
			label = 'Butterfly Slaugther',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_STAINED'] = {
			label = 'Butterfly Stained',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_TIGERTOOTH'] = {
			label = 'Butterfly Tiger Tooth',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_ULTRAVIOLET'] = {
			label = 'Butterfly Ultra Violet',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_BF_URBANMASKED'] = {
			label = 'Butterfly Urban Masked',
			weight = 300,
			durability = 0.1,
		},

		-- KARAMBIT 

		['WEAPON_KARAMBIT_AUTOTRONIC'] = {
			label = 'Karambit Autotronic',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_BLACKLAMINATE'] = {
			label = 'Karambit Black Laminate',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_BLUESTEEL'] = {
			label = 'Karambit Blue Steel',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_BOREALFOREST'] = {
			label = 'Karambit Boreal Forest',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_BRIGHTWATER'] = {
			label = 'Karambit Bright Water',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_CASEHARDENED'] = {
			label = 'Karambit Case Hardened',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_CRIMSONWEB'] = {
			label = 'Karambit Crimson Web',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DAMASCUSSTEEL'] = {
			label = 'Karambit Damascus Steel',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_BLACKPEARL'] = {
			label = 'Karambit Doppler BlackPearl',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DOPPLERPHASE1'] = {
			label = 'Karambit Doppler Phase 1',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DOPPLERPHASE2'] = {
			label = 'Karambit Doppler Phase 2',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DOPPLERPHASE3'] = {
			label = 'Karambit Doppler Phase 3',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DOPPLERPHASE4'] = {
			label = 'Karambit Doppler Phase 4',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DOPPLERRUBY'] = {
			label = 'Karambit Doppler Ruby',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_DOPPLERSAPPHIRE'] = {
			label = 'Karambit Doppler Sapphire',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_FADE'] = {
			label = 'Karambit Fade',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_FOREST'] = {
			label = 'Karambit Forest',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_FREEHAND'] = {
			label = 'Karambit Free Hand',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_GDEMERALD'] = {
			label = 'Karambit Gamma Doppler Emerald',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_GDP1'] = {
			label = 'Karambit Gamma Doppler Phase 1',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_GDP2'] = {
			label = 'Karambit Gamma Doppler Phase 2',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_GDP3'] = {
			label = 'Karambit Gamma Doppler Phase 3',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_GDP4'] = {
			label = 'Karambit Gamma Doppler Phase 4',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_LORE'] = {
			label = 'Karambit Lore',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_MARBLEFADE'] = {
			label = 'Karambit Marble Fade',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_NIGHT'] = {
			label = 'Karambit Night',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_RUSTCOAT'] = {
			label = 'Karambit Rust Coat',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_SAFARIMESH'] = {
			label = 'Karambit Safari Mesh',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_SCORCHED'] = {
			label = 'Karambit Scorched',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_SLAUGTHER'] = {
			label = 'Karambit Slaugther',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_STAINED'] = {
			label = 'Karambit Stained',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_TIGERTOOTH'] = {
			label = 'Karambit Tiger Tooth',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_ULTRAVIOLET'] = {
			label = 'Karambit Ultra Violet',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_KARAMBIT_URBANMASKED'] = {
			label = 'Karambit Urban Masked',
			weight = 300,
			durability = 0.1,
		},

		-- BAYONET
		['WEAPON_M9_AUTOTRONIC'] = {
			label = 'M9 Bayonet Autotronic',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_BLACKLAMINATE'] = {
			label = 'M9 Bayonet Black Laminate',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_BLUESTEEL'] = {
			label = 'M9 Bayonet Blue Steel',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_BRIGHTWATER'] = {
			label = 'M9 Bayonet Bright Water',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_CASEHARDENED'] = {
			label = 'M9 Bayonet Case Hardened',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_CRIMSONWEB'] = {
			label = 'M9 Bayonet Crimson Web',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DAMASCUSSTEEL'] = {
			label = 'M9 Bayonet Damascus Steel',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERBLACKPEARL'] = {
			label = 'M9 Bayonet Doppler Black Pearl',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERP1'] = {
			label = 'M9 Bayonet Doppler Phase 1',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERP2'] = {
			label = 'M9 Bayonet Doppler Phase 2',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERP3'] = {
			label = 'M9 Bayonet Doppler Phase 3',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERP4'] = {
			label = 'M9 Bayonet Doppler Phase 4',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERRUBY'] = {
			label = 'M9 Bayonet Doppler Rubby',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_DOPPLERSAPPHIRE'] = {
			label = 'M9 Bayonet Doppler Sapphire',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_GDEMERALD'] = {
			label = 'M9 Bayonet Emerald',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_FADE'] = {
			label = 'M9 Bayonet Fade',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_FREEHAND'] = {
			label = 'M9 Bayonet Free Hand',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_GDP1'] = {
			label = 'M9 Bayonet Gamma Doppler Phase 1',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_GDP2'] = {
			label = 'M9 Bayonet Gamma Doppler Phase 2',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_GDP3'] = {
			label = 'M9 Bayonet Gamma Doppler Phase 3',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_GDP4'] = {
			label = 'M9 Bayonet Gamma Doppler Phase 4',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_LORE'] = {
			label = 'M9 Bayonet Lore',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_MARBLEFADE'] = {
			label = 'M9 Bayonet Marble Fade',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_SAFARIMESH'] = {
			label = 'M9 Bayonet Safari mesh',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_SCORCHED'] = {
			label = 'M9 Bayonet Scorched',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_SLAUGTHER'] = {
			label = 'M9 Bayonet Slaugther',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_STAINED'] = {
			label = 'M9 Bayonet Stained',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_TIGERTOOTH'] = {
			label = 'M9 Bayonet Tiger Tooth',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_ULTRAVIOLET'] = {
			label = 'M9 Bayonet Ultra Violet',
			weight = 300,
			durability = 0.1,
		},

		['WEAPON_M9_URBANMASKED'] = {
			label = 'M9 Bayonet Urban Masked',
			weight = 300,
			durability = 0.1,
		},