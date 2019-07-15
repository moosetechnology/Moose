"
This offers support for a do it context.

Example:
context := GLMContext withAll: {#a -> 1 . #b -> 2}.
Compiler new evaluate: 'a + b' in: context to: context
"
Class {
	#name : #GLMDoItContext,
	#superclass : #Object,
	#instVars : [
		'variableBindings'
	],
	#category : #'Glamour-Tools'
}

{ #category : #'instance creation' }
GLMDoItContext class >> with: aBinding withAll: aCollectionOfBindings [
	| col |
	col := OrderedCollection with: aBinding.
	col addAll: aCollectionOfBindings.
	^ self withAll: col
]

{ #category : #'instance creation' }
GLMDoItContext class >> withAll: aCollectionOfBindings [
	^ self new variableBindings: (aCollectionOfBindings inject: Dictionary new into: [:dict :each | dict at: each key put: each value. dict])
]

{ #category : #bindings }
GLMDoItContext >> bindingOf: aKey [
	^ self variableBindings at: #aKey ifAbsent: [nil]
]

{ #category : #bindings }
GLMDoItContext >> method [ 
	^ GLMDoItContext >> #method
]

{ #category : #bindings }
GLMDoItContext >> namedTempAt: index [
	^ self variableBindings at: (self tempNames at: index)
]

{ #category : #bindings }
GLMDoItContext >> tempNames [
	^ self variableBindings keys asSortedCollection
]

{ #category : #accessing }
GLMDoItContext >> variableBindings [
	^ variableBindings
]

{ #category : #accessing }
GLMDoItContext >> variableBindings: anObject [
	variableBindings := anObject
]
