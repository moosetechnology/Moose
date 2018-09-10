Trait {
	#name : #FamixTSuperInheritance,
	#instVars : [
		'#superclass => FMOne type: #FamixTWithSuperInheritances opposite: #subInheritances'
	],
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTSuperInheritance classSide >> annotation [

	<MSEClass: #TSuperInheritance super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTSuperInheritance classSide >> generatedSlotNames [
	<generated>
	'FamixTSuperInheritance class>>#generatedSlotNames'.
	^ #(superclass)
]

{ #category : #generator }
FamixTSuperInheritance classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #testing }
FamixTSuperInheritance >> isInheritance [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTSuperInheritance >> superclass [

	<generated>
	<MSEComment: 'Superclass linked to in this relationship. to-side of the association'>
	<target>

	^ superclass
]

{ #category : #accessing }
FamixTSuperInheritance >> superclass: anObject [

	<generated>
	superclass := anObject

]

{ #category : #accessing }
FamixTSuperInheritance >> to [
	^ self superclass 
]

{ #category : #accessing }
FamixTSuperInheritance >> to: aSuperclass [
	self superclass: aSuperclass
]
