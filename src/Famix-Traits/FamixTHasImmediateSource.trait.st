"
An immediate source is the source code of the entity stored directly into its sourceAnchor instead of accessing it (for example in a file) through its sourceAnchor
"
Trait {
	#name : #FamixTHasImmediateSource,
	#instVars : [
		'#source => FMProperty'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTHasImmediateSource classSide >> annotation [

	<FMClass: #THasImmediateSource super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTHasImmediateSource >> isFile [

	^ false
]

{ #category : #accessing }
FamixTHasImmediateSource >> source [

	<FMProperty: #source type: #String>
	<generated>
	<FMComment: 'Actual source code of the source entity'>
	^ source
]

{ #category : #accessing }
FamixTHasImmediateSource >> source: anObject [
	<generated>
	source := anObject
]

{ #category : #accessing }
FamixTHasImmediateSource >> sourceText [

	^ self source
]
