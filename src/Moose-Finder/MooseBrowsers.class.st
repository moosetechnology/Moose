"
This class holds a collection of browsers useable on Moose objects.
"
Class {
	#name : #MooseBrowsers,
	#superclass : #Object,
	#category : #'Moose-Finder'
}

{ #category : #famix }
MooseBrowsers >> codeBrowser [
	| browser |
	browser := GLMTabulator new.
	browser title: 'Moose Code Browser'.
	browser
		row: #navigation;
		row: #details.
	browser transmit
		to: #navigation;
		andShow: [ :a | a custom: MooseCodeNavigator new browser ].
	browser transmit
		to: #details;
		from: #navigation port: #class;
		from: #navigation port: #method;
		andShow: [ :a | 
			a text
				title: 'Source';
				display: [ :cls | cls formattedSourceText ];
				useExplicitNotNil;
				when: [ :cls :method | cls isNotNil and: [ method isNil ] ].
			a text
				title: 'Source';
				display: [ :cls :method | method formattedSourceText ] ].
	browser transmit
		toOutsidePort: #namespace;
		from: #navigation port: #namespace.
	browser transmit
		toOutsidePort: #class;
		from: #navigation port: #class.
	browser transmit
		toOutsidePort: #method;
		from: #navigation port: #method.
	browser transmit
		to: #navigation port: #namespaceToSelect;
		fromOutsidePort: #namespaceToSelect.
	browser transmit
		to: #navigation port: #classToSelect;
		fromOutsidePort: #classToSelect.
	browser transmit
		to: #navigation port: #methodToSelect;
		fromOutsidePort: #methodToSelect.
	^ browser
]

{ #category : #famix }
MooseBrowsers >> codeNavigator [
	| browser col |
	browser := GLMTabulator new.
	browser
		column: #namespaces;
		column: #classes;
		column: #methods.
	browser transmit
		to: #namespaces;
		andShow: [ :a | 
			a tree
				display: [ :model | (model allNamespaces select: #isRoot) sorted: [ :x :y | x name < y name ] ];
				children: [ :namespace | namespace childScopes asSortedCollection: [ :x :y | x name < y name ] ];
				format: [ :namespace | namespace stubFormattedName ];
				dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ] ].
	browser transmit
		to: #classes;
		from: #namespaces;
		andShow: [ :a | 
			a tree
				display: [ :namespace | namespace classes asSortedCollection: [ :x :y | x name < y name ] ];
				format: [ :class | class stubFormattedName ];
				dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ] ].
	browser transmit
		to: #methods;
		from: #classes;
		andShow: [ :a | 
			a tree
				display: [ :class | class methods asSortedCollection: [ :x :y | x name < y name ] ];
				format: #stubFormattedName;
				tags: [ :method | 
					col := method modifiers copy.
					method isClassSide ifTrue: [ col add: 'isStatic' ].
					method kind ifNotNil: [ :kind | col add: kind ].
					col ];
				dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ] ].
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

{ #category : #famix }
MooseBrowsers >> duplicationBrowser [
	| browser |
	browser := GLMTabulator new.
	browser title: 'Duplication Browser'.
	browser row: #duplications; row: #diff span: 2.
	browser transmit to: #duplications; andShow: [ :a | a list].
	browser transmit to: #diff; from: #duplications; andShow: [ :a |
		a diff display: [:dup | 
			Array with: dup referenceText with: dup duplicateText ]].
	^ browser
]
