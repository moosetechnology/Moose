"
self open
"
Class {
	#name : #MoosePlayground,
	#superclass : #GTPlayground,
	#category : #'Moose-Finder'
}

{ #category : #'world menu' }
MoosePlayground class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Moose Playground')
		order: 1.0; 
		parent: #Moose;
		label: 'Moose Playground';
		help: 'Plaground enhanced for usage in Moose';
		icon: (MooseIcons mooseIcon scaledToSize: 16@16);
		action:[ MoosePlayground open ];
		withSeparatorAfter
]

{ #category : #building }
MoosePlayground >> compose [
	self title: 'Moose Playground'.
	self
		act: [ :b | b update ]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update'.
	self
		act: [ :b | 
			HelpBrowser open
				selectTopicSatisfying: [ :each | 
					each owner notNil
						and: [ each owner key = GTPlaygroundHelp key
								and: [ each title = 'Overview' ] ] ] ]
		icon: GLMUIThemeExtraIcons glamorousHelp
		entitled: 'Help'.
	self
		act: [ :b | 
			SettingBrowser new
				changePackageSet: {(RPackageOrganizer default packageNamed: 'GT-Playground')};
				open;
				expandAll ]
		icon: (Smalltalk ui icons iconNamed: #smallCogInitialState)
		entitled: 'Global Setting'.
	self
		custom:
			(GTInspector new
				noTitle;
				noActions;
				wantsAutomaticRefresh: true;
				showFirst: [ :composite | 
					(self codeIn: composite)
						title: 'Playground';
						titleIcon: MooseIcons mooseEvaluator;
					addAction:
					(GLMPopupAction new
						action: [ :text :page :popup | 
							MoosePlaygroundCommand new
								on: MooseModel;
								when: #pageAccepted
									do: [ :aMooseModel | 
									| position |
									MooseModel root indexOf: aMooseModel.
									text entity
										saveContent:
											aMooseModel name uncapitalized, ' := MooseModel root at: '
												, (MooseModel root indexOf: aMooseModel) asString , '.'
												, String crlf , text entity content.
									text update ];
								yourself ];
						icon: MooseIcons mooseMetamodelGroup;
						title: 'Model installed';
						yourself).
					self modelsIn: composite.
					(FileSystem workingDirectory gtInspectorItemsIn: composite)
						title: 'Current directory';
						titleIcon: MooseIcons mooseFolder ];
				 yourself);
		when: GLMBrowserClosing
			do: [ :ann | self actOnBrowserClosing: ann ].
	GTInspector isStepRefreshEnabled
		ifTrue: [ self wantsAutomaticRefresh: true.
			self wantsSteps: true.
			self stepTime: GTInspector stepRefreshRate ]
]

{ #category : #building }
MoosePlayground >> modelsIn: composite [
	composite list 
			title: 'Models';
			titleIcon: MooseIcons mooseNavigation;
			display: [:root | MooseModel root entities];
			format: #name;
			updateOn: MooseEntityAdded from: [ :root | MooseModel root announcer ];
			updateOn: MooseEntityRemoved from: [ :root | MooseModel root announcer ];
			updateOn: MooseEntityRenamed fromAll: [ :root | MooseModel root entities collectAsSet: #announcer ];
			dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ];
			dynamicActions: [:root | 
		MoosePanelCommand allCommands asOrderedCollection collect: [:each | 
			GLMGenericAction new
				title: each new label;
				"category: each new category;"
				action: [each new execute];
				icon: each new icon ] ]
]
