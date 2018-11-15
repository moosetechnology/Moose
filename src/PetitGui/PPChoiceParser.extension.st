Extension { #name : #PPChoiceParser }

{ #category : #'*PetitGui' }
PPChoiceParser >> exampleOn: aStream [
	"If there is already a lot written, try to pick an empty possiblity."
	
	aStream position > 512 ifTrue: [
		(parsers anySatisfy: [ :each | each isNullable ])
			ifTrue: [ ^ self ] ].
	parsers atRandom exampleOn: aStream
]

{ #category : #'*PetitGui' }
PPChoiceParser >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeSeen: aSet depth: anInteger do: [ :cc |
		| morph |
		morph := self newColumnMorph 
			cellInset: 5;
			yourself.
		self children do: [ :each | 
			morph addMorphBack: (self newRowMorph
				hResizing: #spaceFill;
				addMorphBack: (cc value: each);
				addMorphBack: (self newColumnMorph
					hResizing: #spaceFill;
					addMorphBack: (self newSpacerMorph height: 10);
					addMorphBack: ((LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)
						hResizing: #spaceFill;
						minWidth: 20;
						yourself);
					yourself);
				yourself) ].
		morph fullBounds.
		self newRowMorph
			addMorphBack: (self newColumnMorph
				addMorphBack: (self newSpacerMorph height: 10);
				addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1);
				yourself);
			addMorphBack: (self newColumnMorph
				addMorphBack: (self newSpacerMorph width: 1; height: 10);
				addMorphBack: (LineMorph from: 0 @ 0 to: 0 @ (morph height - 23) color: Color black width: 1);
				yourself);
			addMorphBack: morph;
			addMorphBack: (self newColumnMorph
				addMorphBack: (self newSpacerMorph width: 1; height: 10);
				addMorphBack: (LineMorph from: 0 @ (morph height - 23) to: 0 @ 0 color: Color black width: 1)
					makeForwardArrow;
					width: 1;
				yourself);
			yourself ]
]

{ #category : #'*PetitGui' }
PPChoiceParser >> visualizationGraphType [
	^ '/'
]
