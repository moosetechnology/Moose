"
I am a special hook to TestExecutionEnvironment to clean current mock behaviour and recover all global stubs.
I play role of forked process during test. So TestExecutionEnvironment terminats me at the end of tests and I perform all required cleaning
"
Class {
	#name : #MockCleaningProcessHook,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #accessing }
MockCleaningProcessHook class >> instance [
	^instance ifNil: [ instance := MockCleaningProcessHook new]
]

{ #category : #actions }
MockCleaningProcessHook >> terminate [
	MockCurrentBehaviour value: nil
]
