Config = {}

-- Framework: 'auto', 'qb', 'qbox', 'esx', or 'standalone'
Config.Framework = 'auto'

-- Inventory: 'auto', 'ox', 'qb', 'esx', or 'standalone'
-- Leave this on auto for most servers.
Config.Inventory = 'auto'
Config.Debug = false

Config.Command = 'lootcase' -- test command: /lootcase common_case
Config.AllowCommandTesting = false

-- UI branding/theme
-- Set enabled = false or title = '' to hide the server name from the spinning UI.
Config.Branding = {
  enabled = true,
  title = 'CHANGEME', -- Replace with your server name
  color = '#8ccc3f'
}

-- Change these colors if you want a different UI scheme.
-- Rarity glows default to common white, rare blue, epic purple, legendary gold.
Config.Theme = {
  accent = '#8ccc3f',
  panel = '#050505', -- main spinning UI panel background
  common = '#ffffff',
  rare = '#009dff',
  epic = '#a855f7',
  legendary = '#ffbf00'
}

Config.Cases = {
  common_case = {
    label = 'Common Case',
    image = 'common_case.png',
    color = '#ffffff',
    duration = 6500,
    rewards = {
      { item = 'beer', label = 'Beer', amount = 1, chance = 35, rarity = 'common' },
      { item = 'sandwich', label = 'Sandwich', amount = 1, chance = 30, rarity = 'common' },
      { item = 'lockpick', label = 'Lockpick', amount = 1, chance = 20, rarity = 'common' },
      { item = 'bandage', label = 'Bandage', amount = 2, chance = 10, rarity = 'common' },
      { item = 'cash', label = '$500 Cash', amount = 500, chance = 5, rarity = 'rare', money = true }
    }
  },
  knife_case = {
    label = 'Knife Case',
    image = 'knife_case.png',
    color = '#da2121',
    duration = 6500,
   rewards = {
        -- BUTTERFLY
        { item = 'WEAPON_BF_BLUESTEEL', label = 'Butterfly Blue Steel', amount = 1, chance = 8, rarity = 'rare' },
        { item = 'WEAPON_BF_BOREALFOREST', label = 'Butterfly Boreal Forest', amount = 1, chance = 8, rarity = 'rare' },
        { item = 'WEAPON_BF_CASEHARDENED', label = 'Butterfly Case Hardened', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_BF_CRIMSONWEB', label = 'Butterfly Crimson Web', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_BF_DAMASCUSSTEEL', label = 'Butterfly Damascus Steel', amount = 1, chance = 5, rarity = 'rare' },
        { item = 'WEAPON_BF_DOPPLERBLACKPEARL', label = 'Butterfly Doppler Black Pearl', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_BF_DOPPLERPHASE1', label = 'Butterfly Doppler Phase 1', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_BF_DOPPLERPHASE2', label = 'Butterfly Doppler Phase 2', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_BF_DOPPLERPHASE3', label = 'Butterfly Doppler Phase 3', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_BF_DOPPLERPHASE4', label = 'Butterfly Doppler Phase 4', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_BF_DOPPLERRUBY', label = 'Butterfly Doppler Ruby', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_BF_DOPPLERSAPPHIRE', label = 'Butterfly Doppler Sapphire', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_BF_FADE', label = 'Butterfly Fade', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_BF_FOREST', label = 'Butterfly Forest', amount = 1, chance = 8, rarity = 'rare' },
        { item = 'WEAPON_BF_NIGHT', label = 'Butterfly Night', amount = 1, chance = 6, rarity = 'rare' },
        { item = 'WEAPON_BF_RUSTCOAT', label = 'Butterfly Rust Coat', amount = 1, chance = 7, rarity = 'rare' },
        { item = 'WEAPON_BF_SAFARIMESH', label = 'Butterfly Safari Mesh', amount = 1, chance = 10, rarity = 'common' },
        { item = 'WEAPON_BF_SCORCHED', label = 'Butterfly Scorched', amount = 1, chance = 9, rarity = 'common' },
        { item = 'WEAPON_BF_SLAUGTHER', label = 'Butterfly Slaugther', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_BF_STAINED', label = 'Butterfly Stained', amount = 1, chance = 7, rarity = 'rare' },
        { item = 'WEAPON_BF_TIGERTOOTH', label = 'Butterfly Tiger Tooth', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_BF_ULTRAVIOLET', label = 'Butterfly Ultra Violet', amount = 1, chance = 5, rarity = 'rare' },
        { item = 'WEAPON_BF_URBANMASKED', label = 'Butterfly Urban Masked', amount = 1, chance = 8, rarity = 'rare' },

        -- KARAMBIT
        { item = 'WEAPON_KARAMBIT_AUTOTRONIC', label = 'Karambit Autotronic', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_BLACKLAMINATE', label = 'Karambit Black Laminate', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_BLUESTEEL', label = 'Karambit Blue Steel', amount = 1, chance = 5, rarity = 'rare' },
        { item = 'WEAPON_KARAMBIT_BOREALFOREST', label = 'Karambit Boreal Forest', amount = 1, chance = 8, rarity = 'rare' },
        { item = 'WEAPON_KARAMBIT_BRIGHTWATER', label = 'Karambit Bright Water', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_CASEHARDENED', label = 'Karambit Case Hardened', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_CRIMSONWEB', label = 'Karambit Crimson Web', amount = 1, chance = 2, rarity = 'legendary' },
        { item = 'WEAPON_KARAMBIT_DAMASCUSSTEEL', label = 'Karambit Damascus Steel', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_BLACKPEARL', label = 'Karambit Doppler BlackPearl', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_KARAMBIT_DOPPLERPHASE1', label = 'Karambit Doppler Phase 1', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_DOPPLERPHASE2', label = 'Karambit Doppler Phase 2', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_DOPPLERPHASE3', label = 'Karambit Doppler Phase 3', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_DOPPLERPHASE4', label = 'Karambit Doppler Phase 4', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_DOPPLERRUBY', label = 'Karambit Doppler Ruby', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_KARAMBIT_DOPPLERSAPPHIRE', label = 'Karambit Doppler Sapphire', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_KARAMBIT_FADE', label = 'Karambit Fade', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_FOREST', label = 'Karambit Forest', amount = 1, chance = 8, rarity = 'rare' },
        { item = 'WEAPON_KARAMBIT_FREEHAND', label = 'Karambit Free Hand', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_GDEMERALD', label = 'Karambit Gamma Doppler Emerald', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_KARAMBIT_GDP1', label = 'Karambit Gamma Doppler Phase 1', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_GDP2', label = 'Karambit Gamma Doppler Phase 2', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_GDP3', label = 'Karambit Gamma Doppler Phase 3', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_GDP4', label = 'Karambit Gamma Doppler Phase 4', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_KARAMBIT_LORE', label = 'Karambit Lore', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_KARAMBIT_MARBLEFADE', label = 'Karambit Marble Fade', amount = 1, chance = 2, rarity = 'epic' },

        -- M9 BAYONET
        { item = 'WEAPON_M9_AUTOTRONIC', label = 'M9 Bayonet Autotronic', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_M9_BLACKLAMINATE', label = 'M9 Bayonet Black Laminate', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_M9_BLUESTEEL', label = 'M9 Bayonet Blue Steel', amount = 1, chance = 5, rarity = 'rare' },
        { item = 'WEAPON_M9_BRIGHTWATER', label = 'M9 Bayonet Bright Water', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_M9_CASEHARDENED', label = 'M9 Bayonet Case Hardened', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_M9_CRIMSONWEB', label = 'M9 Bayonet Crimson Web', amount = 1, chance = 2, rarity = 'legendary' },
        { item = 'WEAPON_M9_DAMASCUSSTEEL', label = 'M9 Bayonet Damascus Steel', amount = 1, chance = 4, rarity = 'epic' },
        { item = 'WEAPON_M9_DOPPLERBLACKPEARL', label = 'M9 Bayonet Doppler Black Pearl', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_M9_DOPPLERP1', label = 'M9 Bayonet Doppler Phase 1', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_DOPPLERP2', label = 'M9 Bayonet Doppler Phase 2', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_DOPPLERP3', label = 'M9 Bayonet Doppler Phase 3', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_DOPPLERP4', label = 'M9 Bayonet Doppler Phase 4', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_DOPPLERRUBY', label = 'M9 Bayonet Doppler Rubby', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_M9_DOPPLERSAPPHIRE', label = 'M9 Bayonet Doppler Sapphire', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_M9_GDEMERALD', label = 'M9 Bayonet Emerald', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_M9_FADE', label = 'M9 Bayonet Fade', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_FREEHAND', label = 'M9 Bayonet Free Hand', amount = 1, chance = 3, rarity = 'epic' },
        { item = 'WEAPON_M9_GDP1', label = 'M9 Bayonet Gamma Doppler Phase 1', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_GDP2', label = 'M9 Bayonet Gamma Doppler Phase 2', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_GDP3', label = 'M9 Bayonet Gamma Doppler Phase 3', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_GDP4', label = 'M9 Bayonet Gamma Doppler Phase 4', amount = 1, chance = 2, rarity = 'epic' },
        { item = 'WEAPON_M9_LORE', label = 'M9 Bayonet Lore', amount = 1, chance = 1, rarity = 'legendary' },
        { item = 'WEAPON_M9_MARBLEFADE', label = 'M9 Bayonet Marble Fade', amount = 1, chance = 2, rarity = 'epic' }
    }
},

  rare_case = {
    label = 'Rare Case',
    image = 'rare_case.png',
    color = '#009dff',
    duration = 7000,
    rewards = {
      { item = 'lockpick', label = 'Lockpick', amount = 2, chance = 30, rarity = 'common' },
      { item = 'armor', label = 'Armor', amount = 1, chance = 25, rarity = 'rare' },
      { item = 'repairkit', label = 'Repair Kit', amount = 1, chance = 20, rarity = 'rare' },
      { item = 'cash', label = '$2,500 Cash', amount = 2500, chance = 15, rarity = 'rare', money = true },
      { item = 'weapon_pistol', label = 'Pistol', amount = 1, chance = 10, rarity = 'rare' }
    }
  },

  legendary_case = {
    label = 'Legendary Case',
    image = 'legendary_case.png',
    color = '#ffbf00',
    duration = 7600,
    rewards = {
      { item = 'armor', label = 'Armor', amount = 2, chance = 25, rarity = 'rare' },
      { item = 'weapon_pistol', label = 'Pistol', amount = 1, chance = 25, rarity = 'rare' },
      { item = 'weapon_smg', label = 'SMG', amount = 1, chance = 15, rarity = 'legendary' },
      { item = 'cash', label = '$10,000 Cash', amount = 10000, chance = 25, rarity = 'legendary', money = true },
      { item = 'weapon_carbinerifle', label = 'Carbine Rifle', amount = 1, chance = 10, rarity = 'legendary' }
    }
  }
}
