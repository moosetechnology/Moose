Class {
	#name : #FamixTGlobalVariableGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTGlobalVariableGroup class >> annotation [

	<FMClass: #TGlobalVariableGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTGlobalVariableGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #'as yet unclassified' }
FamixTGlobalVariableGroup >> variableNamed: aVarName [
	"Maybe mooseName should be used instead"
	^ self detect: [:var | var name = aVarName ]
]

{ #category : #'as yet unclassified' }
FamixTGlobalVariableGroup >> variableUnused [
	^ self select: [:var | var incomingAccesses size = 0 ]
]

{ #category : #'as yet unclassified' }
FamixTGlobalVariableGroup >> variableUnusedGroup [
	<navigation: 'Variable unsued'>
	^ self class withAll: self variableUnused  
]

{ #category : #'as yet unclassified' }
FamixTGlobalVariableGroup >> variablesAccessedFromDifferentPackages [
	^ self select: [:var | 
		((var incomingAccesses collect: #accessor)
			collect: #parentScope) asSet size > 1]
]

{ #category : #'as yet unclassified' }
FamixTGlobalVariableGroup >> variablesAccessedFromDifferentPackagesGroup [
	<navigation: 'Variables accessed from more than one package'>
	^ self class withAll: self variablesAccessedFromDifferentPackages  
]
