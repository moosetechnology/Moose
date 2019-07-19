Extension { #name : #FamixMetamodelGenerator }

{ #category : #'*Famix-MetamodelGeneration' }
FamixMetamodelGenerator >> builderWithStandardTraits [

	| standardBuilder mooseGenerator |
	
	"add Moose-Query"
	mooseGenerator := FamixMooseQueryGenerator builderWithDefinitions.
	
	
	standardBuilder := FamixGenerator new.

	
	standardBuilder builder: mooseGenerator.
	standardBuilder adoptBuilder: mooseGenerator.
	mooseGenerator generator: standardBuilder.
	standardBuilder define.
	
	self adoptBuilder: mooseGenerator.

	^ mooseGenerator
		doNotGenerateCurrent;
		generator: self;
		yourself.
]
