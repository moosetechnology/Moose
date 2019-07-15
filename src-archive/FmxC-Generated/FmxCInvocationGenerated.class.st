Class {
	#name : #FmxCInvocationGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#sender => FMOne type: #FamixTWithInvocations opposite: #outgoingInvocations',
		'#candidates => FMMany type: #FamixTInvocable opposite: #incomingInvocations',
		'#receiver => FMOne type: #FamixTInvocationsReceiver opposite: #receivingInvocations'
	],
	#category : #'FmxC-Generated-Entities'
}

{ #category : #meta }
FmxCInvocationGenerated class >> annotation [

	<MSEClass: #InvocationGenerated super: #MooseEntity>
	<package: #'FmxC-Generated'>
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
