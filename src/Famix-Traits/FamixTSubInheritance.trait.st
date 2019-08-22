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
	<package: #'Famix-Traits'>
	<generated>
	^self
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
	"Relation named: #subclass type: #FamixTWithSubInheritances opposite: #superInheritances"

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
