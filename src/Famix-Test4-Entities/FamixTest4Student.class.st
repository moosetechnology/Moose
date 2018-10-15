Class {
	#name : #FamixTest4Student,
	#superclass : #FamixTest4Person,
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #students',
		'#teachers => FMMany type: #FamixTest4Teacher opposite: #students'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Student class >> annotation [

	<MSEClass: #Student super: #FamixTest4Person>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4Student class >> generatedSlotNames [
	<generated>
	'FamixTest4Student class>>#generatedSlotNames'.
	^ #(school teachers)
]

{ #category : #generator }
FamixTest4Student class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4Student class >> requirements [

	<generated>
	^ { FamixTest4School }
]

{ #category : #accessing }
FamixTest4Student >> school [

	<generated>
	<container>

	^ school
]

{ #category : #accessing }
FamixTest4Student >> school: anObject [

	<generated>
	school := anObject

]

{ #category : #navigation }
FamixTest4Student >> schoolGroup [

	<generated>
	<navigation: 'School'>
	^ MooseGroup
			with: (self school)
]

{ #category : #accessing }
FamixTest4Student >> teachers [

	<generated>
	^ teachers
]

{ #category : #accessing }
FamixTest4Student >> teachers: anObject [

	<generated>
	teachers value: anObject

]

{ #category : #navigation }
FamixTest4Student >> teachersGroup [

	<generated>
	<navigation: 'Teachers'>
	^ MooseGroup
			withAll: (self teachers asSet)
]
