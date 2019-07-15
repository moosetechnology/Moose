Class {
	#name : #FmxCFunctionGenerated,
	#superclass : #FmxCEntityGenerated,
	#instVars : [
		'#incomingInvocations => FMOne type: #FamixTInvocation opposite: #candidates',
		'#outgoingInvocations => FMMany type: #FamixTInvocation opposite: #sender'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCFunctionGenerated class >> annotation [

	<MSEClass: #Function super: #FmxCEntityGenerated>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCFunctionGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCFunctionGenerated class >> statefulTraits [

	<statefulTraits>
	^ {FamixTInvocable. FamixTWithInvocations}
]

{ #category : #'_fromTrait_FamixTInvocableGenerated' }
FmxCFunctionGenerated >> incomingInvocations [

	^ incomingInvocations
]

{ #category : #'_fromTrait_FamixTInvocableGenerated' }
FmxCFunctionGenerated >> incomingInvocations: anObject [

	incomingInvocations := anObject

]

{ #category : #'_fromTrait_FamixTWithInvocationsGenerated' }
FmxCFunctionGenerated >> outgoingInvocations [

	<MSEComment: 'Outgoing invocations sent by this behaviour.'>
	^ outgoingInvocations
]

{ #category : #'_fromTrait_FamixTWithInvocationsGenerated' }
FmxCFunctionGenerated >> outgoingInvocations: anObject [

	outgoingInvocations value: anObject

]
