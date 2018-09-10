"
The default repeating parser with standard PEG semantics (i.e. possessive, blind, eager).
"
Class {
	#name : #PPPossessiveRepeatingParser,
	#superclass : #PPRepeatingParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPPossessiveRepeatingParser >> parseOn: aPPContext [
	| memento element elements |
	memento := aPPContext remember.
	elements := OrderedCollection new.
	[ elements size < min ] whileTrue: [
		(element := parser parseOn: aPPContext) isPetitFailure ifTrue: [
			aPPContext restore: memento.
			^ element ].
		elements addLast: element ].
	[ elements size < max ] whileTrue: [
	 	(element := parser parseOn: aPPContext) isPetitFailure
			ifTrue: [ ^ elements asArray ].
		elements addLast: element ].
	^ elements asArray
]
