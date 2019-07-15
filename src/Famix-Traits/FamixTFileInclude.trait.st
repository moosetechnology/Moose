Trait {
	#name : #FamixTFileInclude,
	#instVars : [
		'#source => FMOne type: #FamixTWithFileInclude opposite: #outgoingIncludeRelations',
		'#target => FMOne type: #FamixTWithFileInclude opposite: #incomingIncludeRelations'
	],
	#category : #'Famix-Traits-FileInclude'
}

{ #category : #meta }
FamixTFileInclude classSide >> annotation [

	<MSEClass: #TFileInclude super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTFileInclude classSide >> generatedSlotNames [
	<generated>
	'FamixTFileInclude class>>#generatedSlotNames'.
	^ #(source target)
]

{ #category : #generator }
FamixTFileInclude classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTFileInclude >> source [

	<generated>
	<MSEComment: 'The file that is including'>
	^ source
]

{ #category : #accessing }
FamixTFileInclude >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FamixTFileInclude >> target [

	<generated>
	<MSEComment: 'The file that is included'>
	^ target
]

{ #category : #accessing }
FamixTFileInclude >> target: anObject [

	<generated>
	target := anObject

]
