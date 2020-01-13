Extension { #name : #FamixMetamodelGenerator }

{ #category : #'*Famix-Deprecated' }
FamixMetamodelGenerator >> builderWithStandardTraits [

	| standardBuilder mooseGenerator |
	self deprecated: 'Use system of sub metamodel instead. (Declare a #submetamodels method class side returning the subMMs to use such as `#(FamixGenerator)`.'.
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

{ #category : #'*Famix-Deprecated' }
FamixMetamodelGenerator class >> metamodel [
	self deprecated: 'Use the model to access the metamodel instead.' transformWith: '`@receiver metamodel' -> (self mooseModelName , ' metamodel').
	^ self withMooseModelDo: [ :m | m metamodel ]
]
