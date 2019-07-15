"
This is the abstract browser for browsing the source code of a FAMIX model. Look at the subclasses for the actual browsers.
"
Class {
	#name : #MooseCodeBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseCodeBrowser >> browserActions [
]

{ #category : #building }
MooseCodeBrowser >> buildBrowser [
	browser := GLMTabulator new.
	browser title: 'Moose Code Browser'.
	self browserActions.
	self layout.
	self onPackages.
	self onClassesFromPackages.
	self onInstVarsFromClasses.
	self onMethodsFromClasses.
	self onMethodsFromInstVars.
	self onDetailsFromPackagesFromClassesFromMethods.
	browser transmit fromOutsidePort: #focusOnNamespace; to: #packages port: #selection.
	browser transmit to: #packages port: #selection; fromOutsidePort: #focusOnClass; transformed: [:class | self parentOfClass: class ].
	browser transmit to: #classes port: #selection; fromOutsidePort: #focusOnClass.
	
	browser transmit toOutsidePort: #focusOnMethod; from: #details port: #focusOnMethod; transformed: [:m | m ].
	browser transmit to: #packages port: #selection; fromOutsidePort: #focusOnMethod; transformed: [:method | self parentOfClass: method belongsTo ].
	browser transmit to: #classes port: #selection; fromOutsidePort: #focusOnMethod; transformed: [:method | method belongsTo ].
	browser transmit to: #methods port: #selection; fromOutsidePort: #focusOnMethod; transformed: [:method | method ]
]

{ #category : #private }
MooseCodeBrowser >> instanceString [
	^ 'INST'
]

{ #category : #building }
MooseCodeBrowser >> layout [
	browser
		column: #packages;
		column: #classes;
		column: [:c | c row: [:r | r column: #methods; column: #instVars]; row: #details] span: 3.
]

{ #category : #private }
MooseCodeBrowser >> metaString [
	^ 'META'
]

{ #category : #building }
MooseCodeBrowser >> onClassesFromPackages [
	browser
		transmit to: #classes; from: #packages;
		andShow: [ :a| 
			a list
					title: 'Classes';
					when: [:scope | scope isCollection not];
					display: [:scope | scope classes];
					dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
					sorted: [:class1 :class2 | class1 name < class2 name ];
					format: [:class | class name]]
]

{ #category : #building }
MooseCodeBrowser >> onDetailsFromPackagesFromClassesFromMethods [
	browser
		transmit to: #details; from: #classes; from: #methods; from: #packages; 
		andShow: [ :a :class :method |
			a text
					title: 'Method';
					format: [ method formattedSourceText ].
			a text
					title: 'Class';
					useExplicitNotNil;
					when: [ class notNil and: [method isNil]];
					format: [ class formattedSourceText ].
"			browser list
					title: 'References';
					useExplicitNotNil;
					when: [:class | class notNil ];
					display: [:class | class references];
					format: [:each | each glmBehavior name, '>>', each name];
					populate: #focusOnMethod on: $f entitled: 'Jump there' with: [:list | list selection ].
"			a list
					title: 'Senders';
					display: [ method invokingMethods ];
					format: [:each | each mooseName ];
					dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
					selectionPopulate: #focusOnMethod on: $f entitled: 'Jump there' with: [:list | list selection ];
					when: [ method invokingMethods notEmpty ].
			a list
					title: 'Messages';
					display: [ method invokedMethods];
					format: [:each | each mooseName ];
					dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
					selectionPopulate: #focusOnMethod on: $f entitled: 'Jump there' with: [:list | list selection ];
					when: [ method invokedMethods notEmpty ].
		]
]

{ #category : #building }
MooseCodeBrowser >> onInstVarsFromClasses [
	browser transmit to: #instVars; from: #classes; andShow: [ :a | 
		a list
				title: 'Attributes';
				display: [ :class | class attributes ];
				format: [:attribute | attribute name ];
				dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
				tags: [ :each | 
					(OrderedCollection 
						with: (each hasClassScope ifTrue: [self metaString] ifFalse: [self instanceString])) 
							addAll: each modifiers; yourself ] ]
]

{ #category : #building }
MooseCodeBrowser >> onMethodsFromClasses [
	browser transmit to: #methods; from: #classes; andShow: [ :a | 
		a list
				title: 'Methods';
				display: [ :class | class methods ];
				format: #name;
				dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
				tags: [ :each | 
					(OrderedCollection 
						with: (each hasClassScope ifTrue: [self metaString] ifFalse: [self instanceString])) 
							addAll: each modifiers; yourself ]
		 ]
]

{ #category : #building }
MooseCodeBrowser >> onMethodsFromInstVars [
	browser transmit to: #methods; from: #instVars; andShow: [ :a | 
		a list
				title: 'Methods';
				display: [ :var | var accessingMethods ];
				format: #name;
				dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
				tags: [ :each | 
					(OrderedCollection 
						with: (each hasClassScope ifTrue: [self metaString] ifFalse: [self instanceString])) 
							addAll: each modifiers; yourself ] ]
]

{ #category : #building }
MooseCodeBrowser >> onPackages [
	browser
		transmit to: #packages;
		andShow: [ :a |
			a tree
				title: 'Packages';
				display: [ :scopes | scopes select: #isRoot ];
				children: [ :scope | scope childScopes ];
				format: [ :scope | scope name ];
				dynamicActionsOnSelection: [ :list | list selection mooseFinderActions ];
				filterOn: [ :text :each | text match: each name ] ]
]

{ #category : #building }
MooseCodeBrowser >> parentOfClass: aClass [
	self subclassResponsibility
]
