"
Represents an invocation which function is contained in a pointer.

The function itself is typically unknown (referenced by the pointer).

It has a referencer which is the pointer variable
"
Class {
	#name : #FAMIXDereferencedInvocation,
	#superclass : #FAMIXInvocation,
	#instVars : [
		'referencer'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXDereferencedInvocation class >> annotation [
	<MSEClass: #DereferencedInvocation super: #FAMIXInvocation>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXDereferencedInvocation >> referencer [
	<MSEProperty: #referencer type: #FAMIXStructuralEntity opposite: #dereferencedInvocations>
	<MSEComment: 'Structural entity that references the BehaviouralEntity invoked'>
	^ referencer
]

{ #category : #accessing }
FAMIXDereferencedInvocation >> referencer: anObject [
	referencer := anObject
]
