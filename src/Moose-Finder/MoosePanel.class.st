"
self open
"
Class {
	#name : #MoosePanel,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'world menu' }
MoosePanel class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (MooseModel developerTool: self menuCommandOn: aBuilder)
		  order: 20;
		  help: 'Moose models management';
		  yourself
]

{ #category : #'world menu' }
MoosePanel class >> menuLabel [

	^ 'Moose Panel'
]

{ #category : #opening }
MoosePanel class >> open [

	<example>
	<mooseTool: #'Moose panel'>
	^ self new openOn: MooseModel root
]

{ #category : #building }
MoosePanel >> browserActionsIn: aBrowser [

	aBrowser
		act: [ :b | b update ]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update'.
	aBrowser dynamicActions: [ :root | 
		(MoosePanelCommand allCommands , MiImportCommand allSubclasses)
			asOrderedCollection collect: [ :each | 
			GLMGenericAction new
				title: each defaultName;
				action: [ each new execute ];
				icon: each defaultIcon ] ]
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
