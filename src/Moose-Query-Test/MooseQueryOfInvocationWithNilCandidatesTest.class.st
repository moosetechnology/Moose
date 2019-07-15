Class {
	#name : #MooseQueryOfInvocationWithNilCandidatesTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'class'
	],
	#category : #'Moose-Query-Test'
}

{ #category : #running }
MooseQueryOfInvocationWithNilCandidatesTest >> setUp [
	| inh method inv |
	super setUp.
	class := FAMIXClass new name: 'class'.
	inh := FAMIXInheritance new subclass: class.
	method := FAMIXMethod new name: 'method' ; parentType: class.
	inv := FAMIXInvocation new sender: method.
]

{ #category : #tests }
MooseQueryOfInvocationWithNilCandidatesTest >> testProviderTypesShouldNotRaiseError [
	self shouldnt: [ class providerTypes ] raise: Error
]
