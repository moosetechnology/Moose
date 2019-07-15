"
SmaCCCompositeAction is an abstract class that represents multiple actions. 

Subclasses must implement the following messages:
	accessing
		errorType
		preferredAction

Instance Variables:
	actions	<Collection of: SmaCCAction>	all valid non-reject actions


"
Class {
	#name : #SmaCCCompositeAction,
	#superclass : #SmaCCAction,
	#instVars : [
		'actions'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'accessing-actions' }
SmaCCCompositeAction >> actions [
	^ actions
]

{ #category : #'accessing-actions' }
SmaCCCompositeAction >> addAction: aSmaCCAction [
	actions add: aSmaCCAction
]

{ #category : #'accessing-actions' }
SmaCCCompositeAction >> addActions: aSmaCCActionCollection [
	actions addAll: aSmaCCActionCollection
]

{ #category : #'error handling' }
SmaCCCompositeAction >> errorType [
	self subclassResponsibility
]

{ #category : #accessing }
SmaCCCompositeAction >> id [
	^ self preferredAction id
]

{ #category : #'initialize-release' }
SmaCCCompositeAction >> initialize [
	super initialize.
	actions := OrderedCollection new
]

{ #category : #accessing }
SmaCCCompositeAction >> lr1Item [
	^ self preferredAction lr1Item
]

{ #category : #accessing }
SmaCCCompositeAction >> preferredAction [
	self subclassResponsibility
]

{ #category : #printing }
SmaCCCompositeAction >> printPathOn: aStream [
	self lr1Item path
		do: [ :each | aStream nextPutAll: each name ]
		separatedBy: [ aStream space ]
]

{ #category : #'error handling' }
SmaCCCompositeAction >> raiseXReduceNotification [
	| stream |
	stream := WriteStream with: String new.
	actions
		do:
			[ :each | 
			stream nextPutAll: each lr1Item printString.
			each == self preferredAction
				ifTrue: [ stream nextPutAll: '	*****' ].
			stream cr ].
	stream cr.
	self printPathOn: stream.
	SmaCCCompilationNotification new
		messageText: self errorType;
		tag: stream contents;
		signal
]

{ #category : #'error handling' }
SmaCCCompositeAction >> signalAllWarnings [
	self raiseXReduceNotification
]
