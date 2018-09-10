Class {
	#name : #FamixMooseQueryGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'tAssociationMetaLevelDependency',
		'tDependencyQueries',
		'tDependencyQueryResult',
		'tEntityMetaLevelDependency',
		'tOODependencyQueries'
	],
	#category : #'Famix-MetamodelGeneration'
}

{ #category : #accessing }
FamixMooseQueryGenerator class >> packageName [

	^ #'Moose-Query'
]

{ #category : #definition }
FamixMooseQueryGenerator >> defineHierarchy [

	tOODependencyQueries --|> tDependencyQueries.

]

{ #category : #definition }
FamixMooseQueryGenerator >> defineTraits [

	tAssociationMetaLevelDependency := builder newTraitNamed: #TAssociationMetaLevelDependency.
	tDependencyQueries := builder newTraitNamed: #TDependencyQueries.
	tDependencyQueryResult := builder newTraitNamed: #TDependencyQueryResult.
	tEntityMetaLevelDependency := builder newTraitNamed: #TEntityMetaLevelDependency.
	tOODependencyQueries := builder newTraitNamed: #TOODependencyQueries.

]

{ #category : #definition }
FamixMooseQueryGenerator >> prefix [

	^ ''
]
