Class {
	#name : #MooseAbstractMenuCommand,
	#superclass : #CmCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> famixMenuSymbol [

	^ #Famix
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> label [
	self subclassResponsibility
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> labelFor: aMooseCommand [

	self subclassResponsibility
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	aBuilder
		item: #Moose;
		order: 6;
		icon: MooseIcons mooseIcon.

	^ aBuilder
		  item: self famixMenuSymbol;
		  order: 100;
		  parent: #Tools;
		  icon: MooseIcons mooseIcon;
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> menuCommandOn: aBuilder forCommand: aMooseCommand [

	"Configure sub-entries"

	^ aBuilder
		  item: aMooseCommand label;
		  parent: self menuConfigurationSymbol;
		  label: (self labelFor: aMooseCommand);
		  help: aMooseCommand help;
		  icon: MooseIcons mooseIcon;
		  order: aMooseCommand menuPriority;
		  action: [ aMooseCommand new execute ];
		  yourself
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> menuConfigurationSymbol [

	self subclassResponsibility
]
