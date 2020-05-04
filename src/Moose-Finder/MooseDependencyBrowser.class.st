Class {
	#name : #MooseDependencyBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseDependencyBrowser >> buildBrowser [
	"self openOn: MooseModel root allModels last"

	browser := GLMTabulator new.
	browser title: [ :model | 'Dependency Browser on ' , model name ].
	browser
		row: #navigation;
		row: #details.
	browser transmit
		to: #navigation;
		andShow: [ :a | a custom: MooseCodeNavigator new browser ].
	browser transmit
		to: #details;
		from: #outer port: #entity;
		from: #navigation port: #namespace;
		from: #navigation port: #class;
		from: #navigation port: #method;
		andShow: [ :a | self detailsIn: a ].
	browser transmit
		to: #navigation port: #namespaceToSelect;
		from: #details.
	^ browser
]

{ #category : #reusable }
MooseDependencyBrowser >> detailsIn: a [
	a roassal2
		initializeView: [ RTMondrian new ];
		title: 'Map of providers';
		painting: [ :view :model :namespace :class :method | 
			self
				viewNamespaceMapOf: [ :x | x allProvidersAtScope: FamixTNamespace ]
				fromModel: model
				namespace: namespace
				class: class
				method: method
				on: view ];
		allowNil;
		when: [ :model | model isNotNil ].
	a roassal2
		initializeView: [ RTMondrian new ];
		title: 'Map of clients';
		painting: [ :view :model :namespace :class :method | 
			self
				viewNamespaceMapOf: [ :x | x allClientsAtScope: FamixTNamespace ]
				fromModel: model
				namespace: namespace
				class: class
				method: method
				on: view ];
		allowNil;
		when: [ :model | model isNotNil ].
	a text
		title: 'Source code';
		display: [ :model :namespace :class | class formattedSourceText ];
		allowNil;
		when: [ :model :namespace :class :method | class isNotNil and: [ method isNil ] ].
	^ a text
		title: 'Source code';
		display: [ :model :namespace :class :method | method formattedSourceText ]
]

{ #category : #reusable }
MooseDependencyBrowser >> viewNamespaceMapOf: aBlock fromModel: model namespace: namespace class: class method: method on: view [
	| source invokedNamespaces allInvokedNamespaces layoutEdges |
	source := method ifNil: [ class ].
	invokedNamespaces := source
		ifNil: [ #() ]
		ifNotNil: [ aBlock value: source ].
	allInvokedNamespaces := namespace
		ifNil: [ #() ]
		ifNotNil: [ aBlock value: namespace ].
	view shape rectangle
		height: #numberOfClasses;
		width: 7;
		borderColor: Color lightGray;
		fillColor: [ :each | 
			each = namespace
				ifTrue: [ Color blue ]
				ifFalse: [ (invokedNamespaces includes: each)
						ifTrue: [ Color red ]
						ifFalse: [ (allInvokedNamespaces includes: each)
								ifTrue: [ Color lightRed ]
								ifFalse: [ Color white ] ] ] ].
	view nodes: model allNamespaces.
	view shape orthoVerticalLine color: Color veryLightGray.
	layoutEdges := view edgesFrom: #belongsTo.
	view layout tree
		horizontalGap: 1;
		userDefinedEdges: layoutEdges
	"				source ~= namespace ifTrue: [
					view shape splineLine color: Color red.
					view edges: {namespace} from: #yourself toAll: invokedNamespaces ]
"
]
