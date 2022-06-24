Class {
	#name : #MooseAbstractLoadModuleMenuCommand,
	#superclass : #MooseAbstractMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseAbstractLoadModuleMenuCommand class >> help [

	^ 'Load additional modules using Metacello'
]

{ #category : #accessing }
MooseAbstractLoadModuleMenuCommand class >> label [

	^ 'Load additional modules'
]

{ #category : #accessing }
MooseAbstractLoadModuleMenuCommand class >> labelFor: aMooseCommand [

	^ 'Load ' , aMooseCommand label
]

{ #category : #'world menu' }
MooseAbstractLoadModuleMenuCommand class >> menuCommandOn: aBuilder [

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
MooseAbstractLoadModuleMenuCommand class >> menuPriority [

	^ 10
]

{ #category : #'world menu' }
MooseAbstractLoadModuleMenuCommand class >> menuRoot [

	^ #'Additional modules'
]

{ #category : #accessing }
MooseAbstractLoadModuleMenuCommand >> baselineName [

	self subclassResponsibility
]

{ #category : #executing }
MooseAbstractLoadModuleMenuCommand >> execute [

	Metacello new
		baseline: self baselineName;
		repository: self repositoryURL;
		onConflictUseIncoming;
		load
]

{ #category : #accessing }
MooseAbstractLoadModuleMenuCommand >> repositoryURL [

	self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractLoadModuleMenuCommand >> version [

	^ self subclassResponsibility
]
