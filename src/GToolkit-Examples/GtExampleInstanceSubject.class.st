"
I indicate that the subject of an example is an object. I am the default subject of an example. Other kinds of subjects should be used to inducate a particular type of object like a class or method.
"
Class {
	#name : #GtExampleInstanceSubject,
	#superclass : #GtExampleSubject,
	#instVars : [
		'instance'
	],
	#category : #'GToolkit-Examples-Subjects'
}

{ #category : #'instance creation' }
GtExampleInstanceSubject class >> fromObject: anObject [
	^ self new 
		instance: anObject;
		yourself
]

{ #category : #comparing }
GtExampleInstanceSubject >> = anExampleSubject [
	^ self class = anExampleSubject class
		and: [ self instance = anExampleSubject instance ]
]

{ #category : #testing }
GtExampleInstanceSubject >> exists [
	^ self theClass notNil
]

{ #category : #ui }
GtExampleInstanceSubject >> gtDisplayOn: aStream [
	self instance gtDisplayOn: aStream.
	self gtDisplayValidityOn: aStream
]

{ #category : #testing }
GtExampleInstanceSubject >> hasLiteralThorough: aLiteral [
	^ self exists
		and: [ self theClass methods anySatisfy: [ :method | 
			method selector = aLiteral
				or: [ 	method hasLiteralThorough: aLiteral ] ] ]
]

{ #category : #comparing }
GtExampleInstanceSubject >> hash [
	^ self class hash
		bitXor: self instance hash
]

{ #category : #accessing }
GtExampleInstanceSubject >> instance [
	^ instance
]

{ #category : #accessing }
GtExampleInstanceSubject >> instance: anObject [
	instance := anObject
]

{ #category : #'accessing-dynamic' }
GtExampleInstanceSubject >> theClass [
	^ self instance class
]
