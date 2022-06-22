Class {
	#name : #MooseAbstractMetamodelMenuCommand,
	#superclass : #MooseAbstractMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseAbstractMetamodelMenuCommand class >> help [

	^ 'Manage metamodels'
]

{ #category : #accessing }
MooseAbstractMetamodelMenuCommand class >> label [

	^ 'Manage metamodels'
]

{ #category : #'world menu' }
MooseAbstractMetamodelMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ aBuilder
		  item: self menuRoot;
		  parent: self famixMenuRoot;
		  label: self label;
		  help: self help;
		  icon: self icon;
		  order: self menuPriority;
		  withSeparatorAfter;
		  yourself
]

{ #category : #accessing }
MooseAbstractMetamodelMenuCommand class >> menuPriority [

	^ 0
]

{ #category : #'world menu' }
MooseAbstractMetamodelMenuCommand class >> menuRoot [

	^ #Metamodels
]
