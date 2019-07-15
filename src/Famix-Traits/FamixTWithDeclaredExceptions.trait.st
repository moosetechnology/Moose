Trait {
	#name : #FamixTWithDeclaredExceptions,
	#instVars : [
		'#declaredExceptions => FMMany type: #FamixTDeclaredException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-DeclaredException'
}

{ #category : #meta }
FamixTWithDeclaredExceptions classSide >> annotation [

	<MSEClass: #TWithDeclaredExceptions super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithDeclaredExceptions classSide >> generatedSlotNames [
	<generated>
	'FamixTWithDeclaredExceptions class>>#generatedSlotNames'.
	^ #(declaredExceptions)
]

{ #category : #generator }
FamixTWithDeclaredExceptions classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithDeclaredExceptions >> declaredExceptions [

	<generated>
	<MSEComment: 'The exceptions declared by the method'>
	^ declaredExceptions
]

{ #category : #accessing }
FamixTWithDeclaredExceptions >> declaredExceptions: anObject [

	<generated>
	declaredExceptions value: anObject

]
