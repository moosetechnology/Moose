Class {
	#name : #FMDanglingReference,
	#superclass : #Object,
	#instVars : [
		'owner',
		'position'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMDanglingReference class >> with: aFutureAttribute [
	^ self new
		owner: aFutureAttribute;
		yourself
]

{ #category : #'initialize-release' }
FMDanglingReference >> owner: aFutureAttribute [
	owner := aFutureAttribute.
	owner count: owner count + 1.
	position := owner values size + 1
]

{ #category : #parsing }
FMDanglingReference >> resolve: element [
	self assert: element isNotNil.
	owner values at: position put: element.
	owner count: owner count - 1.
	owner maybeEnd
]
