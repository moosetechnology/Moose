Class {
	#name : #FamixGlobalVariableGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixGlobalVariableGroup class >> annotation [

	<FMClass: #GlobalVariableGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixGlobalVariableGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #accessing }
FamixGlobalVariableGroup >> variableNamed: aVarName [
	"Maybe mooseName should be used instead"
	^ self detect: [:var | var name = aVarName ]
]

{ #category : #accessing }
FamixGlobalVariableGroup >> variableUnused [
	^ self select: [:var | var incomingAccesses size = 0 ]
]

{ #category : #navigation }
FamixGlobalVariableGroup >> variableUnusedGroup [
	<navigation: 'Variable unsued'>
	^ self class withAll: self variableUnused  
]

{ #category : #accessing }
FamixGlobalVariableGroup >> variablesAccessedFromDifferentPackages [
	^ self select: [:var | 
		((var incomingAccesses collect: #accessor)
			collect: #parentScope) asSet size > 1]
]

{ #category : #navigation }
FamixGlobalVariableGroup >> variablesAccessedFromDifferentPackagesGroup [
	<navigation: 'Variables accessed from more than one package'>
	^ self class withAll: self variablesAccessedFromDifferentPackages  
]
