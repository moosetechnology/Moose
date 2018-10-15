Class {
	#name : #FamixTest4School,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#principal => FMOne type: #FamixTest4Principal opposite: #school',
		'#rooms => FMMany type: #FamixTest4Room opposite: #school',
		'#students => FMMany type: #FamixTest4Student opposite: #school',
		'#teachers => FMMany type: #FamixTest4Teacher opposite: #school'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4School class >> annotation [

	<MSEClass: #School super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4School class >> generatedSlotNames [
	<generated>
	'FamixTest4School class>>#generatedSlotNames'.
	^ #(principal rooms students teachers)
]

{ #category : #generator }
FamixTest4School class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4School class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTest4School >> principal [

	<generated>
	^ principal
]

{ #category : #accessing }
FamixTest4School >> principal: anObject [

	<generated>
	principal := anObject

]

{ #category : #navigation }
FamixTest4School >> principalGroup [

	<generated>
	<navigation: 'Principal'>
	^ MooseGroup
			with: (self principal)
]

{ #category : #accessing }
FamixTest4School >> rooms [

	<generated>
	^ rooms
]

{ #category : #accessing }
FamixTest4School >> rooms: anObject [

	<generated>
	rooms value: anObject

]

{ #category : #navigation }
FamixTest4School >> roomsGroup [

	<generated>
	<navigation: 'Rooms'>
	^ MooseGroup
			withAll: (self rooms asSet)
]

{ #category : #accessing }
FamixTest4School >> students [

	<generated>
	^ students
]

{ #category : #accessing }
FamixTest4School >> students: anObject [

	<generated>
	students value: anObject

]

{ #category : #navigation }
FamixTest4School >> studentsGroup [

	<generated>
	<navigation: 'Students'>
	^ MooseGroup
			withAll: (self students asSet)
]

{ #category : #accessing }
FamixTest4School >> teachers [

	<generated>
	^ teachers
]

{ #category : #accessing }
FamixTest4School >> teachers: anObject [

	<generated>
	teachers value: anObject

]

{ #category : #navigation }
FamixTest4School >> teachersGroup [

	<generated>
	<navigation: 'Teachers'>
	^ MooseGroup
			withAll: (self teachers asSet)
]
