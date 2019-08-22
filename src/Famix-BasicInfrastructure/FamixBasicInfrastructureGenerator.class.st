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
		'sourceTextAnchor',
		'unknownSourceLanguage'
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

{ #category : #testing }
FamixBasicInfrastructureGenerator class >> isAbstract [
	^ self = FamixBasicInfrastructureGenerator
]

{ #category : #accessing }
FamixBasicInfrastructureGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
FamixBasicInfrastructureGenerator >> defineClasses [

	super defineClasses.

	entity := builder newClassNamed: #Entity.
	sourceAnchor := builder newClassNamed: #SourceAnchor.
	sourceLanguage := builder newClassNamed: #SourceLanguage.
	unknownSourceLanguage := builder newClassNamed: #UnknownSourceLanguage.
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

	sourceLanguage --|> entity.
	sourceLanguage --|> #TSourceLanguage.
	
	sourcedEntity --|> entity.
	sourcedEntity --|> #TSourceEntity.
	sourcedEntity --|> #TWithComments.
	
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
	
	unknownSourceLanguage --|> sourceLanguage.
	unknownSourceLanguage --|> #TSourceLanguage
]
