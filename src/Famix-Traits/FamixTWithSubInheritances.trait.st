Trait {
	#name : #FamixTWithSubInheritances,
	#instVars : [
		'#superInheritances => FMMany type: #FamixTSubInheritance opposite: #subclass'
	],
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTWithSubInheritances classSide >> annotation [

	<MSEClass: #TWithSubInheritances super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #accessing }
FamixTWithSubInheritances >> addSuperInheritance: anInheritance [ 
	superInheritances add: anInheritance
]

{ #category : #accessing }
FamixTWithSubInheritances >> superInheritances [

	<generated>
	<MSEComment: 'Superinheritance relationships, i.e. known superclasses of this type.'>
	^ superInheritances
]

{ #category : #accessing }
FamixTWithSubInheritances >> superInheritances: anObject [

	<generated>
	superInheritances value: anObject

]
