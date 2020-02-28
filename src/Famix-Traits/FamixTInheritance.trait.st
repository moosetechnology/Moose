Trait {
	#name : #FamixTInheritance,
	#instVars : [
		'#subclass => FMOne type: #FamixTWithInheritances opposite: #superInheritances',
		'#superclass => FMOne type: #FamixTWithInheritances opposite: #subInheritances'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTInheritance classSide >> annotation [

	<FMClass: #TInheritance super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTInheritance >> isInheritance [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTInheritance >> source [
	^ self subclass
]

{ #category : #accessing }
FamixTInheritance >> source: aSubclass [
	self subclass: aSubclass
]

{ #category : #accessing }
FamixTInheritance >> subclass [
	"Relation named: #subclass type: #FamixTWithInheritances opposite: #superInheritances"

	<generated>
	<FMComment: 'Subclass linked to in this relationship. from-side of the association'>
	<source>
	^ subclass
]

{ #category : #accessing }
FamixTInheritance >> subclass: anObject [

	<generated>
	subclass := anObject
]

{ #category : #accessing }
FamixTInheritance >> superclass [
	"Relation named: #superclass type: #FamixTWithInheritances opposite: #subInheritances"

	<generated>
	<FMComment: 'Superclass linked to in this relationship. to-side of the association'>
	<target>
	^ superclass
]

{ #category : #accessing }
FamixTInheritance >> superclass: anObject [

	<generated>
	superclass := anObject
]

{ #category : #accessing }
FamixTInheritance >> target [
	^ self superclass
]

{ #category : #accessing }
FamixTInheritance >> target: aSuperclass [
	self superclass: aSuperclass
]
