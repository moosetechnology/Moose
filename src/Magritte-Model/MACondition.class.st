Class {
	#name : #MACondition,
	#superclass : #MAObject,
	#category : #'Magritte-Model-Utility'
}

{ #category : #testing }
MACondition class >> isAbstract [
	^ self name = #MACondition
]

{ #category : #convenience }
MACondition class >> receiver: anObject selector: aSelector [
	^ self receiver: anObject selector: aSelector arguments: #(nil) index: 1
]

{ #category : #'instance creation' }
MACondition class >> receiver: anObject selector: aSelector arguments: anArray index: anInteger [
	(aSelector numArgs = anArray size)
		ifFalse: [ self error: 'Invalid number of arguments.' ].
	(anInteger between: 0 and: anArray size)
		ifFalse: [ self error: 'Index out of bounds.' ].
	^ MAPluggableCondition new 
		initializeReceiver: anObject
		selector: aSelector
		arguments: anArray
		index: anInteger
]

{ #category : #convenience }
MACondition class >> selector: aSelector [
	^ self receiver: nil selector: aSelector arguments: #() index: 0
]

{ #category : #convenience }
MACondition class >> selector: aSelector argument: anObject [
	^ self receiver: nil selector: aSelector arguments: (Array with: anObject) index: 0
]

{ #category : #operators }
MACondition >> & aCondition [ 
	^ MAConjunctiveCondition new & self & aCondition
]

{ #category : #operators }
MACondition >> not [
	^ MANegationCondition with: self
]

{ #category : #accessing }
MACondition >> numArgs [
	^ 1
]

{ #category : #evaluating }
MACondition >> value: anObject [
	self subclassResponsibility
]

{ #category : #operators }
MACondition >> | aCondition [ 
	^ (self not & aCondition not) not
]
