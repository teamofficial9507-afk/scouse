NPC Cash Drop System
A lightweight, configurable FiveM system that makes NPCs drop cash when killed. Designed for QB‑Core, but easily adaptable to ESX or standalone.

✅ Features
Configurable drop chance

Randomized cash amount (min/max)

Whitelist / blacklist ped models

Optional interaction key to loot

Server‑side validation to prevent abuse

Automatic cleanup of uncollected drops

Simple, clean, and framework‑friendly

📦 Installation
Place the resource in your server’s resources folder:

Code
resources/[gcore]/npc-cash-drop
Add to server.cfg

Code
ensure npc-cash-drop
Configure settings

Edit config.lua to adjust:

Drop chance

Cash range

Whitelist/blacklist

Interaction key

Cleanup timing

🗂 File Structure
Code
npc-cash-drop/
│
├── fxmanifest.lua
├── config.lua
├── client.lua
└── server.lua
Your fxmanifest.lua:

lua
fx_version 'cerulean'
game 'gta5'

author 'GameGalactic'
description 'NPC Cash Drop System'
version '1.0.0'

shared_script '@qb-core/shared/locale.lua'
shared_script 'config.lua'

server_script 'server.lua'
client_script 'client.lua'
⚙️ How It Works
1. Client detects NPC death
Ignores players

Checks whitelist/blacklist

Rolls chance

Sends coords to server

2. Server validates & spawns drop
Randomizes cash amount

Stores drop data

Notifies clients to spawn prop/marker

3. Player loots drop
Walks into radius (or presses key)

Server validates distance

Gives cash via QB‑Core

Removes drop for all players

4. Cleanup
Server removes expired drops

Clients remove props/markers
