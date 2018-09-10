"
self open
"
Class {
	#name : #MoosePanel,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #menu }
MoosePanel class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'MoosePanel')
		order: 1.0; 
		parent: #Moose;
		label: 'Moose Panel';
		help: 'Moose models management';
		icon: (MooseIcons mooseIcon scaledToSize: 16@16);
		action:[MoosePanel open];
		withSeparatorAfter
]

{ #category : #menu }
MoosePanel class >> menuOpenGlamorousEditorOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'GlamourousEditor')
		order: 11; 
		parent: #Moose;
		label: GLMEditor new defaultTitle;
		help: 'an editor for creation of moldable tools';
		action: [GLMEditor open]
]

{ #category : #opening }
MoosePanel class >> open [
	^ self new openOn: MooseModel root
]

{ #category : #building }
MoosePanel >> browserActionsIn: aBrowser [
	aBrowser act: [:b | b update] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Update'.
	aBrowser dynamicActions: [:root | 
		MoosePanelCommand allCommands asOrderedCollection collect: [:each | 
			GLMGenericAction new
				title: each new label;
				"category: each new category;"
				action: [each new execute];
				icon: each new icon ]]		
]

{ #category : #building }
MoosePanel >> buildBrowser [
	browser := GLMTabulator new.
	browser title: 'Moose Panel'.
	browser column: #models; column: #details span: 6.
	self browserActionsIn: browser.
	browser transmit to: #models; andShow: [ :a | self modelsIn: a ].
	browser transmit to: #details; from: #models; andShowIfNone: [ :a |
		a custom: (MooseAccumulatingFinder new first noTitle) ].
	browser transmit 
		to: #details port: #entityToSelect;
		from: #models.
	browser transmit 
		from: #details port: #activeEntity;
		to: #models port: #selection.
	^ browser 
]

{ #category : #building }
MoosePanel >> modelsIn: composite [
	composite list 
			title: 'Models';
			display: [:root | root entities];
			format: #name;
			updateOn: MooseEntityAdded from: [ :root | root announcer ];
			updateOn: MooseEntityRemoved from: [ :root | root announcer ];
			updateOn: MooseEntityRenamed fromAll: [ :root | root entities collectAsSet: #announcer ];
			dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ]
]
