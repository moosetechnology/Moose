Extension { #name : #Class }

{ #category : #'*RoelTyper-enumerating' }
Class >> nonMetaSubclassesDo: aBlock [
	"Evaluate the argument, aBlock, for each of the receiver's immediate non-meta subclasses."

	"This one is here for the sake of Squeak (where it is Class and not Behavior that keeps the subclasses instance variable)."

	"This method is supposed to be local in Class because of a good reason.
   We use this pragma to test if Class does not contain some accidental 
   local selectors."

	<localClassMethod>
	subclasses isNil
		ifFalse: [ subclasses do: aBlock ]
]
