Class {
	#name : #MooseResetAllMetamodelsCommand,
	#superclass : #MooseAbstractMetamodelCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseResetAllMetamodelsCommand class >> help [

	^ 'For each metamodel in the system:
- Empty cache for each class in the metamodel. This cache contains all traits used by the class and all its superclasses.
- In each subclass of MooseModel, reset the #metamodel instance variable to the newly generated metamodel.'
]

{ #category : #'world menu' }
MooseResetAllMetamodelsCommand class >> label [

	^ 'Reset all metamodels'
]

{ #category : #'world menu' }
MooseResetAllMetamodelsCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseResetAllMetamodelsCommand class >> menuPriority [

	^ 45
]

{ #category : #executing }
MooseResetAllMetamodelsCommand >> execute [

	MooseModel resetMetamodels
]
