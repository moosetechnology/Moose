"
A greedy repeating parser, commonly seen in regular expression implementations. It aggressively consumes as much input as possible and then backtracks to meet the 'limit' condition.

This class essentially implements the iterative version of the following recursive parser composition:

	| parser |
	parser := PPChoiceParser new.
	parser setParsers: (Array
		with: (self , parser map: [ :each :rest | rest addFirst: each; yourself ])
		with: (limit and ==> [ :each | OrderedCollection new ])).
	^ parser ==> [ :rest | rest asArray ]
"
Class {
	#name : #PPGreedyRepeatingParser,
	#superclass : #PPLimitedRepeatingParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPGreedyRepeatingParser >> parseOn: aPPContext [
	| memento element elements positions |
	memento := aPPContext remember.
	elements := OrderedCollection new.
	[ elements size < min ] whileTrue: [ 
		(element := parser parseOn: aPPContext) isPetitFailure ifTrue: [ 
			aPPContext restore: memento.
			^ element ].
		elements addLast: element ].
	positions := OrderedCollection with: aPPContext remember.
	[ elements size < max and: [ (element := parser parseOn: aPPContext) isPetitFailure not ] ] whileTrue: [
		elements addLast: element.
		positions addLast: aPPContext remember ].
	[ positions isEmpty ] whileFalse: [
		aPPContext restore: positions last.
		element := limit parseOn: aPPContext.
		element isPetitFailure ifFalse: [
			aPPContext restore: positions last.
			^ elements asArray ].
		elements isEmpty ifTrue: [
			aPPContext restore: memento.
			^ element ].
		elements removeLast.
		positions removeLast ].
	aPPContext restore: memento.
	^ PPFailure message: 'overflow' context: aPPContext at: memento position
]
