Class {
	#name : #FamixTest4Room,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #rooms'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Room class >> annotation [

	<FMClass: #Room super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTest4Room >> school [
	"Relation named: #school type: #FamixTest4School opposite: #rooms"

	<generated>
	<container>
	^ school
]

{ #category : #accessing }
FamixTest4Room >> school: anObject [

	<generated>
	school := anObject
]

{ #category : #navigation }
FamixTest4Room >> schoolGroup [
	<generated>
	<navigation: 'School'>
	^ MooseGroup with: self school
]
