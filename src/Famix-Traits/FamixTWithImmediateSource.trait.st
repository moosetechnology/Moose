Trait {
	#name : #FamixTWithImmediateSource,
	#instVars : [
		'#source => FMProperty'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTWithImmediateSource classSide >> annotation [

	<MSEClass: #TWithImmediateSource super: #Trait>
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
