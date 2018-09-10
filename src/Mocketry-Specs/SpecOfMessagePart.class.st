"
I am a root of particular message part specs.

Internal Representation and Key Implementation Points.

    Instance Variables
	requiredValue:		<SpecOfObjectState>
"
Class {
	#name : #SpecOfMessagePart,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredValue'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfMessagePart class >> requiredValue: anObjectOrSpec [

	^self new 
		requiredValue: anObjectOrSpec
]

{ #category : #accessing }
SpecOfMessagePart >> invertChildren [
	super invertChildren.
	
	requiredValue invert
]

{ #category : #accessing }
SpecOfMessagePart >> requiredValue [
	^ requiredValue
]

{ #category : #accessing }
SpecOfMessagePart >> requiredValue: anObjectOrSpec [
	requiredValue := anObjectOrSpec asStateSpec
]
