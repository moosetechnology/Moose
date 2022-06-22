Class {
	#name : #MooseResetAllMetamodelsMenuCommand,
	#superclass : #MooseAbstractMetamodelMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseResetAllMetamodelsMenuCommand class >> help [

	^ 'For each metamodel in the system:
- Empty cache for each class in the metamodel. This cache contains all traits used by the class and all its superclasses.
- In each subclass of MooseModel, reset the #metamodel instance variable to the newly generated metamodel.'
]

{ #category : #accessing }
MooseResetAllMetamodelsMenuCommand class >> label [

	^ 'Reset all metamodels'
]

{ #category : #'world menu' }
MooseResetAllMetamodelsMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseResetAllMetamodelsMenuCommand class >> menuPriority [

	^ 45
]

{ #category : #executing }
MooseResetAllMetamodelsMenuCommand >> execute [

	MooseModel resetMetamodels
]
