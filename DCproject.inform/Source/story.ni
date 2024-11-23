"DCproject" by Sophia Ling

Include Basic Screen Effects by Emily Short.


Section 1 - New Types and Actions

Talking to is an action applying to one visible thing. Understand "talk to [someone]" or "talk to [something]" or “converse with [someone]” or "converse with [something]" as talking to.

Carry out talking to someone:
	say "There is no reply."


Section 2 - Sun Chariot Travel

Understand "[number]" as selecting when player is on the sun chariot.

Selecting is an action applying to one number.

Check selecting: [assuming we don't want to be able to transport from just anywhere]
	if the player is not on the sun chariot:
		say "You can get there only with the sun chariot. From other places than the transporter room, you can HOME to your base ship, but not leap sideways to other locations.";
		do nothing instead.

Check selecting:
	if the number understood is greater than the number of filled rows in the Table of Transport Options or the number understood is less than one:
		say "[The number understood] is not a valid option. ";
		list the transport options instead.

Carry out selecting:
	let N be the number understood; [not actually a necessary step, but it makes the next line easier to understand]
	choose row N in the Table of Transport Options;
	if the transport entry is a room:
		move the player to the transport entry;
	otherwise:
		say "*** BUG: Improperly filled table of transport options ***" [It should not be possible for this to occur, but we add an error message for it so that, if it ever does, we will know what is causing the programming error in our code]

To list the transport options:
	let N be 1;
	say "From here you could choose to go to: [line break]";
	repeat through the Table of Transport Options:
		say "  [N]: [transport entry][line break]";
		increment N.

Table of Transport Options
transport
Thebes
Memphis
Avaris
Nile Riverbank
[Elephantine
Amarna
Heliopolis
Faiyum
Abydos
Lahun
Hermopolis]

Understand "chariot" or "go to chariot" as homing. Homing is an action applying to nothing.

Check homing:
	if the player is in the Transporter Room:
		say "You're already here!" instead.

Carry out homing:
	say "You quickly head towards your sun chariot. You've got somewhere to get to!";
	move the player to the transporter room.

Section 3 - Test Teleportation

The Transporter Room is a room.

The sun chariot is an enterable supporter in the Transporter Room. 

After entering the sun chariot:
	say "As you step onto the chariot, the serpents in front hiss joyfully, happy to see you again. [run paragraph on]";
[	empty the transport options;
	load the transport options;]
	list the transport options.

[Test me with "get on chariot / 0 / -1 / 8 / 2 / look / w / chariot / get on chariot / get off chariot / 3".]

Thebes is a room.

Memphis is a room. 

Avaris is a room. It is north of Memphis.

Section 4 - Osiris' Head

Table of Osiris' unrelated knowledge
comment
"Lucy wears a size 9 shoe."
"Sunset is at 8:22 PM this evening."
"boop1"
"boop2"

Table of Osiris' useful knowledge
fact	summary
1	"Sunset is at 8:22 PM this evening."

Osiris' head is a thing. It is in the Transporter Room. Osiris' head can be taken. Understand "Osiris" as Osiris' head. Include (- has animate -) when defining Osiris' head.

Instead of talking to head:
        say "Hi, there,' you say confidently.[paragraph break]";
    	choose random row in the Table of Osiris' unrelated knowledge;
    	say "[comment entry]".


Chanting is an action applying to nothing.
Understand "saying some spell rn" as chanting.
Instead of chanting:
	say "oh yeah get it".

Section 5 - Exposition

[When play begins:
    say "This reminds you of the summer of '69...";
    wait for any key;
    say "... flashback content...";
    wait for any key.]

Section 6 - Penis Fish


[Osiris' penis is a thing in the catfish. 

Instead of examining the catfish:
	say "You look it in the eyes with great suspicion. It looks back at you, and reveals nothing. But maybe its silence can be resolved by a good gutting."
	
Instead of killing the catfish:
	say "".]

Fishing is an action applying to one visible thing. Understand "fish" or "go fish" as fishing.

Check fishing:
	if the fishing pole is not carried:
		say "You've got nothing to fish with. Your hands won't suffice, unfortunately." instead.
	otherwise:
		if the fishing pole is unbaited:
			say "It probably won't be very productive without any bait." instead.

Carry out fishing:
	say "You cast the baited fishing pole into the river and wait patiently...";
	say "After a few moments, you feel a tug and pull up a large catfish!";
	now the catfish is caught;
	now the player carries the catfish.

A blade is a kind of thing.
		
Understand "cut [something] with [something preferably held]" as cutting it with. Cutting it with is an action applying to two carried things.

Understand "gut [something] with [something preferably held]" as cutting it with.

Understand "slice [something] with [something preferably held]" as cutting it with.

Understand "slice open [something] with [something preferably held]" as cutting it with.

Check cutting:
	if the knife is not carried:
		say "You can hardly cut open the fish without a proper tool.";
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
	
[Finished identifying actions]

The Nile Riverbank is a room. "You are at the bank of the Nile."

A fishing pole is in the Nile Riverbank. The fishing pole can be baited or unbaited. It is unbaited.

Fish-food is in the Nile riverbank. 

The catfish is a closed container in the nile riverbank. The catfish can be caught, uncaught, or gutted. The catfish is uncaught. 

Osiris' penis is a thing in the catfish. Understand "penis/phallus/dick/cock" as Osiris' penis.

Instead of taking the catfish:
	if the catfish is uncaught:
		say "The catfish is swimming freely in the Nile. Maybe you could try fishing for it."

Instead of eating the catfish:
	say "You look at it with immense distrust. It just looks so awfully... fishy... Better not.".


Instead of examining the fishing pole:
	if the fishing pole is unbaited:
		say "A sturdy fishing pole, but it could use some bait.";
	otherwise:
		say "The fishing pole is now baited with some fish food.".

Instead of taking the fish-food when the player is holding the fishing pole:
    say "You attach the fish food to the fishing pole as bait.";
    now the fishing pole is baited;
    now the fish-food is nowhere.

A knife is a blade in the nile riverbank. 

Instead of cutting the catfish with the knife:
	if the catfish is caught:
		say "You carefully cut open the catfish with the knife. Inside its stomach, you find a shiny gold coin!";
		now the penis is in the Nile riverbank;
	otherwise:
		say "You have to catch the catfish first."

Instead of taking the penis:
	if the penis is in the Nile Riverbank:
		say "You pick up the penis with an expression of disgust.";
	otherwise:
		say "There's no penis here to take."









