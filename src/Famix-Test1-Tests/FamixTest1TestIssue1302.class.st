Class {
	#name : #FamixTest1TestIssue1302,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixTest1TestIssue1302 >> setUp [

	super setUp.
	builder := FamixMetamodelBuilder forTesting.

]

{ #category : #running }
FamixTest1TestIssue1302 >> testPrimaryContainerCombined [

	<expectedFailure>
	"issue https://github.com/moosetechnology/Moose/issues/1302"
	"should be FmxMBBehaviorTest>>#testPrimaryContainerCombined"

	| tPackage tPackageable method package class env |

	tPackage := builder newTraitNamed: #TPackage.
	tPackageable := builder newTraitNamed: #TPackageable.
	
	tPackage <>-* tPackageable. 

	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	class := builder newClassNamed: #Class.    

	package --|> tPackage.
	class --|> tPackageable.
	(class <>-* method). 
	method usesWithoutPrimaryContainer: tPackageable.
	
	self assert: package primaryContainerProperties size equals: 0.
	self assert: class primaryContainerProperties size equals: 1.
	self assert: method primaryContainerProperties size equals: 1.
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self class').
	self assert: (((env ask classNamed: #TstClass) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self package').
]
