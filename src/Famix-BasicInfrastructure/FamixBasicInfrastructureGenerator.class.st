Class {
	#name : #FamixBasicInfrastructureGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'entity',
		'sourceAnchor',
		'sourceLanguage',
		'sourcedEntity',
		'comment',
		'namedEntity',
		'sourceTextAnchor',
		'unknownSourceLanguage'
	],
	#category : #'Famix-BasicInfrastructure'
}

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

	comment --|> sourcedEntity.
	comment --|> #TComment.

	namedEntity --|> sourcedEntity.
	namedEntity --|> #TNamedEntity.
	namedEntity --|> #TDependencyQueries.
	namedEntity --|> #TEntityMetaLevelDependency.

	sourceTextAnchor --|> sourceAnchor.
	sourceTextAnchor --|> #THasImmediateSource.

	unknownSourceLanguage --|> sourceLanguage.
	unknownSourceLanguage --|> #TUnknownSourceLanguage
]
