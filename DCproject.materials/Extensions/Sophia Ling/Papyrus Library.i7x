Papyrus Library by Sophia Ling begins here.

Section - Kinds
	
A papyri-collection is a kind of thing. A papyri-collection is scenery.
A papyri-collection has a list of text called subject-list.
A papyri-collection has some text called collection title.

A papyrus-scroll is a kind of thing. A papyrus-scroll is scenery.
A papyrus-scroll has a papyri-collection called library.
A papyrus-scroll has some text called code.
A papyrus-scroll has some text called title.
A papyrus-scroll has some text called content.
A papyrus-scroll has some text called subject.

Instead of taking a papyri-collection, say "You are not allowed to remove scrolls from the shelves."
Instead of touching a papyri-collection, say "The papyrus feels rough beneath your fingertips."
Instead of smelling a papyri-collection, say "The shelves smell of ancient ink and the tears of scribes."
Instead of tasting a papyri-collection, say "Licking papyrus would be undignified."

The description of a papyrus-scroll is usually "It's got words.".

Instead of taking a papyrus-scroll, say "You are not allowed to remove scrolls from the shelves."
Instead of touching a papyrus-scroll, say "The papyrus feels rough beneath your fingertips."
Instead of smelling a papyrus-scroll, say "The shelves smell of ancient ink and the tears of scribes."
Instead of tasting a papyrus-scroll, say "Licking papyrus would be undignified."


Section - Reading

Understand the command "read" as something new.

Reading is an action applying to one visible thing.

Understand "read [papyrus-scroll]" as reading.
Understand "read [papyri-collection]" as reading.


Carry out reading a papyrus-scroll:
	say "[fixed letter spacing][line break][bold type][title of the noun][roman type][paragraph break]";
	say "[content of the noun][line break][variable letter spacing]".


Instead of reading a papyri-collection (called C):
	say "[catalogue of C]".


Section - Catalogue

To say catalogue of (C - a papyri-collection):
	say "[bold type][collection title of C][roman type][paragraph break]";
	repeat with S running through the subject-list of C:
		say "[bold type][S][roman type][line break]";
		repeat with P running through papyrus-scrolls:
			if the library of P is C:
				if the subject of P exactly matches the text S:
					say "    [printed name of P]: [title of P][line break]";
	say line break.


Section - Description Helpers

To say subject listing of (C - a papyri-collection):
	repeat with S running through the subject-list of C:
		say "    • [S][line break]".

Papyrus Library ends here.