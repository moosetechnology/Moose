"
I am the welcome window that opens when a Moose image
"
Class {
	#name : #MooseWelcome,
	#superclass : #CustomHelp,
	#category : #'Moose-Help'
}

{ #category : #accessing }
MooseWelcome class >> bookName [

	^ 'Moose Tutorial'
]

{ #category : #pages }
MooseWelcome class >> mainTools [

	^ HelpTopic
		  title: 'Main tools'
		  contents: (self heading: 'Main Moose tools')
, 'Some suggestions on what you can do with Moose.'
				
, (self subheading: 'Starting')
, '- First, use the ' , (self doItFrom: 'MiModelRootBrowser open' text: 'model browser') ,
	' to create an internal model of a system.
- You will need to ''Propagate'' this model to other tools.
- Then, you can ' , (self doItFrom: 'MiInspectorBrowser open' text: 'inspect')
, ' the content of your model.
- Keep an eye on opened tools with the ' ,  (self doItFrom: 'MiOverviewBrowser open' text: 'Overview browser.')

, (self subheading: 'Manipulating')
, 'You can:
- Select specific entities in a model with the ' , (self doItFrom: 'MiQueriesBrowser open' text: 'Query browser.')
, '
- Annotate entities with the '  , (self doItFrom: 'MiTagBrowser open' text: 'Tag browser')

, (self subheading: 'Visualization')
, 'There are various visualizations available on different kind of entities:
- ' , (self doItFrom: 'MiHierarchicalVisualizationBrowser open' text: 'Architectural browser')
, '
- '  , (self doItFrom: 'MiCoUsageBrowser open' text: 'CoUsage map browser')
]

{ #category : #'world menu' }
MooseWelcome class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'Moose Help')
		order: -1;
		parent: #Help;
		label: 'Moose help';
		help: 'Open the Moose help documentation';
		icon: (Smalltalk ui icons iconNamed: #smallHelp);
		action: [ self open ]
]

{ #category : #opening }
MooseWelcome class >> open [

	<script>
	| browser |
	browser := (HelpBrowser openOn: self) next.

	"Resize  browser"
	browser window extent: 700 @ 500.

	^ browser
]

{ #category : #opening }
MooseWelcome class >> openForRelease [

	<script>
	| browser |
	"Close existing MooseHelp if there is one"
	self currentWorld systemWindows
		detect: [ :each | each label = self bookName ]
		ifFound: [ :oldWindow | oldWindow delete ].

	browser := self open.

	"Position browser"
	browser window center: Display extent / 2
]

{ #category : #pages }
MooseWelcome class >> pages [

	^ #( welcome mainTools )
]

{ #category : #pages }
MooseWelcome class >> welcome [

	| version |
	version := MooseVersion current.

	^ HelpTopic
		  title: 'Welcome to Moose ' , version major
		  contents: (self
				   heading: 'Moose ' , version versionNumber
				   withSubtitle: 'commit: ' , version commitHash printString)
			  , 'Moose is a platform for software analysis.

It allows to represent software system in a model, to query, manipulate, transform, visualize this model.

Moose based on Pharo and it''s open source under BSD/MIT.

For more information, please visit here: '
			  , (self url: 'https://modularmoose.org/moose-wiki/')
			  , (self subheading: 'Quick setup')
			  , 'Create or load a model with the '
			  ,
			  (self doItFrom: 'MiModelRootBrowser open' text: 'model browser')
]
