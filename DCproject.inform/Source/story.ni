"DCproject" by Sophia Ling

Include Basic Screen Effects by Emily Short.
Include Rideable Vehicles by Graham Nelson.
Release along with an interpreter.

Part 1 - Prologue

After printing the banner text:
	[say "-----------------------------------------[line break]";
    	say "This reminds you of the summer of '69...";
    	wait for any key;
    	say "... flashback content...";
    	wait for any key.]
	now the player is in Gate to the Osireion.


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
	
Section 2 - New Definitions

A Body Part is a kind of thing.

A thing can be acquired or unacquired. A thing is usually unacquired.


Section 3 - Sun Chariot Travel

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
6	Workmen's Village
7	Gate to the Osireion
8	Thebes-Marketplace
9	Elephantine-Marketplace


The sun chariot is an enterable supporter. It is in the Gate to the Osireion.

["the location" refers to the current location of the player]
[Before going to the location:
	if there is a home of the location in the Table of Chariot-Parking:
		move the sun chariot to the location;
		say "Your sun chariot is parked at [the location], fiercely guarded by your pet serpents.".]

Every turn:
	if there is a home of the location in the Table of Chariot-Parking and the sun chariot is not in the location:
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
Thebes-Marketplace is a room in Thebes.
Elephantine-Marketplace is a room in Elephantine.


Part 3 - Intro with Osiris' Head

Head Acquisition is a scene. Head Acquisition begins when play begins. Head Acquisition ends when Osiris' head is acquired. 

Chapter 1 - Abydos-Head
[must be first body piece discovered, no going elsewhere]

Section 1 - Head capabilities

Table of Osiris' unrelated knowledge
comment
"Lucy wears a size 9 shoe."
"boop1"
"boop2"

Table of Osiris' useful knowledge
fact	summary
1	"Go to Oxyrhynchos! I have fair confidence that my.... a very important.... an important member of my body will be there. "
2	"Fishing may result in some happy results."

Check talking to head:
	if the head is dumb:
		say "'Osiris,' you demanded expectantly. [paragraph break]";
		choose random row in the Table of Osiris' unrelated knowledge;
		say "'[comment entry]' was the only response you got.";
	otherwise:
		do nothing.

Section 2 - Entering the Osireion

The Gate to the Osireion is a room in Abydos. "The doorway to the temple stands before you, an unassuming looking side door. It was sturdy and made of good material, but seems to be lightly trafficked. It was even unguarded. (please add more historical info and revise this)"

The stone door is a locked closed door. It is scenery. The stone door is south of the gate and north of the descending passage. Include (- has animate -) when defining the door.
The description of the stone door is "The heavy stone door is engraved with an ancient riddle: [line break] 'I am yesterday, veiled in shadows. [line break] I am tomorrw, cloaked in flames. [line break] A union of gods, a cycle complete.'"

Instead of answering the door that something:
	if the player's command includes "sun":
		now the stone door is unlocked;
		now the stone door is open;
		say "As you speak the word 'sun,' the massive stone door grinds open, revealing a long narrow passa";
	otherwise:
		say "Nothing happens. Perhaps that is not the correct answer.";


The Descending Passage is a room in Abydos. It is south of the stone door. "A long descending passage. Down south is a great hall. North is the gate. Easet is the first transverse chamber."

The Great Hall is a room in Abydos. It is south of the Descending Passage. "South is a small chamber. North is the long descending passage."

The Southern Chamber is a room in Abydos. It is south of the great hall. "The small chamber contains... something? North is the great hall" 

The First Transverse Chamber is a room in Abydos. It is east of the Great Hall. [on first entrance, mention the long passage way between the two as well] 

The Doorway to the Osireion is a room in Abydos. It is east of the First Transverse Chamber. "To your east you see the central hall, grand and collonaded. However, surrounding the entire central hall island is a moat, preventing you from continuing through."

The sun disk key is a thing in the Doorway.

[instead of a sun disk key, program it so medea has to find a ladder/wood plank to cross]

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

[lock his head in a box/sarcophagus and make it require a key]

Osiris' head is a body part. It is in the Tomb. Osiris' head can be taken. Understand "Osiris" as Osiris' head. Include (- has animate -) when defining Osiris' head. Osiris' head can be smart or dumb. Osiris' head is dumb.

Test Abydos with "s" in the Gate to the Osireion.


Part 4 - Talking Osiris Agenda
[this entire part must be completed in order]

Talking Osiris Agenda is a scene. Talking Osiris Agenda begins when Head Acquisition ends. Talking Osiris Agenda ends when Organ Acquisition ends. 

Chapter 2 - Amarna-Brain

Brain Acquisition is a scene. Brain Acquisition begins when Talking Osiris Agenda begins. Brain Acquisition ends when Osiris' brain is acquired.

[Discovery is a scene. Discovery begins when player is in Workmen's Village for the first time. Discovery ends when the workman is curious. ]

Discovery is a scene. Discovery begins when Brain Acquisition begins. Discovery ends when the workman is curious. 

Get Body Bag is a scene. Get Body Bag begins when Discovery ends. Get Body Bag ends when the body bag is acquired.

Exploration is a scene. Exploration begins when Get Body Bag ends. Exploration ends when Osiris' brain is acquired.

Next Instructions is a scene. Next Instructions begin when Exploration Ends. 
	
Section 2 - Workmen's village

The Workmen's Village is a room in Amarna. "A dusty cluster of homes and workshops, bustling with activity. The air smells of clay and stone."

[make Medea park her chariot outside the village, and then get into the village. could include mention of how there's only one gate to the walled village. maybe she goes through security?]

A body bag is a container. The carrying capacity of the body bag is 14. The description of the body bag is "A heavy cloth sack used for transporting... questionable things."

A workman is a person. The workman is in the Workmen's Village. The workman carries a body bag. The workman can be curious or uncurious. The workman is uncurious.

Instead of talking to the workman during Discovery:
	say "'Hey you,' you called to the workman.  [paragraph break]";
	say "The workman turns around with a disgruntled expression. 'What do you want?' he asks.  [paragraph break]";
	say "You explain that you're looking for information about the village.  [paragraph break]";
	say "The workman gestures around. 'This village,' he says, 'it's where the elite tombs nearby are prepared. Hard work, but someone's got to do it.' He looks at you curiously. 'What are you doing here, anyway? And good gods, are you pregnant?!'";
	now the workman is curious.
	
Instead of talking to the workman during Get Body Bag:
	say "The workman looks at you expectantly. 'What are you doing here, anyway? And what's up with the stomach?'"

Instead of talking to the workman at least four times during Get Body Bag:
	say "He seems to be expecting an answer from you. Maybe try showing him what's hidden under your shirt."
	
Instead of showing the head to the uncurious workman during Discovery:
	say "Flashing a decapitated head to someone you've never talked to may be a bit much. Try striking a conversation first."
		
Instead of showing the head to the curious workman:
	say "You carefully take the head from under your shirt and show it to the workman. 'Do you know anything to go along with this?' you ask.[paragraph break]";
	say "The workman eyes you warily. 'You collect heads, huh? Weird. But if you want odd heads, the old Aten cult temple's the place to check. (here, mention more about the cult) '  [paragraph break]"; 
	say "You give a curt nod of thanks. Just as you turn to leave, he calls to you. 'Hey! I don't know what your whole deal is, but here, it's good manners to keep body parts inside a body bag.' He tosses you a body bag.";
	now the workman is uncurious;
	now the player is holding the body bag;
	now the body bag is acquired.

Instead of talking to the workman during Exploration:
	say "The workman looks at you with exasperation. 'I've told you everything I know. Go to the old Aten temple for you weird heads."
	
Instead of showing the head to the uncurious workman during Exploration:
	say "I don't think showing off Osiris` head again is necessary.".
	
Section 3 - Traveling to the temple

Outside the Walled Village is a room in Amarna. It is south of Workmen's Village. "more description here"

[add a way she acquires oxcart]
The oxcart is a rideable vehicle.

When Exploration begins:
	now the oxcart is in Outside the Walled Village.

The Ruined City is a room in Amarna. It is west of Outside the Walled Village. "This glorious city, once the capital of Egypt, is nothing but ruins and foundations. In the distance, to the north, you see a small standing structure, sticking out like a sore thumb amongst the desolation."

Instead of going to the Ruined City when the player is not on the oxcart:
	if player is in Outside the Walled Village:
		say "It's a long journey to Amarna City: you'll never make it on foot.";
	otherwise:
		continue the action.

Instead of going to Outside the Walled Village when the player is not on the oxcart:
	if player is in the Ruined City:
		say "It's a long journey to the village: you'll never make it on foot.";
	otherwise:
		continue the action.

After going to the Ruined City:
	if the player is in Outside: 
		say "You sit on the oxcart and it takes you there.";
	continue the action.
	
After going to Outside the Walled Village:
	if the player is in the Ruined City:
		say "You sit on the oxcart and it takes you there.";
	continue the action.

Instead of going to the Small Aten Temple when the player is on the oxcart:
	say "You can hardly ride a cart into the temple!"

The Small Aten Temple is a room in Amarna. It is north of the Ruined City. "A partially reconstructed temple dedicated to the Aten. Sunlight streams through its ruined walls, illuminating faded murals."

[make hidden stairway down to underground temple]

Underground Chapel is a room in Amarna. It is below the Small Aten Temple. "The air is cool and still. Strange elongated statues and murals with eerily etched toes line the walls."


Section 4 - At the Small Aten Temple
	
A north mural is a thing in the Underground Chapel.

A south mural is a thing in the Underground Chapel.

A east mural is a thing in the Underground Chapel.

A west mural is a thing in the Underground Chapel.

A statue is a thing in the Underground Chapel.


[make several statues and murals so that she has to examine almost all of them. one contains a hint ]

Instead of examining a mural in the Underground Chapel:
	say "You lean in close to inspect the strange paintings. One mural depicts an elongated figure with exaggerated features holding a glowing orb near their head. A sense of revelation washes over you."

Osiris' brain is a body part in the Underground Chapel. The description of the brain is "An unnervingly lifelike, pulsating organ."

Section 5 - Back to the village



test Amarna with "say hi / get on chariot / 6" holding the head.

Chapter 3 - Thebes-Heart

Heart Acquisition is a scene. Heart Acquisition begins when Brain Acquisition ends. Heart Acquisition ends when Osiris' heart is acquired.

Osiris' heart is a body part. 


Chapter 4 - Busiris-Organs

Organ Acquisition is a scene. Organ Acquisition begins when Heart Acquisition ends. Organ Acquisition ends when Osiris' liver is acquired.

Osiris' liver is a body part. It is in Busiris-Marketplace


Part 5 - Complete Any Time
[can be completed any time after acquiring the head]

Hand Acquisition is a scene. Hand Acquisition begins when Head Acquisition ends. Hand Acquisition ends when Osiris' left hand is acquired and Osiris' right hand is acquired.

Chapter 5 - Avaris-Hands

Osiris' left hand is a body part. It is in Avaris-Marketplace.

Osiris' right hand is a body part. It is in Avaris-Marketplace.


Part 6 - Tour Guide Osiris
[this part can be completed out of order, although some chapters require objects from other chapters to be compelted]

Tour Guide Osiris is a scene. Tour Guide Osiris begins when Talking Osiris Agenda ends. [doesn't really end]

Chapter 6 - Oxyrhynchos

Penis Acquisition is a scene. Penis Acquisition begins when Tour Guide Osiris ends. Penis Acquisition ends when Osiris' penis is acquired.

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
	
Instead of cutting a body part:
	say "You'll hardly win any favors by cutting Osiris into even more pieces.".

Section 2 - Marketplace

Oxyrhynchos-Marketplace is a room in Oxyrhynchos. "You are in Oxyrhynchos, home of the medjed elephantfish. A little further east is the riverbank of the Nile."

[include description of market place and items here.]

[include meeting a couple with a pregnant woman nearing birth time. she is looking for a good luck pendant, but they are too poor to afford it.]

Some bait is an edible thing in Oxyrhynchos-Marketplace.

Instead of eating the bait:
	say "Edible, sure, but you're no fish.".

A fishing rod is in Oxyrhynchos-Marketplace. The fishing rod can be baited or unbaited. It is unbaited. The printed name of the fishing rod is "fishing rod[if fishing rod is baited] with bait". The description is "[if fishing rod is unbaited] A sturdy fishing rod, but it could use some bait.[end if] [if fishing rod is baited] The fishing pole is now baited with some fish food."

A knife is a blade in Oxyrhynchos-Marketplace. 

Section 3 - Tawaret conflict

The Nile Riverbank is in Oxyrhynchos. It is east of Oxyrhynchos-Marketplace. "You are at the bank of the Nile. (like kind of, it's a natural offshoot, now called the yussuf bahr canal or something)"

[add lots of dialogue and the whole conflict relating to tawaret]

Section 4 - Fishing game

Fish are a kind of container. Fish are edible. A catfish is a fish. Fish can be found in the Nile Riverbank.

The catfish is a closed container in the nile riverbank. The description of the catfish is "[if player is not carrying catfish] It's a catfish... I wonder if that has any significance? [end if] [if player is carrying closed catfish] You eye the catfish with great suspicion. It looks back at you and reveals nothing. Maybe its silence can be resolved by a good gutting."

Osiris' penis is a body part in the catfish. Understand "penis/phallus" as Osiris' penis.

Instead of taking Osiris' penis:
	continue the action;
	now Osiris' penis is acquired.

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
		
[maybe change format of the fishing game? instead of missing and rethrowing, let her fish up trash? or someting else]
		
Carry out fishing:
	if a random chance of 1 in 5 succeeds:
		move the catfish to the player;
		say “You have caught the catfish!”;		
		now the fishing rod is unbaited;
	otherwise:
		say “And pulled up nothing.”;

Test fish with "take all / bait rod / e / fish" in Oxyrhynchos-Marketplace.
			
Chapter 7 - Elephantine-Torso

Osiris' Torso is a body part in Elephantine-Marketplace.

Chapter 8 - Memphis-Spine

Osiris' Spine is a body part in Memphis-Marketplace.

Chapter 9 - Heliopolis-Limbs

Osiris' right arm is a body part in Heliopolis-Marketplace. "His right arm, missing its hand."

Osiris' left arm is a body part in Heliopolis-Marketplace. "His left arm, missing its hand."

Osiris' right leg is a body part in Heliopolis-Marketplace.

Osiris' left leg is a body part in Heliopolis-Marketplace.


Part 7 - Epilogue






