"
Description
--------------------

I am an abstract class representing a constant class. 

A contant class is a class that will have an unique instance in all Fame metamodels. 
In the current implementation I allow 4 constants:
- Object: A constant representing the root superclass of all FM3Class.
- String
- Number
- Boolean

Each of my concrete subclass are holding one of their instance as a singleton.

I also provide some utilities on my class side.
	
Public API and Key Messages
--------------------

- class>>#instance 		Each of my concrete subclasses can return their unique instance via this method.

Examples
--------------------

	FM3Constant constants.
	
	FM3Constant constantsDo: [ :const | const name traceCr ].
	

Internal Representation and Key Implementation Points.
--------------------

	I am using a Singletong design pattern. In order to do that I have a `uniqueInstance` class instance variable.
	
	It is really important that this variable is a class instance variable and not a class variable because each of my subclasses should have their own unique instance.

"
Class {
	#name : #FM3Constant,
	#superclass : #FM3Class,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Fame-Core-Model'
}

{ #category : #accessing }
FM3Constant class >> constantClasses [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #accessing }
FM3Constant class >> constantName [
	^ self subclassResponsibility
]

{ #category : #accessing }
FM3Constant class >> constants [
	^ self constantClasses collect: #instance
]

{ #category : #constants }
FM3Constant class >> constantsDo: aBlock [
	self constants do: [ :const | aBlock value: const ]
]

{ #category : #accessing }
FM3Constant class >> instance [
	^ uniqueInstance ifNil: [ uniqueInstance := self newInstance ]
]

{ #category : #testing }
FM3Constant class >> isAbstract [
	^ self = FM3Constant
]

{ #category : #'instance creation' }
FM3Constant class >> new [
	self error: 'You should access constants via the #instance methods because constants are singletons.'
]

{ #category : #'instance creation' }
FM3Constant class >> newInstance [
	self isAbstract ifTrue: [ self error: 'Cannot instantiate abstract constants.' ].
	^ super new
]

{ #category : #private }
FM3Constant class >> privateOnlyCallMeIfYourAreBDFLOrSystemAdminFromHellFlush [
	<script>
	self constantClasses do: #reset
]

{ #category : #initialization }
FM3Constant class >> reset [
	uniqueInstance := nil
]

{ #category : #visiting }
FM3Constant >> accept: aVisitor [
	aVisitor visitConstant: self
]

{ #category : #initialization }
FM3Constant >> initialize [
	super initialize.
	self name: self class constantName
]

{ #category : #testing }
FM3Constant >> isConstant [
	^ true
]
