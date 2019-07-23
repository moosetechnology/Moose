Class {
	#name : #FamixComposingTestTraitsGenerator,
	#superclass : #FamixTestGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> addingTraitsToTestTraitFor: aClass [
	self testAssociatedTo: aClass.
	((self usedTraitsOfFamixTrait: aClass) select: [:t | t name beginsWith: 'FamixT']) do: 
	[:t | 
	|existingSlots traitToAdd|
		existingSlots := test traitComposition slots.
		traitToAdd := (self findTestFrom: t) asTraitComposition.
		
		(test traitComposition allTraits includes: (self findTestFrom: t))
			ifFalse: [
				existingSlots do: [ :e | (traitToAdd slots anySatisfy: [ :anSlot | anSlot name = e name and: [ anSlot definingClass ~= e definingClass ] ] ) ifTrue: [traitToAdd := traitToAdd -- e name] ].
				test setTraitComposition: (test traitComposition + traitToAdd)]]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> findTestFrom: aTrait [
	^ (RPackageOrganizer default packageNamed: 'Famix-Tests') classes detect: [ :c | c name = ('T', (self testNameFrom: aTrait)) ]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> runFor: aClass [
	self addingTraitsToTestTraitFor: aClass.
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> testAssociatedTo: aClass [
	test := (RPackageOrganizer default packageNamed: 'Famix-Tests') classes detect: [ :c | c name = (self testNameFrom: aClass) ].
	
	
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> usedTraitsOfFamixTrait: aClass [
	^aClass traitComposition traits
	
	
]
