Class {
	#name : #RTCircularTreeMapTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #tests }
RTCircularTreeMapTest >> testBasic [


	| b |
	b := RTCircularTreeMapBuilder new.
	b shape
		color: Color transparent;
		borderWidth: 1.
	b
		baseradius: 400;
		weight: [:n | n].
	b explore: 1
		using: [:n | n< 3 ifTrue: [Array with: n+1 with: n+2] ifFalse: [ #() ] ].
	
	b build.
	
]
