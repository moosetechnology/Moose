"
I describe a class subject of an example.
"
Class {
	#name : #GtExampleClassSubject,
	#superclass : #GtExampleSubject,
	#instVars : [
		'theClassName',
		'theClass',
		'meta'
	],
	#category : #'GToolkit-Examples-Subjects'
}

{ #category : #'instance creation' }
GtExampleClassSubject class >> fromClass: aClass [
	^ self new 
		theClass: aClass;
		theClassName: aClass name;
		meta: aClass isMeta;
		yourself
]

{ #category : #'instance creation' }
GtExampleClassSubject class >> fromClassNamed: aString [
	^ self new 
		theClass: nil;
		theClassName: aString asString;
		meta: false;
		yourself
]

{ #category : #'instance creation' }
GtExampleClassSubject class >> fromMetaClassNamed: aString [
	^ self new 
		theClass: nil;
		theClassName: aString asString;
		meta: true;
		yourself
]

{ #category : #comparing }
GtExampleClassSubject >> = anExampleSubject [
	^ self class = anExampleSubject class
		and: [ self theClassName = anExampleSubject theClassName ]
]

{ #category : #private }
GtExampleClassSubject >> classResolverClass [
	^ GtExampleClassResolver new 
		theClassName: self theClassName;
		meta: self meta;
		yourself
]

{ #category : #testing }
GtExampleClassSubject >> exists [
	^ self theClass notNil
]

{ #category : #ui }
GtExampleClassSubject >> gtDisplayOn: aStream [
	self theClassName gtDisplayOn: aStream.
	self gtDisplayValidityOn: aStream
]

{ #category : #testing }
GtExampleClassSubject >> hasLiteralThorough: aLiteral [
	^ self theClassName = aLiteral
		or: [ self exists 
			and: [ self theClass = aLiteral ] ]
]

{ #category : #comparing }
GtExampleClassSubject >> hash [
	^ self class hash
		bitXor: self theClassName hash
]

{ #category : #accessing }
GtExampleClassSubject >> meta [
	^ meta
]

{ #category : #accessing }
GtExampleClassSubject >> meta: anObject [
	meta := anObject
]

{ #category : #private }
GtExampleClassSubject >> resolveClass [
	" an aspect might reference a class not being present in the system - it has to be resolved again in this case "
	^ self classResolverClass theClassDo: [ :class | class ] ifNone: [ nil ]
]

{ #category : #accessing }
GtExampleClassSubject >> theClass [
	^ theClass ifNil: [ theClass := self resolveClass ]
		
]

{ #category : #accessing }
GtExampleClassSubject >> theClass: anObject [
	anObject ifNotNil: [ self theClassName: anObject name ].
	theClass := anObject.
	
]

{ #category : #accessing }
GtExampleClassSubject >> theClassName [
	^ theClassName
]

{ #category : #accessing }
GtExampleClassSubject >> theClassName: anObject [
	theClassName := anObject
]
