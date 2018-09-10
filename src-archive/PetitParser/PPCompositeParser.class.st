"
A PPCompositeParser is composed parser built from various primitive parsers. 

Every production in the receiver is specified as a method that returns its parser. Note that every production requires an instance variable of the same name, otherwise the production is not cached and cannot be used in recursive grammars. Productions should refer to each other by reading the respective inst-var. Note: these inst-vars are typically not written, as the assignment happens in the initialize method using reflection.

The start production is defined in the method start. It is aliased to the inst-var parser defined in the superclass of PPCompositeParser.
"
Class {
	#name : #PPCompositeParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'dependencies'
	],
	#category : #'PetitParser-Tools'
}

{ #category : #accessing }
PPCompositeParser class >> dependencies [
	"Answer a collection of PPCompositeParser classes that this parser directly dependends on. Override this method in subclasses to declare dependent parsers. The default implementation does not depend on other PPCompositeParser."

	^ #()
]

{ #category : #accessing }
PPCompositeParser class >> ignoredNames [
	"Answer a collection of instance-variables that should not be automatically initialized with productions, but that are used internal to the composite parser."

	^ PPCompositeParser allInstVarNames
]

{ #category : #'instance creation' }
PPCompositeParser class >> new [
	"Answer a new parser starting at the default start symbol."

	^ self newStartingAt: self startSymbol
]

{ #category : #'instance creation' }
PPCompositeParser class >> newStartingAt: aSymbol [
	"Answer a new parser starting at aSymbol. The code makes sure to resolve all dependent parsers correctly."

	| parsers remaining |
	parsers := IdentityDictionary new.
	remaining := OrderedCollection with: self.
	[ remaining isEmpty ] whileFalse: [
		| dependency |
		dependency := remaining removeLast.
		(parsers includesKey: dependency) ifFalse: [
			parsers at: dependency put: dependency basicNew.
			remaining addAll: dependency dependencies ] ].
	parsers keysAndValuesDo: [ :class :parser |
		| dependencies |
		dependencies := IdentityDictionary new.
		class dependencies 
			do: [ :dependency | dependencies at: dependency put: (parsers at: dependency) ].
		parser 
			initializeStartingAt: (class == self
				ifTrue: [ aSymbol ]
				ifFalse: [ class startSymbol ]) 
			dependencies: dependencies ].
	parsers keysAndValuesDo: [ :class :parser |
		parser setParser: (parser perform: parser children first name).
		parser productionNames keysAndValuesDo: [ :key :value |
			(parser instVarAt: key) setParser: (parser perform: value) ] ].
	^ parsers at: self
]

{ #category : #parsing }
PPCompositeParser class >> parse: anObject [
	^ self parse: anObject startingAt: self startSymbol
]

{ #category : #parsing }
PPCompositeParser class >> parse: anObject onError: aBlock [
	^ self parse: anObject startingAt: self startSymbol onError: aBlock
]

{ #category : #parsing }
PPCompositeParser class >> parse: anObject startingAt: aSymbol [
	^ (self newStartingAt: aSymbol) parse: anObject
]

{ #category : #parsing }
PPCompositeParser class >> parse: anObject startingAt: aSymbol onError: aBlock [
	^ (self newStartingAt: aSymbol) parse: anObject onError: aBlock
]

{ #category : #accessing }
PPCompositeParser class >> startSymbol [
	"Answer the method that represents the default start symbol."

	^ #start
]

{ #category : #querying }
PPCompositeParser >> dependencyAt: aClass [
	"Answer the dependent parser aClass. Throws an error if this parser class is not declared in the method #dependencies on the class-side of the receiver."
	
	^ dependencies at: aClass ifAbsent: [ self error: 'Undeclared dependency in ' , self class name , ' to ' , aClass name ]
]

{ #category : #initialization }
PPCompositeParser >> initializeStartingAt: aSymbol dependencies: aDictionary [
	self initialize.
	parser := PPDelegateParser named: aSymbol.
	self productionNames keysAndValuesDo: [ :key :value |
		self instVarAt: key put: (PPDelegateParser named: value) ].
	dependencies := aDictionary
]

{ #category : #querying }
PPCompositeParser >> productionAt: aSymbol [
	"Answer the production named aSymbol."
	
	^ self productionAt: aSymbol ifAbsent: [ nil ]
]

{ #category : #querying }
PPCompositeParser >> productionAt: aSymbol ifAbsent: aBlock [
	"Answer the production named aSymbol, if there is no such production answer the result of evaluating aBlock."
	
	(self class ignoredNames includes: aSymbol asString)
		ifTrue: [ ^ aBlock value ].
	(self class startSymbol = aSymbol)
		ifTrue: [ ^ parser ].
	^ self instVarAt: (self class allInstVarNames
		indexOf: aSymbol asString
		ifAbsent: [ ^ aBlock value ])
]

{ #category : #querying }
PPCompositeParser >> productionNames [
	"Answer a dictionary of slot indexes and production names."
	
	| productionNames ignoredNames |
	productionNames := Dictionary new.
	ignoredNames := self class ignoredNames
		collect: [ :each | each asSymbol ].
	self class allInstVarNames keysAndValuesDo: [ :key :value |
		(ignoredNames includes: value asSymbol)
			ifFalse: [ productionNames at: key put: value asSymbol ] ].
	^ productionNames
]

{ #category : #accessing }
PPCompositeParser >> start [
	"Answer the production to start this parser with."
	
	self subclassResponsibility
]
