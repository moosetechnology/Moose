"
generate the general traits:

| g |
g := FamixGenerator new.
g builder traitsFlattening: false.
g generateWithoutCleaning.

generate C metamodel

| g |
g := CMetamodelGenerator  new.
g builder traitsFlattening: true.
g generateWithoutCleaning.
CMetamodelGenerator resetMetamodel.


generate PlantText graphs

| b v |
b := CMetamodelGenerator builderWithDefinitions.
v := FamixMetamodelBuilderPlantTextVisitor new.
b acceptVisitor: v.
v contents
"
Class {
	#name : #CMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'function',
		'entity',
		'type',
		'macro',
		'module',
		'file',
		'cFile',
		'hFile',
		'tEntity',
		'tFile',
		'invocation'
	],
	#category : #CMetamodelGenerator
}

{ #category : #accessing }
CMetamodelGenerator class >> packageName [

	^ #'FmxC-Generated'
]

{ #category : #accessing }
CMetamodelGenerator class >> prefix [

	^ #'FmxC'
]

{ #category : #definition }
CMetamodelGenerator >> defineClasses [

	entity := builder newClassNamed: #Entity.
	function := builder newClassNamed: #Function.
	type := builder newClassNamed: #Type.
	macro := builder newClassNamed: #Macro.
	module := builder newClassNamed: #Module.
	file := builder newClassNamed: #File.
	cFile := builder newClassNamed: #CFile.
	hFile := builder newClassNamed: #HFile.
	
	invocation := builder newClassNamed: #Invocation.
	
	tEntity := (entity as: #TEntity) trait.
	tFile := (file as: #TFile) trait.
	
	self defineHierarchy.
]

{ #category : #definition }
CMetamodelGenerator >> defineHierarchy [

	entity <|-- function.
	entity <|-- type.
	entity <|-- macro.
	entity --|> #TNamed.

	module --|> #TNamed.
	file --|> #TNamed.

	file <|-- cFile.
	file <|-- hFile.
	
	invocation --|> #TInvocation.
	function --|> #TWithInvocations.
	function --|> #TInvocable.


]

{ #category : #'instance creation' }
CMetamodelGenerator >> defineRelations [

	module <>- cFile.
	module <>- hFile.
	
	(tEntity property: #definedIn) *- (tFile property: #definedEntities).

]

{ #category : #'instance creation' }
CMetamodelGenerator >> newBuilder [

	^ (FamixGenerator builderWithDefinitions)
		doNotGenerateCurrent;
		generator: self;
		yourself.
	
		
		
	
]
