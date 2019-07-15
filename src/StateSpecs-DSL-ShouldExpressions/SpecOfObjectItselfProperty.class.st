"
I represent object itself to be root parent of SpecOfObjectProperty.

My instances can be created by 
	
	SpecOfObjectItselfProperty of: anObject
	
Public API and Key Messages

- subPropertyAt:
- value
- stringForSpecTitle 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<Object>

"
Class {
	#name : #SpecOfObjectItselfProperty,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfObjectItselfProperty class >> of: anObject [
	^self new 
		value: anObject
]

{ #category : #printing }
SpecOfObjectItselfProperty >> stringForSpecTitle [ 
	^value stringForSpecTitle 
]

{ #category : #accessing }
SpecOfObjectItselfProperty >> subPropertyAt: aMessage [

	^SpecOfObjectProperty of: self message: aMessage
]

{ #category : #accessing }
SpecOfObjectItselfProperty >> value [
	^ value
]

{ #category : #accessing }
SpecOfObjectItselfProperty >> value: anObject [
	value := anObject
]
