Class {
	#name : #MooseAbstractMenuCommand,
	#superclass : #CmCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> famixMenuRoot [

	^ #Famix
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> famixMenuRootOn: aBuilder [

	aBuilder
		item: self famixMenuRoot;
		order: 100;
		parent: #Tools;
		icon: self icon;
		withSeparatorAfter
]

{ #category : #accessing }
MooseAbstractMenuCommand class >> help [

	"Override if necessary"

	^ ''
]

{ #category : #accessing }
MooseAbstractMenuCommand class >> icon [

	"Override if necessary"

	^ MooseIcons mooseIcon
]

{ #category : #accessing }
MooseAbstractMenuCommand class >> label [

	self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractMenuCommand class >> labelFor: aMooseCommand [

	"Override if necessary"

	^ aMooseCommand label
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	self mooseMenuRootOn: aBuilder.
	self famixMenuRootOn: aBuilder.
	^ aBuilder

]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> menuCommandOn: aBuilder forCommand: aMooseCommand [

	"Configure sub-entries"

	^ aBuilder
		  item: aMooseCommand label;
		  parent: aMooseCommand menuRoot;
		  label: (self labelFor: aMooseCommand);
		  help: aMooseCommand help;
		  icon: aMooseCommand icon;
		  order: aMooseCommand menuPriority;
		  action: [ aMooseCommand new execute ];
		  yourself
]

{ #category : #accessing }
MooseAbstractMenuCommand class >> menuPriority [

	"Override if necessary"

	^ 999
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> menuRoot [

	self subclassResponsibility
]

{ #category : #'world menu' }
MooseAbstractMenuCommand class >> mooseMenuRootOn: aBuilder [

	aBuilder
		item: #Moose;
		order: 6;
		icon: self icon
]
