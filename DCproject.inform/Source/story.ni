"That Time I Got Out of Jail by Reassembling Osiris" by Sophia Ling and Ruya Tazebay 

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

[This prevents the player from using the TAKE ALL command]
Rule for deciding whether all includes a thing:
	it does not.

[This changes the default message “There are none at all available!”]
Rule for printing a parser error when the latest parser error is the nothing to do error:
	say “Now, now, don’t be greedy.”

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

Instead of dropping a body part:
	say "You'll need that."

A thing can be acquired or unacquired. A thing is usually unacquired.

A thing can be examined or unexamined. A thing is usually unexamined.

Instead of examining something:
	continue the action;
	now the noun is examined.


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
	choose row N in the Table of Transport Options;
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
transport (a region)	home (a room)
Avaris	Avaris-Marketplace
Heliopolis	Heliopolis-Marketplace
Memphis	Memphis-Marketplace
Oxyrhynchos	Oxyrhynchos-Marketplace
Amarna	Outside the Walled Village
Abydos	Gate to the Osireion
Thebes	Temple of Tawosret 
Elephantine	Elephantine-Marketplace
[Busiris	Busiris-Marketplace]

Avaris, Busiris, Heliopolis, Memphis, Oxyrhynchos, Amarna, Abydos, Thebes, and Elephantine are regions. 


The sun chariot is an enterable supporter. It is in the Gate to the Osireion.

["the location" refers to the current location of the player]
Every turn:
	if there is a home of the location in the Table of Transport Options and the sun chariot is not in the location:
		move the sun chariot to the location;
		say "Your sun chariot is parked at [the location], fiercely guarded by your pet serpents.".

After entering the sun chariot:
	say "As you step onto the chariot, the serpents in front hiss joyfully, happy to see you again. [run paragraph on]";
	list the transport options.

[temp room declarations]
Avaris-Marketplace is a room in Avaris.
Heliopolis-Marketplace is a room in Heliopolis.
Memphis-Marketplace is a room in Memphis.
Elephantine-Marketplace is a room in Elephantine.


Part 3 - Intro with Osiris' Head

Head Acquisition is a scene. Head Acquisition begins when play begins. Head Acquisition ends when Osiris' head is acquired. 

Chapter 1 - Abydos-Head
[must be first body piece discovered, no going elsewhere]

Section 1 - Head capabilities

Table of Osiris' unrelated knowledge
comment
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
The description of the stone door is "The heavy stone door is engraved with an ancient riddle: [line break] 'I am yesterday, veiled in shadows. [line break] I am tomorrow, cloaked in flames. [line break] A union of gods, a cycle complete. [line break]  [line break] Using your genius intellect, you carefully contemplate the riddle. The door seems to be awaiting your ANSWER.'"

Instead of answering the door that something:
	if the player's command includes "sun":
		now the stone door is unlocked;
		now the stone door is open;
		say "As you speak the word 'sun,' the massive stone door grinds open, revealing a long narrow passage.";
	otherwise:
		say "Nothing happens. Perhaps that is not the correct answer. You look up into the sky, hoping for some god to give you a hint.";


The Descending Passage is a room in Abydos. It is south of the stone door. "A long descending passage. Down south is a great hall. North is the gate."

The Great Hall is a room in Abydos. It is south of the Descending Passage. "South is a small chamber. North is the long descending passage. East is the first transverse chamber."

The South Chamber is a room in Abydos. It is south of the great hall. "The small chamber contains... something? North is the great hall. Mention the things in the room in this description of the room. player can examine for more details." 

The sandstone walls are scenery in the South Chamber. The description of the sandstone walls is "Parts of the Book of the Dead is inscribed across these walls."

The faience ankh is in the South Chamber. The description of the small ankh is "A delicate yet sturdy ankh, the symbol of life, carved from faience. " 

A bundle of dried thyme is in the South Chamber. The description of the dried herbs is "A bundle of dried thyme is tied together with simple strands of twine. It was so old and decrepit you could barely smell it."

An ostracon is in the South Chamber. The description of the ostracon is "A shard of pottery is stained with hastily written hieratic."

Some pottery jars are in the South Chamber. The description of the pottery jars is " Several small jars of varying shapes and sizes rest against the wall. Their surfaces are worn, with traces of paint suggesting they once bore vibrant designs. Among them, you see a broken jar with unguents and another fallen to the floor, with dried red stains around the rim."

A wooden plank is in the South Chamber. The description of the wooden plank is "A short, splintered plank of cedar wood lies on the floor."

Some knick-knacks are in the South Chamber. The description of the knick-knacks is "You sift through the assorted items: a bead that may have been part of a necklace, a sliver of ivory perhaps used as a tool, and a draining liquid clepsydra (water clock)."

The First Transverse Chamber is a room in Abydos. It is east of the Great Hall. "To your east you see the central hall, grand and collonaded. However, surrounding the entire central hall island is a moat, preventing you from continuing through." [on first entrance, mention the long passage way between the two as well]


The west moat is east of the First Transverse Chamber and west of the Central Nave. The west moat is an open unopenable door. "A moat surrounds the entire central nave." The description of the west moat is "Deep and murky." 

The east moat is west of the Tomb of Osiris and east of the Central Nave. The east moat is an open unopenable door. "A moat surrounds the entire central nave." The description of the east moat is "Deep and murky." 

[one day i fight the battle and make the plank have to be placed down and picked up grrr but not for the demo]

Instead of going through the west moat:
	if the player does not have the wooden plank:
    		say "You approach the edge of the moat, but there is no way across. The waters churn ominously, as if warning you to stay back.";
	otherwise: 
    		say "You place the wood plank down, desperately hoping it'll bear your weight.";
		continue the action;
		
Instead of going through the east moat:
	if the player does not have the wooden plank:
    		say "You approach the edge of the moat, but there is no way across. The waters churn ominously, as if warning you to stay back.";
	otherwise: 
    		say "You place the wood plank down, desperately hoping it'll bear your weight.";
		continue the action;
		
The Central Nave is a room in Abydos. It is east of the west moat. "You stand in the middle of the columns lining the central nave and look around. Surrounding you are 17 small cells. Most of them are shrouded in darkness and you could barely see inside, but one directly east of you seems to lead out to a bigger chamber. The doorway back to the first transverse chamber is to your west. The ceiling echoes the structure of a sarcophagus. A large statue dominates the center of the room, its scale representative of what could have nly been a god. In front of it, a low altar sits, its surface decorated with scarce items. "
[only print the description of one moat when in central nave, currently it prints twice]

The statue of Osiris is in the Central Nave. The description of the statue of Osiris is "Carved from greywacke, it exudes power and authority. Osiris sits on a throne in a mummified form wearing a close-fitting enveloping garment, a divine beard attached to his chin, and the Atef crown flanked by two ostrich feathers, adorned with the uraeus cobra. He holds the royal crook and flail with his arms crossed on his chest. The base of the statue is inscribed with an offering prayer, while the back pillar of the statue is not inscribed. (from the cairo museum, feel free to change) He sure looks put together-- a drastic difference from his current state."

The altar is in the Central Nave. The description of the altar is "The altar is a simple stone slab, weathered and chipped at the edges but still retaining an air of solemnity. On its surface are the remains of some incense."

Before going when the location is the Central Nave:
	if the noun is east or the noun is west:
		continue the action;
	otherwise:
		say "With the moat surrounding the central nave, it's a struggle to go anywhere." instead.

The Tomb of Osiris is a room in Abydos. It is east of the east moat. "The roof and walls has Nut and Geb stuff on it. At the center of the room is a sarcophagus, its wooden frame lavishly painted in the style of the New Kingdom. Comedically, it is wrapped in an almost absurd number of golden chains, as if to guard against any attempt to disturb its occupant."

The painted roof is scenery in the Tomb of Osiris. The description of the painted roof is "The depiction of Nut, her star-strewn body stretching across the heavens, is both graceful and imposing. Beneath her, Geb lies in repose, his green-toned skin symbolizing fertility and life. The colors have dulled over time, but the craftsmanship remains evident."

The inscribed walls are scenery in the Tomb of Osiris. The description of the inscribed walls is "The hieroglyphs here are meticulously carved, detailing invocations to the gods and protective spells. Some portions of the text are damaged, yet the overall message of guidance and protection is clear."

The sarcophagus is a closed container. It is locked. It is in the Tomb of Osiris. The description of the sarcophagus is "The sarcophagus is a masterpiece of New Kingdom artistry. Crafted from cedar wood, its surface is painted with intricate designs. Osiris, the vain man, must have made it auto-update every now and then to keep up with the most popular coffin style." The sarcophagus has matching key the faience ankh.

Osiris' head is a body part. It is in the sarcophagus. Osiris' head can be taken. Understand "Osiris" as Osiris' head. Include (- has animate -) when defining Osiris' head. Osiris' head can be smart or dumb. Osiris' head is dumb. The description of Osiris' head is "Osiris, in all his glorious, head-only form."

Test Abydos with "e" in the First Transverse Chamber holding the wooden plank and faience ankh.


Part 4 - Talking Osiris Agenda
[this entire part must be completed in order]

Talking Osiris Agenda is a scene. Talking Osiris Agenda begins when Head Acquisition ends. Talking Osiris Agenda ends when Organ Acquisition ends. 

Chapter 2 - Amarna-Brain

Brain Acquisition is a scene. Brain Acquisition begins when Talking Osiris Agenda begins. Brain Acquisition ends when Osiris' brain is acquired.

[Discovery is a scene. Discovery begins when player is in Workmen's Village for the first time. Discovery ends when the workman is curious. ]

Discovery is a scene. Discovery begins when Brain Acquisition begins. Discovery ends when the workman is curious. 

Get Body Bag is a scene. Get Body Bag begins when Discovery ends. Get Body Bag ends when the body bag is acquired.

Exploration is a scene. Exploration begins when Get Body Bag ends. Exploration ends when Osiris' brain is acquired.

[Brain Revealed is a scene. Brain Revealed begins when ]

Next Instructions is a scene. Next Instructions begin when Exploration Ends. Next Instructions end when the workman is uncurious.
	
Section 2 - Workmen's village

Outside the Walled Village is a room in Amarna. "more description here. The entrance to the walled village is directly north of you. The walled workmen's villlage only has one gate."

[maybe add security checkpoint moment as Medea walks through gate?]

The Workmen's Village is a room in Amarna. It is north of Outside the Walled Village. "A dusty cluster of homes and workshops, bustling with activity."

A body bag is a container. The carrying capacity of the body bag is 14. The description of the body bag is "A heavy cloth sack used for transporting... questionable things."

Check inserting something into the body bag:
	if the noun is not a body part:
		say "The body bag isn't for this." instead.

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

[add a way she acquires oxcart maybe? or just a dialogue/reaction from the person she stole it from]

The oxcart is a rideable vehicle. The description of the oxcart is "A sturdy wooden cart, drawn by a strong hunky ox."

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

The Small Aten Temple is a room in Amarna. It is north of the Ruined City. "Despite being the smaller Aten Temple, you could still see the foundations that stretched far. It was made of three courts, the first, second, and sanctuary court. You are standing in what used to be the sanctuary court, now demolished into nothingness. A partially reconstructed sanctuary stands before you. It looked glorious, despite being only a fraction of what would've once been there. "

The Sanctuary is a room in Amarna. It is north of the Small Aten Temple. "Unlike sanctuaries in traditional temples, this space is bathed in sunlight, a deliberate design to honor the Aten, the sun disk. Around the perimeter of the sanctuary are low, carved altars, decorated with offerings and incense. In the center of the sanctuary, a shrine depicting Aten seems to shine in its golden splendor. (or something like that i guess)"

The carved altars are scenery in the Sanctuary. "The low altars are made of sandstone, each inscribed with dedications to Aten. "

The offerings are things in the Sanctuary. "Arranged delicately atop the altars are offerings of (something). Each item looks fresh, as if newly placed by worshippers -- odd."

The Aten shrine is scenery in the Sanctuary. "(description of shrine, pick object?)"

The staircase is a closed unopenable door. The staircase is above the Underground chapel and below the Small Aten Temple. 

[remove reporting of the hidden door somehow]

Instead of examining the shrine:
	now the staircase is open;
	say "You hear an odd rumbling noise. (here the hidden staircase is revealed).";
	continue the action.

Underground Chapel is a room in Amarna. It is below the staircase. "The air is cool and still. Strange elongated statues and murals with eerily etched toes line the walls."
[description very important for next game! all to you :)))))]
[it could be myth based or something? related to aten? or to osiris]


Section 4 - At the Small Aten Temple
	
The north mural is scenery in the Underground Chapel. The description is "a sun with rays that end in little ends dominate the picture."

The south mural is scenery in the Underground Chapel. The description is "the figures here have very defined toes."

The east mural is scenery in the Underground Chapel. The description is " a weathered relief shows nothing but a round disk in the center. surely etchings used to be around it, but we cant see them."

The west mural is scenery in the Underground Chapel. The description is "a man holds out probably a little duck to the demanding hand sun ray things."

The ceiling is scenery in the Underground Chapel. The description is "has some hint revealing the sequence in which to touch stuff - for example-- in a laid out sequence, you see the a sun disk, reaching out hand rays, onto the offerings of lotus flowers, held by a person with a very long head. "

The first statue is scenery in the Underground Chapel. The description is "this is a broken statue. this probably used to be depicting a person. guess we'll never find out."

The second statue is scenery in the Underground Chapel. The description is "a statue of a tall man with a long face and long hat sits there."

The third statue is scenery in the Underground Chapel. The description is "statue of a man with a giant lotus sprouting out the top of his head. hope he's ok"

[Every turn:
	showme the contents of Table of Current Sequence.]
	
[When Brain Acquisition begins:
	refill the sequence.]

Instead of touching something in the Underground Chapel:
	choose row 1 in the Table of Current Sequence;
	if the noun is the item entry:
		blank out the whole row;
		sort the sequence;
		say "You touch the [noun], and something clicks into place.";
		if there is no item in row 1 of the Table of Current Sequence:
			trigger the end sequence;
			
	otherwise:
		say "Nothing happens.";
		refill the sequence.

Table of Full Sequence
seq	item
1	east mural
2	north mural
3	third statue
4	second statue

Table of Current Sequence
seq	item
1	east mural
2	north mural
3	third statue
4	second statue
with 1 blank row

To sort the sequence:
	sort the Table of Current Sequence in seq order;

To refill the sequence:
	blank out the whole of the Table of Current Sequence;
	repeat with N running from 1 to the number of rows in the Table of Full Sequence:
		choose row N in the Table of Full Sequence;
		let seq-val be the seq entry;
		let item-val be the item entry;
		choose row N in the Table of Current Sequence;
		now the seq entry is seq-val;
		now the item entry is item-val.

To trigger the end sequence:
	say "You hear something. something is happening. woaaah.";
	move Osiris' brain to the Sanctuary.

Osiris' brain is a body part. The description of the brain is "An unnervingly lifelike, pulsating organ."

Section 5 - Back to the village

When Exploration ends:
	now the workman is curious.
	


test Amarna with "n" in The small aten temple holding the head.

Chapter 3 - Thebes-Heart

Heart Acquisition is a scene. Heart Acquisition begins when Brain Acquisition ends. Heart Acquisition ends when Osiris' heart is acquired.

Heal Heracles is a scene. Heal Heracles begins when Heart Acquisition begins. Heal Heracles ends when Heracles is healthy. 

Buddy Heracles is a scene. Buddy Heracles begins when Heal Heracles ends. Buddy Heracles ends when the location of the player is not in Busiris.

Every turn during Buddy Heracles:
	if the location of Heracles is not the location of the player:
		now Heracles is in the location;
		say "Heracles follows you with a grunt."


Section 1 - All the Locations

The Temple of Thutmosis III is a room. It is in Thebes. "This temple honors Thutmosis III."

The Ramesseum is south of The Temple of Thutmosis III. It is in Thebes. "The mortuary temple of Ramesses II looms large with its colossal statues. You can see a sign or something pointing to a 'house of life' further inside to the west. "

The Temple of Thutmosis IV is south of the Ramesseum. It is in Thebes. "An elegant temple commemorates the reign of Thutmosis IV."

The Temple of Tawosret is south of the Temple of Thutmosis IV. It is in Thebes. "The Temple of Tawosret stands here."

The Temple of Merenptah is south of the Temple of Tawosret. It is in Thebes. "The Temple of Merenptah is here."

A collection of three temples is a room. It is south of the Temple of Merenptah. It is in Thebes. "This includes the temple of Thutmosis I, Amenhotep son of Hapu, and Thutmosis III."

The Temple of Thutmosis I is scenery in the collection of three temples. "The Temple of Thutmosis I is here."

The Temple of Amenhotep Son of Hapu is scenery in the collection of three temples. "The Temple of Amenhotep Son of Hapu is here."

The Smaller Temple of Thutmosis III is scenery in the collection of three temples. "The (other smaller) Temple of Thutmosis III is here."

The Temple of Amenhotep III is east of the the collection of three temples. It is in Thebes. "Amenhotep III's vast mortuary temple lies here."

The Memnon Colossi is east of the Temple of Amenhotep III. It is in Thebes. "Two massive statues of Amenhotep III stand watch over the land."

[the heart will be hidden in one of these two statues at the base]
Osiris' heart is a body part. 

The Temple of Horemheb is south of the collection of three temples. It is in Thebes. "This temple stands as  tribute to Aÿ and Horemheb."
[Heracles is at Horemheb]

The Temple of Ramesses III is south of the Temple of Horemheb. It is in Thebes. "Here be Ramesses III's temple."

Section 2 - The library

[add something description or code to make entering house of life more intuitive: aka somehow medea knows house of life is library and it is in side the ramesseum. maybe a trigger of dialogue like the priest asks medea her purpose and she says for medicine]

[longer dialogue first time, shorter dialogue for repeat visits]

The House of Life is west of the Ramesseum. It is in Thebes. "This is the library! Often houses of life have been hinted to be attached/close to a temple precinct." 

[also cannot be kidnapped in house of life]

[some mechanic for finding correct papyri or simple description]

Medical papyri is scenery in the House of LIfe. "You look around the shelves of papyri and found a shelf that caught your eye. something about the papyri. Incorporate a spell"

[after examining papyri, player can type "think" to remember what she needs]

Section 3 - 

[when medea first lands, say "maybe it's time to explore to gather some hints about where Osiris might be]

[Medea lands in Tawosret]

Heracles is a person in the Temple of Horemheb. Heracles can be sick or healthy. Heracles is sick.


Chapter 4 - Busiris-Organs

Organ Acquisition is a scene. Organ Acquisition begins when Heal Heracles ends. Organ Acquisition ends when Osiris' liver is acquired.

Table of Countdown
num_moves
1
2
3
4
5
6
7
8
9
10

Every turn during Organ Acquisition:
	if the location is not the House of Life:
		repeat through Table of Countdown:
			blank out the whole row;
			rule succeeds.

The Kidnapping is a scene. The Kidnapping begins when the number of filled rows in the Table of Countdown is 0. The Kidnapping ends when King Busiris is dead.

Osiris' liver is a body part. It is in Busiris-Marketplace.

Section 1 - Busiris Palace

Central Court is a room in Busiris.

King Busiris is a person. King Busiris can be alive or dead. King Busiris is alive.



Part 5 - Complete Any Time
[can be completed any time after acquiring the head]

Hand Acquisition is a scene. Hand Acquisition begins when Head Acquisition ends. Hand Acquisition ends when Osiris' left hand is acquired and Osiris' right hand is acquired.

Chapter 5 - Avaris-Hands

Osiris' left hand is a body part. It is in Avaris-Marketplace.

Osiris' right hand is a body part. It is in Avaris-Marketplace.


Part 6 - Tour Guide Osiris
[this part can be completed out of order, although some chapters require objects from other chapters to be completed]

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

The Nile Riverbank is in Oxyrhynchos. It is east of Oxyrhynchos-Marketplace. "You are at the bank of the Nile. (like kind of, it's a natural offshoot, now called the yussuf bahr canal or something) West of you is the marketplace."

The Taweret Amulet is a thing. 

Tawaret Conflict is a scene. Tawaret Conflict begins when the player is in the Nile Riverbank for the first time. Tawaret Conflict ends when the Taweret Amulet is acquired.

[add lots of dialogue and the whole conflict relating to tawaret]

[Ruya makes the Tawaret character and all associated interactions]

Section 4 - Fishing game

[maybe change the description of the Nile once Tawaret is gone. mention the fish in it]

A species is a kind of value. The plural of species is species. The species are perch, tilapia, mormyrid, and tigerfish. 

A fish is a kind of container. A fish are edible. A fish is closed. A fish can be found in the Nile Riverbank. The plural of fish is fish. A fish has a species. The species of a fish is usually tilapia. The description of a fish is usually "A fish." Understand the species property as describing a fish.

In the Nile Riverbank there is 10 fish.

After printing the name of a fish:
	omit contents in listing.

A fish gut is a kind of thing. The description of fish guts is "Fish guts." Fish gut is in every fish.

Rule for printing the name of fish gut:
	say "fish guts".

Before listing contents: group fish together.

Rule for printing the name of a fish:
	say "[species]".

[Rule for printing a number of fish (called the target): 
	if the listing group size is less than 4:
		say "a few "; 
	else if the listing group size is less than 6:
		say "some ";
	else if the listing group size is less than 8:
		say "a bunch of ";
	else:
		 say "many ";
	carry out the printing the plural name activity with the target.]

A catfish is a closed container. The description of the catfish is "[if player is not carrying catfish] It's a catfish... I wonder if that has any significance? [end if] [if player is carrying closed catfish] You eye the catfish with great suspicion. It looks back at you and reveals nothing. Maybe its silence can be resolved by a good gutting.[end if] [if catfish is open] It's been gutted. Poor catfish."

Instead of taking a fish:
	say "The fish are swimming freely in the Nile. Maybe you could try fishing for it."

Instead of eating the catfish:
	say "You look at it with immense distrust. It just looks so awfully... fishy... Better not.".
	

Osiris' penis is a body part in catfish. Understand "penis/phallus" as Osiris' penis.

Instead of taking Osiris' penis:
	continue the action;
	now Osiris' penis is acquired.
	
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
			
Fishing is an action applying to nothing. Understand "fish" or "go fishing" or "go fish" as fishing.

Before fishing:
	if the fishing rod is not carried:
		 say "You've got nothing to fish with. Your hands won't suffice, unfortunately." instead;
	otherwise if the fishing rod is unbaited:
		say "You won't catch much without bait on the hook."  instead;
	otherwise if player is not in Nile Riverbank:
		say "This is not a viable place to be fishing." instead;
[	otherwise if player is carrying the catfish:
		say "You already have a fish in your posession. Don't be so greedy." instead;]
	otherwise:
		say "You cast your fishing rod out with a strong throw..."
		
		
Instead of dropping a fish:
	now the noun is nowhere;
	say "You drop the fish. It makes a valiant leap for the river and succeeds! It swims away aggressively."
		
Carry out fishing:
	if a random chance of 1 in 5 succeeds:
		move the catfish to the player;
		say “You have caught the catfish!”;
	otherwise:
		let X be a fish;
		unless X is nothing:
			now the species of X is a random species;
			move X to the player;
			say “You have caught a [species of X].”
		
		
[Carry out fishing:
	if a random chance of 1 in 5 succeeds:
		move the catfish to the player;
		say “You have caught the catfish!”;		
		now the fishing rod is unbaited;
	otherwise:
		say “And pulled up nothing.”;]

Test fish with "take rod / take knife / take bait / bait rod / e" in Oxyrhynchos-Marketplace.
			
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






