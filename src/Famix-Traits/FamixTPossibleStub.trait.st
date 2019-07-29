Trait {
	#name : #FamixTPossibleStub,
	#instVars : [
		'#isStub => FMProperty'
	],
	#category : #'Famix-Traits-Utility'
}

{ #category : #meta }
FamixTPossibleStub classSide >> annotation [

	<MSEClass: #TPossibleStub super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTPossibleStub >> isStub [

	<MSEProperty: #isStub type: #Boolean>
	<MSEComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ false ]
]

{ #category : #accessing }
FamixTPossibleStub >> isStub: anObject [

	<generated>
	isStub := anObject

]
