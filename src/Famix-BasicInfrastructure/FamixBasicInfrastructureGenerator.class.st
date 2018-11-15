Class {
	#name : #FamixBasicInfrastructureGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'entity',
		'sourceAnchor',
		'sourceLanguage',
		'sourcedEntity',
		'association',
		'comment',
		'namedEntity',
		'sourceTextAnchor'
	],
	#category : #'Famix-BasicInfrastructure'
}

{ #category : #accessing }
FamixBasicInfrastructureGenerator class >> basicMetamodelClasses [

	| classes |
	
	classes := super basicMetamodelClasses.	
	classes addAll: self basicFamixTraits.
	
	^ classes
	
	
]

{ #category : #definition }
FamixBasicInfrastructureGenerator >> defineClasses [

	super defineClasses.

	entity := builder newClassNamed: #Entity.
	sourceAnchor := builder newClassNamed: #SourceAnchor.
	sourceLanguage := builder newClassNamed: #SourceLanguage.
	sourcedEntity := builder newClassNamed: #SourcedEntity.
	association := builder newClassNamed: #Association.
	comment := builder newClassNamed: #Comment.
	namedEntity := builder newClassNamed: #NamedEntity.
	sourceTextAnchor := builder newClassNamed: #SourceTextAnchor.

]

{ #category : #definition }
FamixBasicInfrastructureGenerator >> defineHierarchy [

	sourceAnchor --|> entity.
	sourceAnchor --|> #TSourceAnchor.
	
	sourceAnchor --|> #TEntityMetaLevelDependency.
	sourceAnchor --|> #TDependencyQueries.

	sourceLanguage --|> entity.
	sourceLanguage --|> #TSourceLanguage.
	
	sourcedEntity --|> entity.
	sourcedEntity --|> #TWithSourceAnchor.
	sourcedEntity --|> #TWithComments.
	sourcedEntity --|> #TWithSourceLanguage.
	
	association --|> sourcedEntity.
	association --|> #TAssociation.
	
	association --|> #TAssociationMetaLevelDependency.
	
	comment --|> sourcedEntity.
	comment --|> #TComment.

	namedEntity --|> sourcedEntity.
	namedEntity --|> #TNamed.

	namedEntity --|> #TDependencyQueries.
	namedEntity --|> #TEntityMetaLevelDependency.
	
	sourceTextAnchor --|> sourceAnchor.
	sourceTextAnchor --|> #TWithImmediateSource.


]

{ #category : #definition }
FamixBasicInfrastructureGenerator >> newBuilder [

	^ self builderWithStandardTraits
]
