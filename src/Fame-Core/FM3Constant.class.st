Class {
	#name : #FM3Constant,
	#superclass : #FM3Class,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Fame-Core'
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

{ #category : #initialization }
FM3Constant >> initialize [
	super initialize.
	self name: self class constantName
]
