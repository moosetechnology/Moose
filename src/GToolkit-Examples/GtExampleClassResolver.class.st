"
I create a class aspect based on the name of a class. I am used by an example when the name of the class is indicated through a pragma.
"
Class {
	#name : #GtExampleClassResolver,
	#superclass : #GtExampleAspectResolver,
	#instVars : [
		'theClassName'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #actions }
GtExampleClassResolver class >> resolve: anAspectClass example: anExample className: aClassOrString meta: meta [
	^ (self new 
		aspectClass: anAspectClass;
		example: anExample;
		theClassName: aClassOrString;
		meta: meta;
		yourself) resolve
]

{ #category : #actions }
GtExampleClassResolver >> resolve [
	^ self theClassDo: [ :class | self resolveByClass: class ]
		ifNone: [ self resolveByName ]
]

{ #category : #private }
GtExampleClassResolver >> resolveByClass: aClass [
	^ self aspectClass new
		theClass: aClass;
		theClassName: aClass name;
		meta: aClass isMeta;
		yourself
]

{ #category : #private }
GtExampleClassResolver >> resolveByName [
	^ self aspectClass new
		theClass: nil;
		theClassName: self theClassName;
		meta: self meta;
		yourself
]

{ #category : #private }
GtExampleClassResolver >> theClass [
	^ self theClassName isClass 
		ifTrue: [ self theClassName ]
		ifFalse: [ Smalltalk classNamed: self theClassName asString ]
]

{ #category : #private }
GtExampleClassResolver >> theClassDo: aBlock [
	^ self theClassDo: aBlock ifNone: [ 
		(GtExampleDeclaredClassMissing new
			example: self example;
			classNamed: self theClassName;
			meta: self meta;
			yourself) signal ]
]

{ #category : #private }
GtExampleClassResolver >> theClassDo: aBlock1 ifNone: aBlock2 [
	^ self theClass
		ifNotNil: [ :class | aBlock1 value: (self ensureClass: class) ]
		ifNil: aBlock2
	
]

{ #category : #accessing }
GtExampleClassResolver >> theClassName [
	^ theClassName
]

{ #category : #accessing }
GtExampleClassResolver >> theClassName: anObject [
	theClassName := anObject
]
