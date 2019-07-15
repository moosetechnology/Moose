"
FAMIXGlobalVariableGroup is a MooseGroup containing only FAMIX enities of type FAMIXGlobalVariable.
"
Class {
	#name : #FAMIXGlobalVariableGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXGlobalVariableGroup class >> annotation [
	<MSEClass: #GlobalVariableGroup super: #MooseGroup>
	<package: #FAMIX>
]

{ #category : #'as yet unclassified' }
FAMIXGlobalVariableGroup >> variableNamed: aVarName [
	"Maybe mooseName should be used instead"
	^ self detect: [:var | var name = aVarName ]
]

{ #category : #'as yet unclassified' }
FAMIXGlobalVariableGroup >> variableUnused [
	^ self select: [:var | var incomingAccesses size = 0 ]
]

{ #category : #'as yet unclassified' }
FAMIXGlobalVariableGroup >> variableUnusedGroup [
	<navigation: 'Variable unsued'>
	^ self class withAll: self variableUnused  
]

{ #category : #'as yet unclassified' }
FAMIXGlobalVariableGroup >> variablesAccessedFromDifferentPackages [
	^ self select: [:var | 
		((var incomingAccesses collect: #accessor)
			collect: #parentScope) asSet size > 1]
]

{ #category : #'as yet unclassified' }
FAMIXGlobalVariableGroup >> variablesAccessedFromDifferentPackagesGroup [
	<navigation: 'Variables accessed from more than one package'>
	^ self class withAll: self variablesAccessedFromDifferentPackages  
]
