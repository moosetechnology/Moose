Extension { #name : #Integer }

{ #category : #'*moose-algos-formalconceptanalysis' }
Integer >> bitMaskDo: aBlock [
	"Evaluates aBlock with the index of all bits that are set true."

	self subclassResponsibility
]

{ #category : #'*moose-algos-formalconceptanalysis' }
Integer >> cardinality [
	"Answer the number of bit set to 1, ie true."

	| tally |
	tally := 0.
	self bitMaskDo: [ :index | 
		tally := tally + 1 ].
	^tally
]

{ #category : #'*moose-algos-formalconceptanalysis' }
Integer >> copyUpToPlusIndex: index [

	| bit mask |
	bit := Integer maskBit: index.
	mask := Integer maskTrue: index - 1.
	^(self bitAnd: mask) maskSet: bit
]

{ #category : #'*Moose-Algos-FormalConceptAnalysis' }
Integer class >> maskBit: pos [

	^1 bitShift: (pos - 1)
]

{ #category : #'*Moose-Algos-FormalConceptAnalysis' }
Integer class >> maskTrue: size [

	^(1 bitShift: size) - 1
]

{ #category : #'*moose-algos-formalconceptanalysis' }
Integer >> upToPlusIndex: index isLargerThan: extent [

	| mask |
	^1 == (self bitAt: index) and: [
		0 == (extent bitAt: index) and: [
			mask := Integer maskTrue: index - 1.
			(self bitAnd: mask) = (extent bitAnd: mask) ]]
]
