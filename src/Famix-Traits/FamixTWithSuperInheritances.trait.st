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
	<package: #'Famix-Traits'>
	<generated>
	^self
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
	"Relation named: #subInheritances type: #FamixTSuperInheritance opposite: #superclass"

	<generated>
	<MSEComment: 'Subinheritance relationships, i.e. known subclasses of this type.'>
	^ subInheritances
]

{ #category : #accessing }
FamixTWithSuperInheritances >> subInheritances: anObject [

	<generated>
	subInheritances value: anObject

]
