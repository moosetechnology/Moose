"
I am responsible for holding the version of Moose loaded in the image
"
Class {
	#name : #MooseVersion,
	#superclass : #Object,
	#instVars : [
		'major',
		'minor',
		'patch',
		'commitHash'
	],
	#classInstVars : [
		'current'
	],
	#category : #'Moose-Help'
}

{ #category : #accessing }
MooseVersion class >> current [
	^current ifNil: [ current := self new ]
]

{ #category : #accessing }
MooseVersion >> commitHash [

	^ commitHash
]

{ #category : #accessing }
MooseVersion >> commitHash: anObject [

	commitHash := anObject
]

{ #category : #initialization }
MooseVersion >> initialize [
	super initialize.
	commitHash := '#0000'.
	major := '11'.
	minor := '0'.
	patch := '0'
]

{ #category : #accessing }
MooseVersion >> major [

	^ major
]

{ #category : #accessing }
MooseVersion >> major: anObject [

	major := anObject
]

{ #category : #accessing }
MooseVersion >> minor [

	^ minor
]

{ #category : #accessing }
MooseVersion >> minor: anObject [

	minor := anObject
]

{ #category : #accessing }
MooseVersion >> patch [

	^ patch
]

{ #category : #accessing }
MooseVersion >> patch: anObject [

	patch := anObject
]

{ #category : #accessing }
MooseVersion >> versionNumber [
	^{major . minor . patch } joinUsing: '.'
]
