Trait {
	#name : #FamixTPossibleStub,
	#instVars : [
		'isStub'
	],
	#category : #'Famix-Traits-Utility'
}

{ #category : #meta }
FamixTPossibleStub classSide >> annotation [

	<MSEClass: #TPossibleStub super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTPossibleStub classSide >> generatedSlotNames [
	<generated>
	'FamixTPossibleStub class>>#generatedSlotNames'.
	^ #(isStub)
]

{ #category : #generator }
FamixTPossibleStub classSide >> generatedTraitNames [
	<generated>
	^ #()
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
