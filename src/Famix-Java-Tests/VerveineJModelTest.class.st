Class {
	#name : #VerveineJModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
VerveineJModelTest >> setUp [
	super setUp.
	model := FamixJavaMooseModel importFromMSEStream: VerveineJTestResource new mse readStream
	
]

{ #category : #tests }
VerveineJModelTest >> testCyclomaticComplexity [
	self assert: (model allMethods detect: [ :e | e mooseName = #'PrintServer.output(Packet)']) cyclomaticComplexity equals: 2
]

{ #category : #tests }
VerveineJModelTest >> testNumberOfLinesOfCode [
	self assert: (model allMethods detect: [ :e | e mooseName = #'PrintServer.output(Packet)']) numberOfLinesOfCode equals: 9
]

{ #category : #tests }
VerveineJModelTest >> testNumberOfStatements [
	self assert: (model allMethods detect: [ :e | e mooseName = #'PrintServer.output(Packet)']) numberOfStatements equals: 7
]
