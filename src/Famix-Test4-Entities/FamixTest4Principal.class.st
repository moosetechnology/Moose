Class {
	#name : #FamixTest4Principal,
	#superclass : #FamixTest4Person,
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #principal'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Principal class >> annotation [

	<MSEClass: #Principal super: #FamixTest4Person>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest4Principal class >> requirements [

	<generated>
	^ { FamixTest4School }
]

{ #category : #accessing }
FamixTest4Principal >> belongsTo [

	<generated>
	^ self school

]

{ #category : #accessing }
FamixTest4Principal >> belongsTo: anObject [

	<generated>
	self school: anObject

]

{ #category : #accessing }
FamixTest4Principal >> school [
	"Relation named: #school type: #FamixTest4School opposite: #principal"

	<generated>
	<container>
	^ school
]

{ #category : #accessing }
FamixTest4Principal >> school: anObject [

	<generated>
	school := anObject

]

{ #category : #navigation }
FamixTest4Principal >> schoolGroup [
	<generated>
	<navigation: 'School'>
	^ MooseGroup with: self school
]
