"DCproject" by Sophia Ling

Include Basic Screen Effects by Emily Short.
Release along with an interpreter.

Part 1 - Prologue

[After printing the banner text:
	say "-----------------------------------------[line break]";
    	say "This reminds you of the summer of '69...";
    	wait for any key;
    	say "... flashback content...";
    	wait for any key.]


Part 2 - General Game Declarations

When play begins:
    	now the right hand status line is "[map region of the location]".

The carrying capacity of the player is 5.

Section 1 - New Actions

Talking to is an action applying to one visible thing. Understand "talk to [someone]" or "talk to [something]" or “converse with [someone]” or "converse with [something]" as talking to.

Carry out talking to someone:
	say "There is no reply."

Chanting is an action applying to nothing.
Understand "saying some spell rn" as chanting.
Instead of chanting:
	say "oh yeah get it".


Section 2 - Sun Chariot Travel

Figure of chariot is the file "chariot.png".

Understand "[number]" as selecting when player is on the sun chariot.

Selecting is an action applying to one number.

Check selecting: [assuming we don't want to be able to transport from just anywhere]
	if the player is not on the sun chariot:
		say "You can get there only with the sun chariot";
		do nothing instead.

Check selecting:
	if the number understood is greater than the number of filled rows in the Table of Transport Options or the number understood is less than one:
		say "[The number understood] is not a valid option. ";
		list the transport options instead.

Carry out selecting:
	let N be the number understood; [not actually a necessary step, but it makes the next line easier to understand]
	choose row N in the Table of Chariot-Parking;
	if the home entry is a room:
		clear the screen;
		[display the Figure of chariot;
		wait for any key;
		clear the screen;]
		move the player to the home entry;
	otherwise:
		say "*** BUG: Improperly filled table of transport options ***"

To list the transport options:
	let N be 1;
	say "From here you could choose to go to: [line break]";
	repeat through the Table of Transport Options:
		say "  [N]: [transport entry][line break]";
		increment N.

Table of Transport Options
id	transport (a region)
1	Avaris
2	Busiris
3	Heliopolis
4	Memphis
5	Oxyrhynchos
6	Amarna
7	Abydos
8	Thebes
9	Elephantine

Avaris, Busiris, Heliopolis, Memphis, Oxyrhynchos, Amarna, Abydos, Thebes, and Elephantine are regions. 

Table of Chariot-Parking
id	home (a room)
1	Avaris-Marketplace
2	Busiris-Marketplace
3	Heliopolis-Marketplace
4	Memphis-Marketplace
5	Oxyrhynchos-Marketplace
6	Amarna-Marketplace
7	Abydos-Marketplace
8	Thebes-Marketplace
9	Elephantine-Marketplace


The sun chariot is an enterable supporter. 

["the location" refers to the current location of the player]
[Before going to the location:
	if there is a home of the location in the Table of Chariot-Parking:
		move the sun chariot to the location;
		say "Your sun chariot is parked at [the location], fiercely guarded by your pet serpents.".]

Every turn:
	if there is a home of the location in the Table of Chariot-Parking:
		move the sun chariot to the location;
		say "Your sun chariot is parked at [the location], fiercely guarded by your pet serpents.".

After entering the sun chariot:
	say "As you step onto the chariot, the serpents in front hiss joyfully, happy to see you again. [run paragraph on]";
	list the transport options.

[temp room declarations]
Avaris-Marketplace is a room in Avaris.
Busiris-Marketplace is a room in Busiris.
Heliopolis-Marketplace is a room in Heliopolis.
Memphis-Marketplace is a room in Memphis.
Oxyrhynchos-Marketplace is a room in Oxyrhynchos.
Amarna-Marketplace is a room in Amarna.
Abydos-Marketplace is a room in Abydos.
Thebes-Marketplace is a room in Thebes.
Elephantine-Marketplace is a room in Elephantine.


Part 3 - Intro with Osiris' Head

Chapter 1 - Abydos-Head
[first body piece discovered]

Section 1 - Head capabilities

Table of Osiris' unrelated knowledge
comment
"Lucy wears a size 9 shoe."
"Sunset is at 8:22 PM this evening."
"boop1"
"boop2"

Table of Osiris' useful knowledge
fact	summary
1	"Sunset is at 8:22 PM this evening."

Check talking to head:
	if the head is dumb:
		say "'Osiris,' you demanded expectantly. [paragraph break]";
		choose random row in the Table of Osiris' unrelated knowledge;
		say "'[comment entry]' was the only response you got.";
	otherwise:
		do nothing.

Section 2 - Entering the Oseiron

The Gate to the Oseiron is a room in Abydos. It is south of Abydos-Marketplace.

The Descending Passage is a room in Abydos. It is south of the gate to the Oseiron. "A long descending passage. Down south is a great hall. North is the gate."

The Great Hall is a room in Abydos. It is south of the descending passage. "South is a small chamber. North is the long descending passage."

The Southern Chamber is a room in Abydos. It is south of the great hall. "The small chamber contains... something? North is the great hall" 

The First Transverse Chamber is a room in Abydos. It is east of the Great Hall. [on first entrance, mention the long passage way between the two as well] 

The Doorway to the Oseiron is a room in Abydos. It is east of the First Transverse Chamber. "To your east you see the central hall, grand and collonaded. However, surrounding the entire central hall island is a moat, preventing you from continuing through."

The sun disk key is a thing in the Doorway.

Instead of going to the Central Nave:
	 if the player does not have the sun disk key:
    		say "You approach the edge of the moat, but there is no way across. The waters churn ominously, as if warning you to stay back.";
	otherwise: 
    		say "The golden sun disk in your possession begins to glow brightly, and a radiant bridge of light forms across the dark waters. With the way now open, you step forward.";
    		continue the action.

The Central Nave is a room in Abydos. It is east of the Doorway. "You stand in the middle of the columns lining the central nave and look around. Surrounding you are 17 small cells. Most of them are shrouded in darkness and you could barely see inside, but one directly east of you seems to lead out to a bigger chamber. The doorway back to the first transverse chamber is to your west."

Before going when the location is the Central Nave:
	if the noun is east or the noun is west:
		continue the action;
	otherwise:
		say "With the moat surrounding the central nave, it's a struggle to go anywhere." instead.

The Tomb of Osiris is a room in Abydos. It is east of the Central Nave. 

Osiris' head is a thing. It is in the Tomb. Osiris' head can be taken. Understand "Osiris" as Osiris' head. Include (- has animate -) when defining Osiris' head. Osiris' head can be smart or dumb. Osiris' head is dumb.



[The stone door is a closed locked door. It is east of the Entrance Tunnel. "The stone door is adorned with a riddle carved into its surface. The symbols of the sun and light are prominent."]

Test Abydos with "s / s / e / e " in the Gate to the Oseiron.


Part 4 - Talking Osiris Agenda
[this entire part must be completed in order]

Chapter 2 - Amarna-Brain

Chapter 3 - Thebes-Heart

Chapter 4 - Busiris-Organs

Part 5 - Complete Any Time
[can be completed any time after acquiring the head]

Chapter 5 - Avaris-Hand

Part 6 - Tour Guide Osiris
[this part can be completed our of order, although some chapters require objects from other chapters to be compelted]

Chapter 6 - Oxyrhynchos

Section 1 - Cutting as an action

A blade is a kind of thing.
		
Cutting it with is an action applying to two carried things. Understand "cut [something] with [something preferably held]" as cutting it with. Understand "gut [something] with [something preferably held]" as cutting it with. 

Check cutting something with something:
	if a blade is not carried:
		say "You can hardly cut open the fish without a proper tool.";
	if the noun is a blade, say "You can't do that." instead;
	if we have cut the noun:
		say "The fish hardly deserves to be gutted twice."

Instead of cutting something:
	if a blade (called the edge) is held by the player,
		try cutting the noun with the edge;
	otherwise say "Your fingernails are not sharp enough."

Check cutting it with:
	if the noun is a person, say "That would hurt." instead;
	if the second noun is not a blade, say "[The second noun] has not got enough of a blade." instead.

Carry out cutting it with:
	increment the count of rips of the noun.

Report cutting it with:
	say "You slash [the noun] with [the second noun]."

[We'll need a way to account for all these cuts and rips.]

Definition: a thing is ripped if the count of rips of it > 0.  A thing has a number called the count of rips. After examining something ripped, say "You see [the count of rips of the noun in words] rip[s] in [the noun][if something is in the noun], revealing [a list of things in the noun][end if]."

The examine containers rule does nothing when examining the catfish.

Carry out cutting a container with something:	
	now the noun is open;
	now the noun is unopenable.

[Now our rule will occur whenever a container is cut, but play will still go on to the reporting stage. And indeed we can add more of these, of varying degrees of specificity:]

Carry out cutting something which is part of something with something:
	move the noun to the player.

[For that matter, we might want to add a report rule as well, to occur after the "You slash..." rule, so that every time the player cuts something open which has contents, the contents will be listed.]

Report cutting it with:
	if the noun is open and the noun contains something,
		say "Visible within [is-are a list of things in the noun]."

[Here is a final nicety to get rid of the "which is closed" statement on our closed unopenable container, using an "activity" rule:]
After printing the name of a closed unopenable container:
	omit contents in listing.
	

Section 2 - Marketplace

Oxyrhynchos-Marketplace is a room in Oxyrhynchos. "You are in Oxyrhynchos, home of the medjed elephantfish. A little further east is the riverbank of the Nile."

Some bait is an edible thing in Oxyrhynchos-Marketplace.

Instead of eating the bait:
	say "Edible, sure, but you're no fish.".

A fishing rod is in Oxyrhynchos-Marketplace. The fishing rod can be baited or unbaited. It is unbaited. The printed name of the fishing rod is "fishing rod[if fishing rod is baited] with bait". The description is "[if fishing rod is unbaited] A sturdy fishing rod, but it could use some bait.[end if] [if fishing rod is baited] The fishing pole is now baited with some fish food."

A knife is a blade in Oxyrhynchos-Marketplace. 

Section 3 - Tawaret conflict

The Nile Riverbank is in Oxyrhynchos. It is east of Oxyrhynchos-Marketplace. "You are at the bank of the Nile."

Section 4 - Fishing game

Fish are a kind of container. Fish are edible. A catfish is a fish. Fish can be found in the Nile Riverbank.

The catfish is a closed container in the nile riverbank. The description of the catfish is "[if player is not carrying catfish] It's a catfish... I wonder if that has any significance? [end if] [if player is carrying closed catfish] You eye the catfish with great suspicion. It looks back at you and reveals nothing. Maybe its silence can be resolved by a good gutting."

Osiris' penis is a thing in the catfish. Understand "penis/phallus" as Osiris' penis.

Instead of taking the catfish:
	say "The catfish is swimming freely in the Nile. Maybe you could try fishing for it."

Instead of eating the catfish:
	say "You look at it with immense distrust. It just looks so awfully... fishy... Better not.".
	
Baiting is an action applying to one carried thing. Understand "bait [something]" as baiting.

Before baiting something:
	if the player is not carrying the noun, say "You don't have that." instead;
	if the noun is not the fishing rod, say "You can't bait that." instead.

Carry out baiting:
	if the fishing rod is unbaited:
		if the player is carrying bait:
			say "You attach the bait carefully to the fishing rod." ;
			now the bait is nowhere;
			now the fishing rod is baited;
		otherwise:
			say "You don't have anything to bait it with.";
	otherwise:
		say "More is not always better."
			
Understand "fish" as fishing. Fishing is an action applying to nothing. 

Before fishing:
	if the fishing rod is not carried:
		 say "You've got nothing to fish with. Your hands won't suffice, unfortunately." instead;
	otherwise if the fishing rod is unbaited:
		say "You won't catch much without bait on the hook."  instead;
	otherwise if player is not in Nile Riverbank:
		say "This is not a viable place to be fishing." instead;
	otherwise if player is carrying the catfish:
		say "You already have a fish in your posession. Don't be so greedy." instead;
	otherwise:
		say "You cast your fishing rod out with a strong throw..."
		
Carry out fishing:
	if a random chance of 1 in 5 succeeds:
		move the catfish to the player;
		say “You have caught the catfish!”;		
		now the fishing rod is unbaited;
	otherwise:
		say “You missed the fish!”;

[testing just the fishing section!]
Test fish with "take all / bait rod / e / fish" in Oxyrhynchos-Marketplace.
			
Chapter 7 - Elephantine-Torso

Chapter 8 - Memphis-Spine

Chapter 9 - Heliopolis-Limbs

Part 7 - Epilogue






