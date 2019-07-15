Class {
	#name : #FMFutureElement,
	#superclass : #Object,
	#instVars : [
		'instance',
		'current',
		'metaDescription',
		'owner'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMFutureElement class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #parsing }
FMFutureElement >> beginAttribute: aString [
	current isNil should beTrue.
	current := FMFutureAttribute with: self name: aString
]

{ #category : #accessing }
FMFutureElement >> current [
	^current
]

{ #category : #accessing }
FMFutureElement >> description [
	^ metaDescription
]

{ #category : #parsing }
FMFutureElement >> endAttribute: aString [ 
	
	current endAttribute: aString.
	current := nil.
]

{ #category : #accessing }
FMFutureElement >> instance [
	
	^instance
]

{ #category : #accessing }
FMFutureElement >> metaDescription [
	^ metaDescription
]

{ #category : #accessing }
FMFutureElement >> owner [
	^owner
]

{ #category : #parsing }
FMFutureElement >> serial: serial [ 
	
	owner assign: instance to: serial
]

{ #category : #'initialize-release' }
FMFutureElement >> with: anImporter name: aString [ 
	owner := anImporter.
	metaDescription := owner metamodel elementNamed: aString.
	instance := metaDescription createInstance
]
