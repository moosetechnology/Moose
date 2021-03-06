"
self open
"
Class {
	#name : #MoosePlayground,
	#superclass : #GTPlayground,
	#category : #'Moose-Finder'
}

{ #category : #initialization }
MoosePlayground class >> initialize [
	Smalltalk tools workspaceTool: self
]

{ #category : #'world menu' }
MoosePlayground class >> menuCommandOn: aBuilder [
	<worldMenu>
	^(MooseModel developerTool: self menuCommandOn: aBuilder)
		order: 10 ; 
		help: 'Playground enhanced for usage in Moose' ;
		yourself
]

{ #category : #'world menu' }
MoosePlayground class >> menuLabel [
	^'Moose Playground'
]

{ #category : #'instance creation' }
MoosePlayground class >> open [
	<example>
	^super open
]

{ #category : #building }
MoosePlayground >> codeIn: composite [
	(super codeIn: composite)
		title: 'Playground';
		titleIcon: MooseIcons mooseEvaluator;
		addAction:
			(GLMPopupAction new
				action: [ :text :page :popup | 
					MoosePlaygroundCommand new
						on: MooseModel;
						when: #pageAccepted
							do: [ :aMooseModel | 
							MooseModel root indexOf: aMooseModel.
							text entity saveContent: aMooseModel name uncapitalized , ' := MooseModel root at: ' , (MooseModel root indexOf: aMooseModel) asString , '.' , String crlf , text entity content.
							text update ];
						yourself ];
				icon: MooseIcons mooseMetamodelGroup;
				title: 'Model installed';
				yourself).
				self modelsIn: composite.
					(FileSystem workingDirectory gtInspectorItemsIn: composite)
						title: 'Current directory';
						titleIcon: MooseIcons mooseFolder
]

{ #category : #building }
MoosePlayground >> defaultPlaygroundTitle [
	^ 'Moose Playground'.
	
]

{ #category : #building }
MoosePlayground >> modelsIn: composite [

	composite list
		title: 'Models';
		titleIcon: MooseIcons mooseNavigation;
		display: [ :root | MooseModel root entities ];
		format: #name;
		updateOn: MooseEntityAdded
		from: [ :root | MooseModel root announcer ];
		updateOn: MooseEntityRemoved
		from: [ :root | MooseModel root announcer ];
		updateOn: MooseEntityRenamed
		fromAll: [ :root | 
			MooseModel root entities collectAsSet: #announcer ];
		dynamicActionsOnSelection: [ :list | 
			list selection mooseInterestingEntity mooseFinderActions ];
		dynamicActions: [ :root | 
			(MoosePanelCommand allCommands , MPImportCommand allSubclasses)
				asOrderedCollection collect: [ :each | 
					GLMGenericAction new
						title: each defaultName;
						action: [ each new execute ];
						icon: each defaultIcon ] ]
]
