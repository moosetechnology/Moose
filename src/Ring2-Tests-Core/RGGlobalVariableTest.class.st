Class {
	#name : #RGGlobalVariableTest,
	#superclass : #RGTest,
	#category : #'Ring2-Tests-Core'
}

{ #category : #tests }
RGGlobalVariableTest >> testGlobalVariableImplicitEnvironment [

	| globalVariable |
	
	globalVariable := RGGlobalVariable unnamed.
	self assert: (globalVariable hasUnresolved: #name).
	self assert: globalVariable environment ask globalVariables size equals: 1.
	self assert: (globalVariable environment ask globalVariables anyOne == globalVariable).
	
]

{ #category : #tests }
RGGlobalVariableTest >> testNewGlobalVariable [

	| classVariable | 
	classVariable  := RGGlobalVariable named: #SomeGlobalVariable..
	self assert: (classVariable isRingResolved).
	self assert: (classVariable hasResolvedName).
	self assert: (classVariable isGlobalVariable).


	
]
