"
self new browser openOn: (RBBrowserEnvironment new forPackageNames: #('Glamour'))
"
Class {
	#name : #GLMSTBrowserExample,
	#superclass : #Object,
	#category : #'Glamour-Examples-Extras'
}

{ #category : #accessing }
GLMSTBrowserExample >> browser [
	"
	self new browser openOn: (BrowserEnvironment new forPackageNames: #('Glamour'))
	"

	| browser |
	browser := GLMTabulator new.
	browser
		row: [ :row | 
			row
				column: #category;
				column: #class;
				column: #protocol;
				column: #selector ].
	browser row: #source.	" categories "
	browser transmit
		to: #category;
		andShow: [ :a | self categoriesIn: a ].
	browser transmit
		to: #class;
		from: #outer port: #entity;
		from: #category;
		andShow: [ :a | self classesIn: a ].
	browser transmit
		to: #protocol;
		from: #outer port: #entity;
		from: #class;
		andShow: [ :a | self protocolsIn: a ].
	browser transmit
		to: #selector;
		from: #outer port: #entity;
		from: #class;
		from: #protocol;
		andShow: [ :a | self methodsIn: a ].
	browser transmit
		to: #source;
		from: #category;
		from: #class;
		from: #selector;
		andShow: [ :a | self sourceIn: a ].
	^ browser
]

{ #category : #accessing }
GLMSTBrowserExample >> categoriesIn: a [
	^ a list display: [ :environment | environment categories ]
]

{ #category : #accessing }
GLMSTBrowserExample >> classesIn: a [
	a list
		title: 'Instance';
		display: [ :environment :category | (environment classes reject: [ :each | each isMeta ]) select: [ :each | each category = category ] ];
		sorted: [ :a1 :b | a1 name < b name ];
		format: [ :class | class name ].
	^ a list
		title: 'Class';
		display: [ :environment :category | (environment classes select: [ :each | each isMeta ]) select: [ :each | each theNonMetaClass category = category ] ];
		sorted: [ :a1 :b | a1 name < b name ];
		format: [ :class | class theNonMetaClass name ]
]

{ #category : #accessing }
GLMSTBrowserExample >> complexityIn: a [
	^ a roassal2
		title: 'Complexity';
		useExplicitNotNil;
		initializeView: [ RTMondrian new ];
		painting: [ :view :category :class :selector | 
					view nodeShape
						height: [ :model | model linesOfCode min: 50 max: 5 ];
						width: [ :model | model instVarNames size + 5 ];
						fillColor: [ :model | 
									model = class
										ifTrue: [ Color red ]
										ifFalse: [ Color white ] ].
					view
						nodes:
							(((Smalltalk organization listAtCategoryNamed: category) collect: [ :each | Smalltalk classNamed: each ])
								reject: [ :each | each isTrait ]).
					view edges connectFrom: [ :each | each superclass ].
					view treeLayout ];
		when: [ :category :class :selector | category notNil ]
]

{ #category : #accessing }
GLMSTBrowserExample >> methodsIn: a [
	a list
		useExplicitNotNil;
		when: [ :environment :class :protocol | class notNil and: [ protocol notNil ] ];
		display: [ :environment :class :protocol | environment selectorsFor: protocol in: class ];
		sorted.
	^ a list
		useExplicitNotNil;
		when: [ :environment :class :protocol | class notNil and: [ protocol isNil ] ];
		display: [ :environment :class :protocol | environment selectorsForClass: class ];
		sorted
]

{ #category : #accessing }
GLMSTBrowserExample >> protocolsIn: a [
	^ a list
		when: [ :environment :class | class notNil ];
		display: [ :environment :class | environment protocolsFor: class ];
		sorted
]

{ #category : #accessing }
GLMSTBrowserExample >> sourceIn: a [
	a text
		title: 'Source';
		useExplicitNotNil;
		when: [ :category :class :selector | class notNil and: [ selector notNil ] ];
		display: [ :category :class :selector | class sourceCodeAt: selector ifAbsent: [ String new ] ].
	a text
		title: 'Source';
		useExplicitNotNil;
		when: [ :category :class :selector | class notNil and: [ selector isNil ] ];
		display: [ :category :class :selector | class definition ].
	^ self complexityIn: a
]
