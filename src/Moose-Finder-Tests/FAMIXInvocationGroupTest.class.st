"
A FAMIXInvocationGroupTest is a test class for testing the behavior of FAMIXInvocationGroup
"
Class {
	#name : #FAMIXInvocationGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Moose-Finder-Tests'
}

{ #category : #running }
FAMIXInvocationGroupTest >> setUp [

	| fromMethod fromClass fromPackage toMethod toClass toPackage invocation |
	super setUp.

	fromMethod := FamixStMethod new
		              signature: 'fromMethod()';
		              yourself.
	fromClass := FamixStClass new
		             name: 'Hello';
		             yourself.
	fromClass addMethod: fromMethod.
	fromPackage := FamixStPackage new
		               name: 'from';
		               yourself.
	fromClass parentPackage: fromPackage.


	toMethod := FamixStMethod new
		            signature: 'toMethod()';
		            yourself.
	toClass := FamixStClass new
		           name: 'World';
		           yourself.
	toClass addMethod: toMethod.
	toPackage := FamixStPackage new
		             name: 'to';
		             yourself.
	toClass parentPackage: toPackage.


	invocation := FamixStInvocation new.
	invocation source: fromMethod.
	invocation addCandidate: toMethod.


	model := FamixStModel new
		         addAll: { 
				         fromMethod.
				         fromClass.
				         fromPackage.
				         invocation.
				         toMethod.
				         toClass.
				         toPackage };
		         yourself
]

{ #category : #test }
FAMIXInvocationGroupTest >> testExportToCsvStream [

	| csv |
	csv := String streamContents: [ :s | 
		       model allInvocations specialize exportToCsvStream: s ].
	self
		assert: csv
		equals:
			'FromPackage,FromClass,FromMethod,ToPackage,ToClass,ToMethod
"from","Hello","fromMethod()","to","World","toMethod()"
'
]
