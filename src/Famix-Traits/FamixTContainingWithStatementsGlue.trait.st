Trait {
	#name : #FamixTContainingWithStatementsGlue,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTContainingWithStatementsGlue classSide >> annotation [

	<MSEClass: #TContainingWithStatementsGlue super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generation }
FamixTContainingWithStatementsGlue classSide >> generateMethodsFor: aBuilderClass in: aRingClass [

	"method not needed if we use MQ for getting of children. Kept as an example"
	"
	| withStatementsUsers links selectedLinkNames |
	
	withStatementsUsers := aBuilderClass builder classes select: [ :each | each directlyUses: (aBuilderClass builder traitNamed: #TWithStatements) ].
	links := (withStatementsUsers flatCollect: [ :each | each containerProperties collect: #otherSide ]) collectAsSet: #name.

	selectedLinkNames := (((aBuilderClass allTraits flatCollect: #properties) select: [ :each | links includes: each name ]) collect: #name) asArray.
	
	aRingClass instanceSide compile: ('{1}\\	<generated>\	^ {2}' withCRs format: { #tContainingWithStatementsLinks. selectedLinkNames printString }) 
		classified: #'builder support'.
"
]

{ #category : #generator }
FamixTContainingWithStatementsGlue classSide >> generatedSlotNames [
	<generated>
	'FamixTContainingWithStatementsGlue class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTContainingWithStatementsGlue classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #metrics }
FamixTContainingWithStatementsGlue >> numberOfStatements [
	<MSEProperty: #numberOfStatements type: #Number>
	<derived>
	<MSEComment: 'The number of statements in a class'>
			
	^self
		lookUpPropertyNamed: #numberOfStatements
		computedAs: [
			| group |
			group := MooseGroup
				withAll: (self children select: [ :child | child usesTrait: FamixTWithStatements])
				withDescription: 'Entities from ' , self mooseName.
			group sumNumbers: #numberOfStatements ] 
]

{ #category : #metrics }
FamixTContainingWithStatementsGlue >> numberOfStatements: aNumber [

	self privateState propertyAt: #numberOfStatements put: aNumber
]
