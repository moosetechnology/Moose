Trait {
	#name : #FamixTPossibleStub,
	#instVars : [
		'#isStub => FMProperty'
	],
	#category : #'Famix-Traits-Utility'
}

{ #category : #meta }
FamixTPossibleStub classSide >> annotation [

	<FMClass: #TPossibleStub super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTPossibleStub >> isStub [

	<FMProperty: #isStub type: #Boolean>
	<FMComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ false ]
]

{ #category : #accessing }
FamixTPossibleStub >> isStub: anObject [
	<generated>
	isStub := anObject
]
