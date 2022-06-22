Class {
	#name : #MooseAbstractInstallToolEntry,
	#superclass : #MooseAbstractMenuEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> help [

	^ 'Load additional modules using Metacello'
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> label [

	^ 'Additional modules'
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ aBuilder
		  item: self menuConfigurationSymbol;
		  parent: self famixToolsMenuSymbol;
		  label: self label;
		  help: self help;
		  icon: MooseIcons mooseIcon;
		  order: 100;
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
		  item: self label;
		  parent: self menuConfigurationSymbol;
		  label: 'Load ' , self label;
		  help: self help;
		  icon: MooseIcons mooseIcon;
		  order: self menuPriority;
		  action: [ self new run ];
		  yourself
]

{ #category : #accessing }
MooseAbstractInstallToolEntry >> baselineName [

	self subclassResponsibility
]

{ #category : #execution }
MooseAbstractInstallToolEntry >> execute [

	Metacello new
		baseline: self baselineName;
		repository: self repositoryURL;
		onConflictUseIncoming;
		load
]

{ #category : #accessing }
MooseAbstractInstallToolEntry >> repositoryURL [

	self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractInstallToolEntry >> version [

	^ self subclassResponsibility
]
