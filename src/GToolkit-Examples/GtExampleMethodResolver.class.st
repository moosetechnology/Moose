"
I create a method aspect based on the name of the selector and the name of its class. I am used by an example when the name of the class and the selector are indicated through a pragma.
"
Class {
	#name : #GtExampleMethodResolver,
	#superclass : #GtExampleAspectResolver,
	#instVars : [
		'methodClassName',
		'selector'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #actions }
GtExampleMethodResolver class >> resolve: anAspectClass example: anExample className: aClassOrString meta: meta selector: aStringOrSelector [
	^ (self new 
		aspectClass: anAspectClass;
		example: anExample;
		methodClassName: aClassOrString;
		meta: meta;
		selector: aStringOrSelector;
		yourself) resolve
]

{ #category : #actions }
GtExampleMethodResolver class >> resolve: anAspectClass example: anExample selector: aStringOrSelector [
	^ (self new 
		aspectClass: anAspectClass;
		example: anExample;
		methodClassName: anExample methodClass;
		meta: anExample methodClass isMeta;
		selector: aStringOrSelector;
		yourself) resolve
]

{ #category : #private }
GtExampleMethodResolver >> methodClass [
	^ self methodClassName isClass 
		ifTrue: [ self methodClassName ]
		ifFalse: [ Smalltalk classNamed: self methodClassName asString ]
]

{ #category : #private }
GtExampleMethodResolver >> methodClassDo: aBlock [
	^ self methodClassDo: aBlock ifNone: [ 
		(GtExampleDeclaredClassMissing new
			example: self example;
			classNamed: self methodClassName;
			meta: self meta;
			yourself) signal ]
]

{ #category : #private }
GtExampleMethodResolver >> methodClassDo: aBlock1 ifNone: aBlock2 [
	^ self methodClass
		ifNotNil: [ :class | aBlock1 value: (self ensureClass: class) ]
		ifNil: aBlock2
	
]

{ #category : #accessing }
GtExampleMethodResolver >> methodClassName [
	^ methodClassName
]

{ #category : #accessing }
GtExampleMethodResolver >> methodClassName: anObject [
	methodClassName := anObject
]

{ #category : #actions }
GtExampleMethodResolver >> resolve [
	^ self methodClassDo: [ :class | self resolveByClass: class ] 
		ifNone: [ self resolveByName ]
]

{ #category : #private }
GtExampleMethodResolver >> resolveByClass: aClass [
	^ self aspectClass new
		methodClass: aClass;
		methodClassName: aClass name;
		meta: aClass isMeta;
		selector: self selector asSymbol;
		yourself
]

{ #category : #private }
GtExampleMethodResolver >> resolveByName [
	^ self aspectClass new
		methodClass: nil;
		methodClassName: self methodClassName asSymbol;
		meta: self meta;
		selector: self selector asSymbol;
		yourself
]

{ #category : #accessing }
GtExampleMethodResolver >> selector [
	^ selector
]

{ #category : #accessing }
GtExampleMethodResolver >> selector: anObject [
	selector := anObject
]
