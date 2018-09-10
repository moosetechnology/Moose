"
I am root of hierarchy of composite specifications.

My instance can be created by binary messages to spec instances:

	(Instance of: String) & (Satisfying for: [:o | true])
	(Instance of: String) | (Satisfying for: [:o | true])

Internal Representation and Key Implementation Points.

    Instance Variables
	specs:		<Collection of: <SpecOfObjectState>>
"
Class {
	#name : #SpecOfComplexState,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'specs'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfComplexState class >> of: arrayOfPatterns [ 
	^self new specs: (arrayOfPatterns collect: [:each | each asStateSpec])
]

{ #category : #'instance creation' }
SpecOfComplexState class >> of: pattern1 and: pattern2 [ 
	^self of: (Array with: pattern1 with: pattern2)
]

{ #category : #'instance creation' }
SpecOfComplexState class >> of: pattern1 and: pattern2 and: pattern3 [ 
	^self of: (Array 
				with: pattern1
				with: pattern2
				with: pattern3)
]

{ #category : #accessing }
SpecOfComplexState >> addSpec: aStateSpec [
	specs add: aStateSpec 
]

{ #category : #accessing }
SpecOfComplexState >> addSpecs: aCollectionOfSpecs [
	specs addAll: aCollectionOfSpecs 
]

{ #category : #copying }
SpecOfComplexState >> copy [
	| result |
	result := super copy.
	
	result specs: (specs collect: [:each | each copy]).
	
	^result
]

{ #category : #printing }
SpecOfComplexState >> defaultTitle [
	^String streamContents: [ :s |
		specs do: [ :each |
			s << each title.
			each == specs last ifFalse: [ s << ' ' << self operatorName << ' ' ]]
	]
]

{ #category : #initialization }
SpecOfComplexState >> initialize [
	super initialize.
	
	specs := OrderedCollection new
]

{ #category : #accessing }
SpecOfComplexState >> invertChildren [
	super invertChildren.
	
	specs do: #invert
]

{ #category : #printing }
SpecOfComplexState >> operatorName [
	self subclassResponsibility 
]

{ #category : #accessing }
SpecOfComplexState >> specs [
	^specs
]

{ #category : #accessing }
SpecOfComplexState >> specs: anArray [
	specs := anArray
]
