"
I represent a group of examples.

I am particularly useful for manipulating multiple examples at the same time, typically in a user interface (such as the inspector).
"
Class {
	#name : #GtExampleGroup,
	#superclass : #Object,
	#instVars : [
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #examples }
GtExampleGroup class >> gtExampleEmptyGroup [
	<gtExample>
	^ self new examples: #()
]

{ #category : #'instance creation' }
GtExampleGroup class >> withAll: aCollection [
	^ self new examples: aCollection
]

{ #category : #enumerating }
GtExampleGroup >> collect: aBlockClosure [ 
	^ self examples collect: aBlockClosure
]

{ #category : #enumerating }
GtExampleGroup >> directDependenciesFor: aGtExampleWithResult [
	| dependencies |
	dependencies := aGtExampleWithResult directDependencies.
	^ dependencies collect: [ :eachGtExample | 
		self examples 
			detect: [ :eachGtExampleWithResult | 
				(eachGtExampleWithResult methodClass = eachGtExample methodClass)
					and: [ eachGtExampleWithResult selector = eachGtExample selector ] ]
			ifFound: [ :eachGtExampleWithResult | eachGtExampleWithResult ]
			ifNone: [ eachGtExample asExampleWithResult ] ].
]

{ #category : #enumerating }
GtExampleGroup >> do: aBlock [ 
	^ self examples do: aBlock
]

{ #category : #accessing }
GtExampleGroup >> examples [
	^ examples
]

{ #category : #accessing }
GtExampleGroup >> examples: aCollection [
	examples := aCollection collect: [ :each | each asExampleWithResult ]
]

{ #category : #enumerating }
GtExampleGroup >> flatCollect: aBlock [
	^ self examples flatCollect: aBlock
]

{ #category : #enumerating }
GtExampleGroup >> groupedBy: aBlock [ 
	"we are reimplementing this method here and not reuse the one in collection
	because we want the keys to be groups, not simple collections"
	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [ OrderedCollection new ].
		collection add: each].
	result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)].
	^ result
]

{ #category : #ui }
GtExampleGroup >> gtInspectorExamplesIn: composite [
	<gtInspectorPresentationOrder: 1>

	composite wrapper with: [:w | 
		w 
			title: 'Examples (' , self examples size gtDisplayString , ')';
			addAction: self newRunAllAction;
			show: [ :anotherComposite | 
				anotherComposite fastTreeTable
					display: [ self examples ];
					icon: [ :each | each icon ];
					"sorted: [ :a :b | a statusText < b statusText ];"
					children: [ :each | self directDependenciesFor: each ];
					column: 'Status'
						evaluated: [ :each | '' ]
						width: 100
						tags: [ :each | {each statusText} ]
						sortedBy: [ :a :b | a statusText < b statusText ];
					column: 'Result'
						evaluated: [ :each | '' ]
						width: 120
						tags: [ :each | {each resultOrErrorName} ]
						sortedBy: [ :a :b | a resultOrErrorName < b resultOrErrorName ];
					column: 'Selector' 
						evaluated: [ :each | each example selector ];
					column: 'Class'
						evaluated: [ :each | '' ]
						tags: [ :each | { 
							each example methodClass instanceSide name. 
							each example methodProtocol } ]
						sortedBy: [ :a :b | 
							(a example methodClass instanceSide name 
							<= b example methodClass instanceSide name) and: [ 
								a example methodProtocol <= b example methodProtocol ] ];
					enableFilter: [ :example :pattern | 
						self matchesExampleWithResult: example withPattern: pattern ];
					selectionAct: [ :list | 
						list rawSelection run.
						list update.
						(list pane port: #toSelect) value: list rawSelection result returnValue ]
						on: $r
						entitled: 'Run';
					selectionAct: [ :list | 
						list rawSelection debug.
						list update ]
						on: $D
						entitled: 'Debug';
					send: [ :each | 
						(each isKindOf: GtExampleWithResult)
							ifTrue: [ each example ]
							ifFalse: [ each ] ].
				w transmit fromOutsidePort: #toSelect; toOutsidePort: #selection ] ]
]

{ #category : #testing }
GtExampleGroup >> ifEmpty: aBlockClosure [ 
	^ self examples ifEmpty: aBlockClosure 
]

{ #category : #testing }
GtExampleGroup >> isCollection [
	^ true
]

{ #category : #testing }
GtExampleGroup >> matchesExampleWithResult: aGtExampleWithResult withPattern: patternString [ 
	^ aGtExampleWithResult example selector 
			includesSubstring: patternString caseSensitive: false 
]

{ #category : #'instance creation' }
GtExampleGroup >> newRunAllAction [
	^ GLMGenericAction new
				action: [ :wrapper | 
						self examples do: [ :each | each ignoreTest ifFalse: [ each run ] ] 
							displayingProgress: 'Running examples ...'.
						wrapper update ]; 
				shortcut: $R; 
				showTitle: 'Run all';
				iconName: #testGreen;
				yourself
]

{ #category : #enumerating }
GtExampleGroup >> select: aBlock [
	^ self class new examples: (self examples select: aBlock)
]
