Class {
	#name : #FamixComposingTestTraitsGenerator,
	#superclass : #FamixTestGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> addingTraitsToTestTraitFor: aClass [

	self testAssociatedTo: aClass.
	(self usedTraitsOfFamixTrait: aClass) do: 
	[:t | test setTraitComposition: (test traitComposition + (self findTestFrom: t ))]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> findTestFrom: aTrait [
	^ (RPackageOrganizer default packageNamed: self generator prefix, '-Tests-Traits') classes detect: [ :c | c name = ('T', (self testNameFrom: aTrait)) ]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> runFor: aClass [
	aClass allSlots
		ifNotEmpty: [ self addingTraitsToTestTraitFor: aClass ]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> testAssociatedTo: aClass [
	test := (RPackageOrganizer default packageNamed: self generator prefix, 'Tests-Tests') classes detect: [ :c | c name = (self testNameFrom: aClass) ].
	
	
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> usedTraitsOfFamixTrait: aClass [
	^aClass traitComposition traits
	
	
]
