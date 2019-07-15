"
MTLFamePropertyAccessor is a Magritte accessor that is meant to work with a FameProperty. That is instead of writing / reading to and from an object, it does it through the FameProperty.

Instance Variables:
	fameProperty	<Object>
"
Class {
	#name : #MTLFamePropertyAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'fameProperty'
	],
	#category : #'Metanool-Core'
}

{ #category : #'instance creation' }
MTLFamePropertyAccessor class >> fameProperty: aFameProperty [
	^ self new 
			fameProperty: aFameProperty;
			yourself
]

{ #category : #testing }
MTLFamePropertyAccessor class >> isAbstract [
	^ false
]

{ #category : #comparing }
MTLFamePropertyAccessor >> = anObject [
	^ super = anObject
		and: [ self fameProperty = anObject fameProperty ]
]

{ #category : #accessing }
MTLFamePropertyAccessor >> fameProperty [
	^ fameProperty
]

{ #category : #accessing }
MTLFamePropertyAccessor >> fameProperty: anObject [
	fameProperty := anObject
]

{ #category : #comparing }
MTLFamePropertyAccessor >> hash [
	^  super hash bitXor: (self fameProperty hash bitXor: self fameProperty hash)
]

{ #category : #model }
MTLFamePropertyAccessor >> read: aModel [
	^ aModel mmGetProperty: self fameProperty
]

{ #category : #printing }
MTLFamePropertyAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' property: ';
		store: self fameProperty;
		nextPut: $)
]

{ #category : #model }
MTLFamePropertyAccessor >> write: anObject to: aModel [
	aModel mmSetProperty: self fameProperty to: anObject
]
