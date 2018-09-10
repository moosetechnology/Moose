Class {
	#name : #PPJavaWhitespaceParser,
	#superclass : #PP2Node,
	#classInstVars : [
		'instance'
	],
	#category : #'PetitJava-Core'
}

{ #category : #accessing }
PPJavaWhitespaceParser class >> instance [
	instance isNil ifTrue: [ 
		instance := self new
	].
	"
		I would rather not to see this as a singleton
		
		The reason to reset is that optimizations set some strategies. And these will not get 
		restored.
	"
	instance resetStrategy.
	^ instance 
]

{ #category : #accessing }
PPJavaWhitespaceParser class >> reset [
	instance := nil
]

{ #category : #visiting }
PPJavaWhitespaceParser >> accept: visitor [
	^ visitor visitJavaWhitespace: self
]

{ #category : #initialization }
PPJavaWhitespaceParser >> initialize [
	super initialize.
	
	self resetStrategy.
]

{ #category : #'analysis - first' }
PPJavaWhitespaceParser >> isFirstSetTerminal [
	^ false
]

{ #category : #private }
PPJavaWhitespaceParser >> resetStrategy [
	strategy := PPJavaWhitespace on: self
]
