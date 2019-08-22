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

{ #category : #meta }
FamixTest4Student class >> requirements [

	<generated>
	^ { FamixTest4School }
]

{ #category : #adding }
FamixTest4Student >> addTeachers: anObject [
	<generated>
	^ self teachers add: anObject
]

{ #category : #accessing }
FamixTest4Student >> belongsTo [

	<generated>
	^ self school

]

{ #category : #accessing }
FamixTest4Student >> belongsTo: anObject [

	<generated>
	self school: anObject

]

{ #category : #accessing }
FamixTest4Student >> school [
	"Relation named: #school type: #FamixTest4School opposite: #students"

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
	^ MooseGroup with: self school
]

{ #category : #accessing }
FamixTest4Student >> teachers [
	"Relation named: #teachers type: #FamixTest4Teacher opposite: #students"

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
	^ MooseGroup withAll: self teachers asSet
]
