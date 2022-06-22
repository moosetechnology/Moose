Class {
	#name : #MooseAbstractLoadModuleCommand,
	#superclass : #MooseAbstractMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseAbstractLoadModuleCommand class >> help [

	^ 'Load additional modules using Metacello'
]

{ #category : #'world menu' }
MooseAbstractLoadModuleCommand class >> label [

	^ 'Load additional modules'
]

{ #category : #'world menu' }
MooseAbstractLoadModuleCommand class >> labelFor: aMooseCommand [

	^ 'Load ' , aMooseCommand label
]

{ #category : #'world menu' }
MooseAbstractLoadModuleCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ aBuilder
		  item: self menuConfigurationSymbol;
		  parent: self famixMenuSymbol;
		  label: self label;
		  help: self help;
		  icon: MooseIcons mooseIcon;
		  order: 100;
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseAbstractLoadModuleCommand class >> menuConfigurationSymbol [

	^ #'Additional modules'
]

{ #category : #'world menu' }
MooseAbstractLoadModuleCommand class >> menuPriority [

	^ 10
]

{ #category : #accessing }
MooseAbstractLoadModuleCommand >> baselineName [

	self subclassResponsibility
]

{ #category : #executing }
MooseAbstractLoadModuleCommand >> execute [

	Metacello new
		baseline: self baselineName;
		repository: self repositoryURL;
		onConflictUseIncoming;
		load
]

{ #category : #accessing }
MooseAbstractLoadModuleCommand >> repositoryURL [

	self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractLoadModuleCommand >> version [

	^ self subclassResponsibility
]
