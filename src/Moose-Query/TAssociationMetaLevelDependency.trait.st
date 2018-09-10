"
This trait provides a common, paradigm agnostic vocabulary to query dependencies of association entities at meta level.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TAssociationMetaLevelDependency,
	#classInstVars : [
		'targetTypes',
		'sourceTypes'
	],
	#category : #'Moose-Query'
}

{ #category : #meta }
TAssociationMetaLevelDependency classSide >> annotation [

	<MSEClass: #TAssociationMetaLevelDependency super: #Trait>
	<generated>
	<package: #'Moose-Query'>
	^self
]

{ #category : #accessing }
TAssociationMetaLevelDependency classSide >> dependencyFM3PropertyDescription [
	"Return all the properties corresponding to the source or the target of the association"

	^ self allDeclaredProperties select: [ :e | e isSource or: [ e isTarget ] ]
]

{ #category : #generator }
TAssociationMetaLevelDependency classSide >> generatedSlotNames [
	<generated>
	'TAssociationMetaLevelDependency class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
TAssociationMetaLevelDependency classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #deprecated }
TAssociationMetaLevelDependency classSide >> possibleSourceClasses [
	self 
		deprecated: 'Use sourceTypes instead'
		on: '23 January 2018' 
		in: 'Moose6.1'
		transformWith: '`@receiver possibleSourceClasses' -> '`@receiver sourceTypes'.
	^ self sourceTypes
]

{ #category : #deprecated }
TAssociationMetaLevelDependency classSide >> possibleTargetClasses [
	self 
		deprecated: 'Use targetTypes instead'
		on: '23 January 2018' 
		in: 'Moose6.1'
		transformWith: '`@receiver possibleTargetClasses' -> '`@receiver targetTypes'.
	^ self targetTypes
]

{ #category : #private }
TAssociationMetaLevelDependency classSide >> privateSourceTypes [
	"I return the classes that could be my source"

	^ self dependencyFM3PropertyDescription select: #isSource thenCollect: [ :each | each type implementingClass ]
]

{ #category : #private }
TAssociationMetaLevelDependency classSide >> privateTargetTypes [
	"I return the classes that could be my target"

	^ self dependencyFM3PropertyDescription select: #isTarget thenCollect: [ :each | each type implementingClass ]
]

{ #category : #accessing }
TAssociationMetaLevelDependency classSide >> sourceTypes [
	^ sourceTypes
		ifNil: [ sourceTypes := self privateSourceTypes ]
]

{ #category : #accessing }
TAssociationMetaLevelDependency classSide >> targetTypes [
	^ targetTypes
		ifNil: [ targetTypes := self privateTargetTypes ]
]

{ #category : #accessing }
TAssociationMetaLevelDependency >> dependencyFM3PropertyDescription [
	^ self class dependencyFM3PropertyDescription
]

{ #category : #accessing }
TAssociationMetaLevelDependency >> sourceTypes [
	^ self class sourceTypes
]

{ #category : #accessing }
TAssociationMetaLevelDependency >> targetTypes [
	^ self class targetTypes
]
