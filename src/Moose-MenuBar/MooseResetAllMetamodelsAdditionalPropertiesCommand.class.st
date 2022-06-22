Class {
	#name : #MooseResetAllMetamodelsAdditionalPropertiesCommand,
	#superclass : #MooseAbstractMetamodelCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseResetAllMetamodelsAdditionalPropertiesCommand class >> help [

	^ 'For all metamodels, reset the ''Additional properties'' cache. This cache contains MooseQuery informations (for example #childrenTypes) for each class in the metamodel'
]

{ #category : #'world menu' }
MooseResetAllMetamodelsAdditionalPropertiesCommand class >> label [

	^ 'Reset MooseQuery cache for all metamodels'
]

{ #category : #'world menu' }
MooseResetAllMetamodelsAdditionalPropertiesCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseResetAllMetamodelsAdditionalPropertiesCommand class >> menuPriority [

	^ 50
]

{ #category : #executing }
MooseResetAllMetamodelsAdditionalPropertiesCommand >> execute [

	MooseModel resetMetamodelsAdditionalProperties
]
