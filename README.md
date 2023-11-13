# Godot 2D Turn-Based Strategy
Remaking of 2D Fire Emblem games in Godot.
I am using this project to implement mechanics present in other games,
such as class changing, dismounting, skills, and combat arts

## Current Fork

Found this project and decided to fork it due to moving over to Godot.
I plan on adding in additional features present in newer games.
While I do not intend on updating the main repository per se,
I am not opposed to doing so should the original programmers desire.

### Changes from GBA FE games
* TODO Fill in later

### Goals
1. Code cleanup, potential refactoring
	* Add a class representing Victory and Defeat conditions (see other notes below)
	* Extract reused code, functions, and classes
2. Create Resources databases to allow more ease-of-use in the future
	* Class database
	* Item database
	* Unit database
	* Weapon ranks
3. Class promotion/changing
	* Modularize character sprite creations, specifically palettes.
4. Mounting/Dismounting
	* Add Mounts and Mount Types to database
5. Update UI to match GBA UI
6. Skills
	* Passive Skills (A/B/C Skills)
	* Active Skills (Combat Arts/Spells)
7. In-Engine level/map editor
8. World Map Cleanup
	* Skirmishes
	* Unlockable Secret Shops or Traveling Merchants
11. Postgame/Creature Campaign Expansion
	* PCG Dungeons

### Completed
* Implemented a Linked List to use for Priority Queues

### Known Bugs
1. ~~Game crash when trying to move player units~~ - Fixed!
2. Darkened blue tiles stay on screen

### Other Notes
* Battlefield_Container seems to be a superclass of each chapter
* Level doesn't seem to do much, but there are individual level scripts that load data from Tiled
* Each of these could be a superclass extracted from the individual scripts

# Original Repo Information

## Fire Emblem GoDot 

This is a clone of the GameBoy Advance Fire Emblem games written for Godot.
This is purely for educational purposes to learn how to code using A* algorithms, building UIs and creating simple artificial intelligence.


### Installation
Download/pull the code locally and scan the project using GoDot. Simply hit run after

### How you can help
Take a look at any of the bugs below or anything in the to do list. If you wish to collaborate, send me a message.

### To do list
1. ~~Finish movement algorithm optimized algorithm~~
2. Implement enemies -> Aggresive and Passive AI working with ranged attacks as well, Tweek unit selection slightly and add in healers, patrol guards and random (for monsters)
3. ~~Implement statistics -> Complete~~
4. ~~Implement UI -> Halfway done, placement bugs fixed~~
5. Optimize/clean up code -> Started, UI screens could be reparented with OOP
6. ~~Combat Scripts -> Damage formulas written -> 90% done, test magic out last~~
7. ~~Level transitions -> Shaders built, just need to implement |  Completed with world map and chapter in betweens~~
8. ~~Unit UI stats screen~~ Done, just need it to be nicer but this can be polished
9. ~~Inventory -> Started, add swaping of position, Need to add enabling of weapons allowed~~
10. ~~Trade function Completed, all units can trade with each other~~
11. ~~Convoy Function~~ -> Complete
12. ~~Dialogue System -> 90% done, need some tweeks, would like to parse  ~~ -> All done
13. ~~Level up and stats system~~
14. Items database -> Items template built, added more weapons, added magic and ranged weapons, added bows doing triple damage to flyers.
15. End turn menu -> Menu built, end turn option added, rest needs to be build up Update -> added status screen
16. ~~Save/Load function~~ -> Complete Add to save/load as needed
17. ~~Action Select Function -> Menu built, options need to be built, wait has been added, Added trade and heal~~ All done
18. ~~Add Game over and Intro Screen -> Complete and tested. Just add options and loading to this next~~

### Bugs to fix
1. ~~Trade screen -> When you are the last unit and you trade, the next phase starts due to the turn manager constantly checking every frame. This will need to be changed.~~ Fixed this by adding extra state for units
2. ~~Level up screen -> When a unit level ups, if the enemy/ally is not dead and still alive, it has more prority on the z index over the screen overlay. We will need to hide the units when this is the case.~~ Fixed by increasing Z-Index
3. ~~Bad sorting function? -> I keep getting this error and I'm not sure why. Check in with the custom sort function on the Priority queue~~ Updated Godot from 3.1.1 to 3.1.2 fixed this issue
4. ~~Node already idle process? -> This error pops up once in a while and doesn't do anything but I've noticed that some units will have their animation speed way too fast or some animations just won't start on the UI when this shows up. Not 100% sure why this is hapenning but not a mission critical bug to be honest.~~ Updated Godot from 3.1.1 to 3.1.2 fixed this issue
5. UI Bugs -> A few things are misaligned and other polish can be done.
6. Memory Leak -> Need to check if the game is running away with ram. None so far with the editor but I feel like cleanup on exit could be done better.

### Live Demo
https://godot-tbs-fe.herokuapp.com/
This is out of date but will be updated once I have some progress done.

### Screenshots

AI
![AI](https://raw.githubusercontent.com/ja-brouil/TBS_GoDot/master/Screenshots/AI.png)

Combat
![Combat Screen](https://raw.githubusercontent.com/ja-brouil/TBS_GoDot/master/Screenshots/Combat.png)

Movement
![Movement](https://raw.githubusercontent.com/ja-brouil/TBS_GoDot/master/Screenshots/Movement.png)

Party Members and UI
![UI and Party Members](https://raw.githubusercontent.com/ja-brouil/TBS_GoDot/master/Screenshots/Party%20Members.png)

Trade Screen
![Trade Screen](https://raw.githubusercontent.com/ja-brouil/TBS_GoDot/master/Screenshots/Trade.png)
