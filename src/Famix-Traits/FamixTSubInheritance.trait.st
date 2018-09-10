Trait {
	#name : #FamixTSubInheritance,
	#instVars : [
		'#subclass => FMOne type: #FamixTWithSubInheritances opposite: #superInheritances'
	],
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTSubInheritance classSide >> annotation [

	<MSEClass: #TSubInheritance super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTSubInheritance classSide >> generatedSlotNames [
	<generated>
	'FamixTSubInheritance class>>#generatedSlotNames'.
	^ #(subclass)
]

{ #category : #generator }
FamixTSubInheritance classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTSubInheritance >> from [
	^ self subclass 
]

{ #category : #accessing }
FamixTSubInheritance >> from: aSubclass [
	self subclass: aSubclass 
]

{ #category : #testing }
FamixTSubInheritance >> isInheritance [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTSubInheritance >> subclass [

	<generated>
	<MSEComment: 'Subclass linked to in this relationship. from-side of the association'>
	<source>

	^ subclass
]

{ #category : #accessing }
FamixTSubInheritance >> subclass: anObject [

	<generated>
	subclass := anObject

]
