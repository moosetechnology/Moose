Class {
	#name : #MooseAbstractInstallToolEntry,
	#superclass : #MooseAbstractMenuEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ aBuilder
		  item: self menuConfigurationSymbol;
		  order: 100;
		  parent: self famixToolsMenuSymbol;
		  icon: MooseIcons mooseIcon;
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> menuConfigurationSymbol [

	^ #'Additional modules'
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> menuPriority [

	^ 0
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> toolEntryMenuCommandOn: aBuilder [

	"Configure Moose Menu for sub-entries"

	^ aBuilder
		  item: self new label;
		  parent: self menuConfigurationSymbol;
		  order: self menuPriority;
		  label: 'Load ' , self new label;
		  icon: MooseIcons mooseIcon;
		  action: [ self new run ];
		  yourself
]

{ #category : #execution }
MooseAbstractInstallToolEntry >> version [
	^ self subclassResponsibility
]
