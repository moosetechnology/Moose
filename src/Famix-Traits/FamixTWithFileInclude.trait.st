Trait {
	#name : #FamixTWithFileInclude,
	#instVars : [
		'#incomingIncludeRelations => FMMany type: #FamixTFileInclude opposite: #target',
		'#outgoingIncludeRelations => FMMany type: #FamixTFileInclude opposite: #source'
	],
	#category : #'Famix-Traits-FileInclude'
}

{ #category : #meta }
FamixTWithFileInclude classSide >> annotation [

	<MSEClass: #TWithFileInclude super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithFileInclude classSide >> generatedSlotNames [
	<generated>
	'FamixTWithFileInclude class>>#generatedSlotNames'.
	^ #(incomingIncludeRelations outgoingIncludeRelations)
]

{ #category : #generator }
FamixTWithFileInclude classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithFileInclude >> incomingIncludeRelations [

	<generated>
	<MSEComment: 'The include entities that have this file as a target.'>
	^ incomingIncludeRelations
]

{ #category : #accessing }
FamixTWithFileInclude >> incomingIncludeRelations: anObject [

	<generated>
	incomingIncludeRelations value: anObject

]

{ #category : #accessing }
FamixTWithFileInclude >> outgoingIncludeRelations [

	<generated>
	<MSEComment: 'The include entities that have this file as a source.'>
	^ outgoingIncludeRelations
]

{ #category : #accessing }
FamixTWithFileInclude >> outgoingIncludeRelations: anObject [

	<generated>
	outgoingIncludeRelations value: anObject

]
