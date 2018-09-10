Trait {
	#name : #FamixTWithSuperInheritances,
	#instVars : [
		'#subInheritances => FMMany type: #FamixTSuperInheritance opposite: #superclass'
	],
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTWithSuperInheritances classSide >> annotation [

	<MSEClass: #TWithSuperInheritances super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithSuperInheritances classSide >> generatedSlotNames [
	<generated>
	'FamixTWithSuperInheritances class>>#generatedSlotNames'.
	^ #(subInheritances)
]

{ #category : #generator }
FamixTWithSuperInheritances classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithSuperInheritances >> addSubInheritance: anInheritance [ 
	subInheritances add: anInheritance
]

{ #category : #metrics }
FamixTWithSuperInheritances >> numberOfSubclasses [
	<MSEProperty: #numberOfSubclasses type: #Number>
	<derived>
	<MSEComment: 'The number of subclasses of a class'>
	^ self lookUpPropertyNamed: #numberOfSubclasses computedAs: [ self subInheritances size ]
]

{ #category : #metrics }
FamixTWithSuperInheritances >> numberOfSubclasses: aNumber [

	self privateState propertyAt: #numberOfSubclasses put: aNumber
]

{ #category : #accessing }
FamixTWithSuperInheritances >> subInheritances [

	<generated>
	<MSEComment: 'Subinheritance relationships, i.e. known subclasses of this type.'>
	^ subInheritances
]

{ #category : #accessing }
FamixTWithSuperInheritances >> subInheritances: anObject [

	<generated>
	subInheritances value: anObject

]
