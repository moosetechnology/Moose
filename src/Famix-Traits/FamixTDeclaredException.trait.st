"
This is an exception explicitly declared as being thrown by a method.
"
Trait {
	#name : #FamixTDeclaredException,
	#instVars : [
		'#definingEntity => FMOne type: #FamixTWithDeclaredExceptions opposite: #declaredExceptions'
	],
	#category : #'Famix-Traits-DeclaredException'
}

{ #category : #meta }
FamixTDeclaredException classSide >> annotation [

	<MSEClass: #TDeclaredException super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTDeclaredException classSide >> generatedSlotNames [
	<generated>
	'FamixTDeclaredException class>>#generatedSlotNames'.
	^ #(definingEntity)
]

{ #category : #generator }
FamixTDeclaredException classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTDeclaredException >> definingEntity [

	<generated>
	^ definingEntity
]

{ #category : #accessing }
FamixTDeclaredException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject

]
