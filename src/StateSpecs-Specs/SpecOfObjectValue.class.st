"
I am root of hierarchy to object value itself.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	requiredValue:		<Object>

"
Class {
	#name : #SpecOfObjectValue,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredValue'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfObjectValue class >> requiredValue: anObject [ 
	^self new requiredValue: anObject
]

{ #category : #displaying }
SpecOfObjectValue >> clauseKeyword [
	self subclassResponsibility
]

{ #category : #displaying }
SpecOfObjectValue >> defaultTitle [
	^self clauseKeyword , ' "' , requiredValue stringForSpecTitle , '"'
]

{ #category : #accessing }
SpecOfObjectValue >> requiredValue [
	^requiredValue
]

{ #category : #accessing }
SpecOfObjectValue >> requiredValue: anObject [ 
	requiredValue := anObject
]
