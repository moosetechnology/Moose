Class {
	#name : #VerveineJModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Compatibility-Tests-Java'
}

{ #category : #running }
VerveineJModelTest >> setUp [
	super setUp.
	model := FAMIXModel new.
	model importFromMSEStream: VerveineJTestResource new mse readStream
	
]

{ #category : #tests }
VerveineJModelTest >> testCyclomaticComplexity [
	self assert: (model allMethods entityNamed: #'moose::lan::server::PrintServer.output(Packet)') cyclomaticComplexity equals: 2
]

{ #category : #tests }
VerveineJModelTest >> testNumberOfLinesOfCode [
	self assert: (model allMethods entityNamed: #'moose::lan::server::PrintServer.output(Packet)') numberOfLinesOfCode equals: 9
]

{ #category : #tests }
VerveineJModelTest >> testNumberOfStatements [
	self assert: (model allMethods entityNamed: #'moose::lan::server::PrintServer.output(Packet)') numberOfStatements equals: 7
]
