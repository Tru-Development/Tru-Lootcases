# Tru-Lootcases

Free open-source FiveM lootcase resource by **Tru-Development**.

Tru-Lootcases provides animated lootcase openings with server-side reward selection, weighted loot tables, cooldowns, item removal checks, and protected reward claims.

## 🎥 Preview Video

https://www.youtube.com/watch?v=xKlzgcq4YbY

## Supported Setups

### Frameworks
- QBCore
- ESX Legacy
- Qbox/QBX 

### Inventories
- ox_inventory 
- qb-inventory 
- ESX default 

For ox_inventory servers, item use is handled by the `client.export` entry in `ox_inventory/data/items.lua`.

## Installation

1. Place the folder in your resources.

```cfg
ensure Tru-Lootcases
```

2. Install your item definitions from `install/`.

- `install/ox_inventory-items.lua`
- `install/qb-core-items.lua`
- `install/qbox-items.lua`
- `install/esx-items.sql`

3. Copy case images from:

```text
install/cases/
```

into your inventory image folder.

### ox_inventory Images

```text
ox_inventory/web/images/
```

### qb-inventory Images

```text
qb-inventory/html/images/
```

## ox_inventory Item Example

Your case item must include the client event/export:

```lua
['common_case'] = {
    label = 'Common Case',
    weight = 500,
    stack = true,
    close = true,
    client = {
        image = 'common_case.png',
        event = 'tru-lootcases:client:useCase'
    }
}
```

If nothing happens when using an ox_inventory item, the item snippet is not installed correctly or ox_inventory was not restarted after editing `data/items.lua`.


## Included Cases

- `common_case`
- `rare_case`
- `legendary_case`
- `knife_case`

## Knife Models
Included are 87 FiveM-ready addon weapons.

30× Bayonet
23× Butterfly
34× Karambit

Included inventory images for:

Every loot case
Every included knife

The included CSGO-style knife models were created by Paulo Safky.

Original project:

https://github.com/paulosafky/s_csgo_knives

Huge thanks to Paulo Safky for making these assets available to the FiveM community.

Please respect the original project and its license when using the included knife models.

License & Usage

Tru-Lootcases is released free of charge by Tru-Development for the FiveM community.

You are welcome to:

Use this resource on your server.
Modify it to fit your server's needs.
Contribute improvements through GitHub.

Please do not:

Reupload or redistribute this resource as your own.
Remove the original Tru-Development credits.
Sell this resource or include it in paid resource packs.

Thank you for respecting the work that went into this project.
