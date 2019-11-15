Class {
	#name : #VerveineJModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-VerveineJ-Tests'
}

{ #category : #accessing }
VerveineJModelTest class >> resources [
	^ {VerveineJTestResource}
]

{ #category : #running }
VerveineJModelTest >> setUp [
	super setUp.
	self flag: #todo. "When Verveine J will be migrated to the new Java MM, those tests should also be migrated."
	model := VerveineJTestResource current model
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
