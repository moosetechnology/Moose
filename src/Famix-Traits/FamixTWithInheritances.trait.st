Trait {
	#name : #FamixTWithInheritances,
	#instVars : [
		'#superInheritances => FMMany type: #FamixTInheritance opposite: #subclass',
		'#subInheritances => FMMany type: #FamixTInheritance opposite: #superclass'
	],
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTWithInheritances classSide >> annotation [

	<FMClass: #TWithInheritances super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithInheritances >> addSubInheritance: anInheritance [ 
	subInheritances add: anInheritance
]

{ #category : #accessing }
FamixTWithInheritances >> addSuperInheritance: anInheritance [ 
	superInheritances add: anInheritance
]

{ #category : #metrics }
FamixTWithInheritances >> numberOfSubclasses [
	<FMProperty: #numberOfSubclasses type: #Number>
	<derived>
	<FMComment: 'The number of subclasses of a class'>
	^ self lookUpPropertyNamed: #numberOfSubclasses computedAs: [ self subInheritances size ]
]

{ #category : #metrics }
FamixTWithInheritances >> numberOfSubclasses: aNumber [

	self privateState propertyAt: #numberOfSubclasses put: aNumber
]

{ #category : #accessing }
FamixTWithInheritances >> subInheritances [
	"Relation named: #subInheritances type: #FamixTInheritance opposite: #superclass"

	<generated>
	<FMComment: 'Subinheritance relationships, i.e. known subclasses of this type.'>
	<derived>
	^ subInheritances
]

{ #category : #accessing }
FamixTWithInheritances >> subInheritances: anObject [

	<generated>
	subInheritances value: anObject
]

{ #category : #accessing }
FamixTWithInheritances >> superInheritances [
	"Relation named: #superInheritances type: #FamixTInheritance opposite: #subclass"

	<generated>
	<FMComment: 'Superinheritance relationships, i.e. known superclasses of this type.'>
	<derived>
	^ superInheritances
]

{ #category : #accessing }
FamixTWithInheritances >> superInheritances: anObject [

	<generated>
	superInheritances value: anObject
]
