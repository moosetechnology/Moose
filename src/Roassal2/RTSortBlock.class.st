Class {
	#name : #RTSortBlock,
	#superclass : #Object,
	#category : #'Roassal2-Layouts'
}

{ #category : #accessing }
RTSortBlock >> fixTemps [
]

{ #category : #accessing }
RTSortBlock >> value: assocA value: assocB [
	"Return false if assocA is bigger than assocB.
	Return true if assocA is smaller than assocB.
	-> Inverted list with biggest elements first"
	
	| a b offset |
	offset := 0.
	a := assocA value.
	b := assocB value.
	[(a size > offset)
		and: [(b size > offset) and: [(a at: a size - offset) = (b at: b size - offset)]]]
		whileTrue: [offset := offset + 1].	"Corner cases"
	(a size = b size and: [b size = offset]) ifTrue: [ ^ true ].	"[3, 3], [3, 3]"
	(a size > offset and: [b size = offset]) ifTrue: [ ^ true ].	"[3, 3, 6], [3, 3]"
	(b size > offset and: [a size = offset]) ifTrue: [ ^ false ].	"[3, 3], [3, 3, 6]"	"Normal case"
	^(a at: a size - offset) >= (b at: b size - offset)
]
