Class {
	#name : #RGPoolVariableTest,
	#superclass : #RGTest,
	#category : #'Ring2-Tests-Core'
}

{ #category : #tests }
RGPoolVariableTest >> testPoolVariableImplicitEnvironment [

	| poolVariable |
	
	poolVariable := RGPoolVariable unnamed.
	self assert: (poolVariable hasUnresolved: #name).
	self assert: (poolVariable parent isClass).
	self checkImplicitSingleClassEnvironmentOf: poolVariable parent.
	
	
	
	

]
