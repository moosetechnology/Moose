Class {
	#name : #FmxCInvocationGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#sender => FMOne type: #FamixTWithInvocations opposite: #outgoingInvocations',
		'#candidates => FMMany type: #FamixTInvocable opposite: #incomingInvocations',
		'#receiver => FMOne type: #FamixTInvocationsReceiver opposite: #receivingInvocations'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCInvocationGenerated class >> annotation [

	<MSEClass: #Invocation super: #MooseEntity>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCInvocationGenerated class >> metamodel [

	^ CMetamodelGenerator metamodel
]

{ #category : #meta }
FmxCInvocationGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCInvocationGenerated class >> statefulTraits [

	<statefulTraits>
	^ {FamixTInvocation}
]

{ #category : #'_fromTrait_FamixTInvocationGenerated' }
FmxCInvocationGenerated >> candidates [

	<target>

	^ candidates
]

{ #category : #'_fromTrait_FamixTInvocationGenerated' }
FmxCInvocationGenerated >> candidates: anObject [

	candidates value: anObject

]

{ #category : #'_fromTrait_FamixTInvocationGenerated' }
FmxCInvocationGenerated >> receiver [

	<MSEComment: 'Named entity (variable, class...) receiving the invocation. to-side of the association'>
	^ receiver
]

{ #category : #'_fromTrait_FamixTInvocationGenerated' }
FmxCInvocationGenerated >> receiver: anObject [

	receiver := anObject

]

{ #category : #'_fromTrait_FamixTInvocationGenerated' }
FmxCInvocationGenerated >> sender [

	<MSEComment: 'Behavioural entity making the call. from-side of the association'>
	<source>

	^ sender
]

{ #category : #'_fromTrait_FamixTInvocationGenerated' }
FmxCInvocationGenerated >> sender: anObject [

	sender := anObject

]
