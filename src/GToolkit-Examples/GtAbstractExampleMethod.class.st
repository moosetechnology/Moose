"
I encapsulate a method that provides functionality for a GtExample and needs to be store within the example object. 

Users need to indicate the class and selector identifying the method. I support both methods on the class and on the inside side.
To locate the actual method I use a ==GtExampleMethodResolver==.
"
Class {
	#name : #GtAbstractExampleMethod,
	#superclass : #GtExampleAspect,
	#instVars : [
		'methodClassName',
		'methodClass',
		'meta',
		'selector'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #'instance creation' }
GtAbstractExampleMethod class >> fromClass: aClass selector: aSelector [
	^ self new 
		methodClass: aClass;
		methodClassName: aClass name;
		meta: aClass isMeta;
		selector: aSelector;
		yourself
]

{ #category : #'instance creation' }
GtAbstractExampleMethod class >> fromClassNamed: aString selector: aSelector [
	^ self new 
		methodClass: nil;
		methodClassName: aString asString;
		meta: false;
		selector: aSelector;
		yourself
]

{ #category : #testing }
GtAbstractExampleMethod class >> isAbstract [
	^ self == GtAbstractExampleMethod
]

{ #category : #comparing }
GtAbstractExampleMethod >> = anExampleMethod [
	^ self class = anExampleMethod class 
		and: [ self methodClassName = anExampleMethod methodClassName 
			and: [ self selector = anExampleMethod selector ] ]
]

{ #category : #testing }
GtAbstractExampleMethod >> exists [
	^ self methodClassName notNil
		and: [ self methodClass notNil
			and: [ self methodClass includesSelector: self selector ] ]
]

{ #category : #ui }
GtAbstractExampleMethod >> gtDisplayOn: aStream [
	aStream 
		nextPutAll: self methodClassName asString; 
		nextPutAll: ' >> #'; 
		nextPutAll: self selector asString.
		
	self gtDisplayValidityOn: aStream
]

{ #category : #ui }
GtAbstractExampleMethod >> gtSpotterPreviewIn: aComposite [
	<spotterPreview: 1>
	self exists ifFalse: [ ^ self ].
	
	aComposite pharoMethod
		title: [ self gtDisplayString ]; 
		display: [ :entity | entity method sourceCode ];
		smalltalkClass: [ self method methodClass ];
		entity: self
]

{ #category : #testing }
GtAbstractExampleMethod >> hasLiteralThorough: aLiteral [
	^ self methodClassName = aLiteral 
		or: [ self selector = aLiteral
			or: [ self exists 
				and: [ self method hasLiteralThorough: aLiteral ] ] ]
]

{ #category : #comparing }
GtAbstractExampleMethod >> hash [
	^ (self class hash 
		bitXor: self methodClassName hash)
			bitXor: self selector hash
]

{ #category : #accessing }
GtAbstractExampleMethod >> meta [
	^ meta ifNil: [ meta := false ]
]

{ #category : #accessing }
GtAbstractExampleMethod >> meta: anObject [
	meta := anObject
]

{ #category : #'accessing-dynamic' }
GtAbstractExampleMethod >> method [
	^ self exists 
		ifTrue: [ self methodClass >> self selector ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
GtAbstractExampleMethod >> methodClass [
	^ methodClass ifNil: [ methodClass := self resolveMethodClass ]
		
]

{ #category : #accessing }
GtAbstractExampleMethod >> methodClass: anObject [
	methodClass := anObject
]

{ #category : #accessing }
GtAbstractExampleMethod >> methodClassName [
	^ methodClassName
]

{ #category : #accessing }
GtAbstractExampleMethod >> methodClassName: anObject [
	methodClassName := anObject
]

{ #category : #private }
GtAbstractExampleMethod >> methodClassResolver [
	^ GtExampleMethodResolver new 
		methodClassName: self methodClassName;
		meta: self meta;
		selector: self selector;
		yourself
]

{ #category : #'accessing-dynamic' }
GtAbstractExampleMethod >> provider [ 
	self exists ifFalse: [ ^ nil ].
	^ self methodClass isMeta
		ifTrue: [ self methodClass theNonMetaClass ]
		ifFalse: [ self methodClass theNonMetaClass new ]
]

{ #category : #private }
GtAbstractExampleMethod >> resolveMethodClass [
	" an aspect might reference a class not being present in the system - it has to be resolved again in this case "
	^ self methodClassResolver methodClassDo: [ :class | class ] ifNone: [ nil ]
]

{ #category : #accessing }
GtAbstractExampleMethod >> selector [
	^ selector
]

{ #category : #accessing }
GtAbstractExampleMethod >> selector: anObject [
	selector := anObject
]
