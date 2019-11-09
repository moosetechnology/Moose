Trait {
	#name : #FamixTWithImmediateSource,
	#instVars : [
		'#source => FMProperty'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTWithImmediateSource classSide >> annotation [

	<FMClass: #TWithImmediateSource super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithImmediateSource >> isFile [

	^ false
]

{ #category : #accessing }
FamixTWithImmediateSource >> source [

	<FMProperty: #source type: #String>
	<generated>
	<FMComment: 'Actual source code of the source entity'>
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
