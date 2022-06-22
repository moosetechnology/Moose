Class {
	#name : #MooseResetAllMetamodelsAdditionalPropertiesMenuCommand,
	#superclass : #MooseAbstractMetamodelMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseResetAllMetamodelsAdditionalPropertiesMenuCommand class >> help [

	^ 'For all metamodels, reset the ''Additional properties'' cache. This cache contains MooseQuery informations (for example #childrenTypes) for each class in the metamodel'
]

{ #category : #accessing }
MooseResetAllMetamodelsAdditionalPropertiesMenuCommand class >> label [

	^ 'Reset MooseQuery cache for all metamodels'
]

{ #category : #'world menu' }
MooseResetAllMetamodelsAdditionalPropertiesMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseResetAllMetamodelsAdditionalPropertiesMenuCommand class >> menuPriority [

	^ 50
]

{ #category : #executing }
MooseResetAllMetamodelsAdditionalPropertiesMenuCommand >> execute [

	MooseModel resetMetamodelsAdditionalProperties
]
