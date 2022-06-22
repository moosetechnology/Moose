Class {
	#name : #MooseRegenerateAllMetamodelsCommand,
	#superclass : #MooseAbstractMetamodelCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseRegenerateAllMetamodelsCommand class >> help [

	^ 'Regenerate all metamodels in the system:
- Reinitialize all relation slots.
Then for each metamodel:
	-- Regenerate all traits and classes
	-- Empty cache for each class in the metamodel. This cache contains all traits used by the class and all its superclasses.
	-- In each subclass of MooseModel, reset the #metamodel instance variable to the newly generated metamodel.'
]

{ #category : #'world menu' }
MooseRegenerateAllMetamodelsCommand class >> label [

	^ 'Regenerate all metamodels'
]

{ #category : #'world menu' }
MooseRegenerateAllMetamodelsCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseRegenerateAllMetamodelsCommand class >> menuPriority [

	^ 40
]

{ #category : #executing }
MooseRegenerateAllMetamodelsCommand >> execute [

	FamixMetamodelGenerator generateAllMetamodels
]
