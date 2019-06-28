Class {
	#name : #FamixComposingTestTraitsGenerator,
	#superclass : #FamixTestGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> addingTraitsToTestTraitFor: aClass [
	self testAssociatedTo: aClass.
	(self usedTraitsOfFamixTrait: aClass) do: 
	[:t | test traitComposition: (test traitComposition + (self findTestFrom: t ))]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> findTestFrom: aTrait [
	^ (RPackageOrganizer default packageNamed: 'Famix-Tests') classes detect: [ :c | c name = (self testNameFrom: aTrait) ]
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> testAssociatedTo: aClass [
	test := (RPackageOrganizer default packageNamed: 'Famix-Tests') classes detect: [ :c | c name = (self testNameFrom: aClass) ].
	
	
]

{ #category : #'as yet unclassified' }
FamixComposingTestTraitsGenerator >> usedTraitsOfFamixTrait: aClass [
	^aClass traitComposition traits
	
	
]
