Class {
	#name : #FamixTest4Teacher,
	#superclass : #FamixTest4Person,
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #teachers',
		'#students => FMMany type: #FamixTest4Student opposite: #teachers'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Teacher class >> annotation [

	<MSEClass: #Teacher super: #FamixTest4Person>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4Teacher class >> generatedSlotNames [
	<generated>
	'FamixTest4Teacher class>>#generatedSlotNames'.
	^ #(school students)
]

{ #category : #generator }
FamixTest4Teacher class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4Teacher class >> requirements [

	<generated>
	^ { FamixTest4School }
]

{ #category : #accessing }
FamixTest4Teacher >> school [

	<generated>
	<container>

	^ school
]

{ #category : #accessing }
FamixTest4Teacher >> school: anObject [

	<generated>
	school := anObject

]

{ #category : #navigation }
FamixTest4Teacher >> schoolGroup [

	<generated>
	<navigation: 'School'>
	^ MooseGroup
			with: (self school)
]

{ #category : #accessing }
FamixTest4Teacher >> students [

	<generated>
	^ students
]

{ #category : #accessing }
FamixTest4Teacher >> students: anObject [

	<generated>
	students value: anObject

]

{ #category : #navigation }
FamixTest4Teacher >> studentsGroup [

	<generated>
	<navigation: 'Students'>
	^ MooseGroup
			withAll: (self students asSet)
]
