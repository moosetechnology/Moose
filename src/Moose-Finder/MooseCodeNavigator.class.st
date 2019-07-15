Class {
	#name : #MooseCodeNavigator,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseCodeNavigator >> buildBrowser [
	browser := GLMTabulator new.
	browser
		column: #namespaces;
		column: #classes;
		column: #methods.
	browser transmit
		to: #namespaces;
		andShow: [ :a | self namespacesIn: a ].
	browser transmit
		to: #classes;
		from: #namespaces;
		andShow: [ :a | self classesIn: a ].
	browser transmit
		to: #methods;
		from: #classes;
		andShow: [ :a | self methodsIn: a ].
	browser transmit
		toOutsidePort: #namespace;
		from: #namespaces.
	browser transmit
		toOutsidePort: #class;
		from: #classes.
	browser transmit
		toOutsidePort: #method;
		from: #methods.
	browser transmit
		to: #namespaces port: #selection;
		fromOutsidePort: #namespaceToSelect.
	browser transmit
		to: #classes port: #selection;
		fromOutsidePort: #classToSelect.
	browser transmit
		to: #methods port: #selection;
		fromOutsidePort: #methodToSelect.
	^ browser
]

{ #category : #building }
MooseCodeNavigator >> classesIn: a [
	^ a tree
		title: 'Classes';
		display: [ :namespace | namespace classes asSortedCollection: [ :x :y | x name < y name ] ];
		format: [ :class | class stubFormattedName ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ]
]

{ #category : #building }
MooseCodeNavigator >> methodsIn: a [
	| col |
	^ a tree
		title: 'Methods';
		display: [ :class | class methods asSortedCollection: [ :x :y | x name < y name ] ];
		format: #stubFormattedName;
		tags: [ :method | 
					col := method modifiers copy.
					method hasClassScope
						ifTrue: [ col add: 'isStatic' ].
					method kind notNil
						ifTrue: [ col add: method kind ].
					col ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ]
]

{ #category : #building }
MooseCodeNavigator >> namespacesIn: a [
	^ a tree
		title: 'Namespaces';
		display: [ :model | (model allNamespaces select: #isRoot) sorted: [ :x :y | x name < y name ] ];
		children: [ :namespace | namespace childScopes asSortedCollection: [ :x :y | x name < y name ] ];
		format: [ :namespace | namespace stubFormattedName ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ]
]
