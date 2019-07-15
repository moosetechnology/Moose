Extension { #name : #FamixMetamodelGenerator }

{ #category : #'*Famix-MetamodelGeneration' }
FamixMetamodelGenerator >> builderWithStandardTraits [

	| standardBuilder mooseGenerator |
	
	standardBuilder := FamixGenerator builderWithDefinitions.

	"add Moose-Query"
	mooseGenerator := FamixMooseQueryGenerator new.
	mooseGenerator builder: standardBuilder.
	mooseGenerator adoptBuilder: standardBuilder.
	standardBuilder generator: mooseGenerator.
	mooseGenerator define.
	
	self adoptBuilder: standardBuilder.

	^ standardBuilder
		doNotGenerateCurrent;
		generator: self;
		yourself.
]
