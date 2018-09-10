"
I specify any posslble object. 
I should be used directly as class to successfully validate any object.

	(Any matches:  nil) = true
	(Any matches:  Object new) = true
"
Class {
	#name : #Any,
	#superclass : #Object,
	#category : 'StateSpecs-Specs'
}

{ #category : #converting }
Any class >> asSimpleValue [
	^self name
]

{ #category : #converting }
Any class >> asStateSpec [
	^self
]

{ #category : #validation }
Any class >> basicMatches: anObject [ 
	^true
]

{ #category : #accessing }
Any class >> denial: aBoolean [ 
	^self
]

{ #category : #testing }
Any class >> isSimpleValue [
	^true
]

{ #category : #testing }
Any class >> isStateSpec [
	^true
]

{ #category : #validation }
Any class >> matches: anObject [ 
	^true
]

{ #category : #validation }
Any class >> validate: anObject [ 
	^SpecOfValidationResult success
]
