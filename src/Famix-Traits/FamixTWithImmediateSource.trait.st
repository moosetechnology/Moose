Trait {
	#name : #FamixTWithImmediateSource,
	#instVars : [
		'source'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTWithImmediateSource classSide >> annotation [

	<MSEClass: #TWithImmediateSource super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithImmediateSource classSide >> generatedSlotNames [
	<generated>
	'FamixTWithImmediateSource class>>#generatedSlotNames'.
	^ #(source)
]

{ #category : #generator }
FamixTWithImmediateSource classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithImmediateSource >> isFile [

	^ false
]

{ #category : #accessing }
FamixTWithImmediateSource >> source [

	<MSEProperty: #source type: #String>
	<generated>
	<MSEComment: 'Actual source code of the source entity'>
	^ source
]

{ #category : #accessing }
FamixTWithImmediateSource >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FamixTWithImmediateSource >> sourceText [

	^ self source
]
