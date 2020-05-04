"
self openOn: MooseModel root allModels last
"
Class {
	#name : #MooseClassHierarchyBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseClassHierarchyBrowser >> buildBrowser [
	browser := GLMTabulator new title: 'Hierarchies'.
	self browserActions.
	browser
		row: [ :r | 
					r
						column: #types;
						column: #methods ];
		row: #details.
	browser transmit
		to: #types;
		andShow: [ :a | self typesIn: a ].
	browser transmit
		from: #types;
		to: #methods;
		andShow: [ :a | self methodsIn: a ].
	browser transmit
		from: #types;
		from: #methods;
		to: #details;
		andShow: [ :a | self detailsIn: a ].
	browser transmit
		to: #types port: #selection;
		fromOutsidePort: #typeToSelect.
	^ browser
]

{ #category : #building }
MooseClassHierarchyBrowser >> detailsIn: a [
	a text
		title: 'Method source';
		display: [ :type :method | method formattedSourceText ].
	a text
		title: 'Type source';
		allowNil;
		display: [ :type | type formattedSourceText ].
	a
		custom:
			(MooseFileSourceAnchorViewer new browser
				title: 'Method file source';
				display: [ :type :method | method ifNotNil: [ method sourceAnchor ] ];
				when: [ :type :method | method isNotNil ]).
	a
		custom:
			(MooseFileSourceAnchorViewer new browser
				title: 'Type file source';
				allowNil;
				display: [ :type | type sourceAnchor ])
]

{ #category : #building }
MooseClassHierarchyBrowser >> methodsIn: a [
	^ a list
		title: 'Methods';
		display: [ :type | type methods ];
		format: #name;
		sorted: [ :m1 :m2 | m1 name < m2 name ]
]

{ #category : #building }
MooseClassHierarchyBrowser >> typesIn: a [
	^ a tree
		display: [ :model | model allTypes select: [ :each | each isRoot ] ];
		title: 'Types';
		dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
		format: [:each | 
			each isStub ifTrue: [ Text 
					string: each mooseName
					attribute: TextColor gray ]
		ifFalse: [ Text fromString: each mooseName ] ];
		sorted: [ :type1 :type2 | type1 mooseName < type2 mooseName ];
		children: [ :each | each subclassHierarchy ]
]
