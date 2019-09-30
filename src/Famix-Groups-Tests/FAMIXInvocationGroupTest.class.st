"
A FAMIXInvocationGroupTest is a test class for testing the behavior of FAMIXInvocationGroup
"
Class {
	#name : #FAMIXInvocationGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Groups-Tests'
}

{ #category : #test }
FAMIXInvocationGroupTest >> setUp [
	| fromMethod fromClass fromNamespace fromNamespaceNamespace invocation toMethod toClass  toNamespace toNamespaceNamespace |
	super setUp.
	
	fromNamespaceNamespace := FAMIXNamespace new name: 'fr'; yourself.
	fromNamespace := FAMIXNamespace new name: 'from'; yourself.
	fromClass := FAMIXClass new name: 'Hello'; yourself.
	
	fromMethod := FAMIXMethod new signature: 'fromMethod()'; yourself.
	fromClass addMethod: fromMethod.
	fromClass container: fromNamespace.
	fromNamespace parentScope: fromNamespaceNamespace.

	toNamespaceNamespace := FAMIXNamespace new name: 'com'; yourself.
	toNamespace := FAMIXNamespace new name: 'to'; yourself.
	toClass := FAMIXClass new name: 'World'; yourself.
	toMethod := FAMIXMethod new signature: 'toMethod()'; yourself.
	toClass addMethod: toMethod.
	toClass container: toNamespace.
	toNamespace parentScope: toNamespaceNamespace.
	
	invocation := FAMIXInvocation new.
	invocation from: fromMethod.
	invocation addCandidate: toMethod.
	
	model := FAMIXModel new addAll: { fromMethod. fromClass. fromNamespace. fromNamespaceNamespace. invocation. toMethod. toClass.  toNamespace. toNamespaceNamespace }; yourself
]

{ #category : #test }
FAMIXInvocationGroupTest >> testExportToCsvStream [
	| writeStream |
	writeStream := WriteStream on: String new.
	model allInvocations exportToCsvStream: writeStream.
	self
		assert: writeStream contents
		equals:
			'FromNamespace,FromClass,FromMethod,ToNamespace,ToClass,ToMethod
"fr::from","Hello","fromMethod()","com::to","World","toMethod()"
'
]
