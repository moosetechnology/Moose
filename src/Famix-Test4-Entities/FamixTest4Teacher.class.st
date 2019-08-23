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

{ #category : #meta }
FamixTest4Teacher class >> requirements [

	<generated>
	^ { FamixTest4School }
]

{ #category : #adding }
FamixTest4Teacher >> addStudents: anObject [
	<generated>
	^ self students add: anObject
]

{ #category : #accessing }
FamixTest4Teacher >> belongsTo [

	<generated>
	^ self school

]

{ #category : #accessing }
FamixTest4Teacher >> belongsTo: anObject [

	<generated>
	self school: anObject

]

{ #category : #accessing }
FamixTest4Teacher >> school [
	"Relation named: #school type: #FamixTest4School opposite: #teachers"

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
	^ MooseGroup with: self school
]

{ #category : #accessing }
FamixTest4Teacher >> students [
	"Relation named: #students type: #FamixTest4Student opposite: #teachers"

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
	^ MooseGroup withAll: self students asSet
]
