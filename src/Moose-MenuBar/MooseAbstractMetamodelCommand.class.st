Class {
	#name : #MooseAbstractMetamodelCommand,
	#superclass : #MooseAbstractMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseAbstractMetamodelCommand class >> help [

	^ 'Manage metamodels'
]

{ #category : #'world menu' }
MooseAbstractMetamodelCommand class >> label [

	^ 'Manage metamodels'
]

{ #category : #'world menu' }
MooseAbstractMetamodelCommand class >> labelFor: aMooseCommand [

	^ aMooseCommand label
]

{ #category : #'world menu' }
MooseAbstractMetamodelCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ aBuilder
		  item: self menuConfigurationSymbol;
		  parent: self famixMenuSymbol;
		  label: self label;
		  help: self help;
		  icon: MooseIcons mooseIcon;
		  order: self menuPriority;
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseAbstractMetamodelCommand class >> menuConfigurationSymbol [

	^ #Metamodels
]

{ #category : #'world menu' }
MooseAbstractMetamodelCommand class >> menuPriority [

	^ 0
]
