Class {
	#name : #REPConcernBrowser,
	#superclass : #GLMBrowserTemplate,
	#instVars : [
		'root'
	],
	#category : #'Arki-Reporter-Browser'
}

{ #category : #'as yet unclassified' }
REPConcernBrowser class >> openOn: aConcern [
	^ self new openOn: aConcern
]

{ #category : #building }
REPConcernBrowser >> buildBrowser [
	browser := GLMTabulator new.
	browser title: [ :concern | concern label ].
	browser
		column: [ :c | c row: #list span: 4; row: #explanation ];
		column: #results span: 4.
	browser transmit
		to: #list;
		andShow: [ :a | self concernListIn: a ].
	browser transmit
		to: #results;
		from: #list;
		andShow: [ :a | self concernResultsIn: a].
	browser transmit
		to: #explanation;
		from: #list;
		andShow: [ :a | a text display: #explanation ].
	^ browser
]

{ #category : #private }
REPConcernBrowser >> concernListIn: a [
	^ a tree
		title: 'Index';
		display: [ :concern | concern children ];
		children: #children;
		format: [ :concern | concern status label ];
		selectionAct: [ :list | list selection class browse ] entitled: 'Browse implementation';
		selectionAct: [ :list | 
			list selection update. 
			list update ] entitled: 'Update';
		selectionAct: [ :list | list selection result inspect ] entitled: 'Inspect result'
]

{ #category : #private }
REPConcernBrowser >> concernResultsIn: a [
	^ a dynamic
		title: #label;
		display: [ :each | [ each browser noTitle ] 
			on: Error 
			do: [ :err | GLMRubricTextPresentation new display: 'There was an error computing this concern' ]];
		updateOn: REPConcernResultAnnouncement from: [ :concern | concern announcer ]
	"a magritte 
			title: 'Editor';
			updateOn: REPConcernResultAnnouncement from: [:concern | concern announcer ];
			description: #description"
]
