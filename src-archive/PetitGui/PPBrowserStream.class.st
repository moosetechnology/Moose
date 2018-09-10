"
Provides a stream compatible with PPStream with additional abilities for display in parser inspections.

Check conversions:

- asExecutionTrace
- asFrequencyTable
- asPositionDrawing
- asPositionMorph

the is also support for clicking on representations.
 
"
Class {
	#name : #PPBrowserStream,
	#superclass : #PPStream,
	#instVars : [
		'positions',
		'stamps',
		'parsers'
	],
	#category : #'PetitGui-Core'
}

{ #category : #converting }
PPBrowserStream >> asExecutionTrace [
	| trace |
	trace := OrderedCollection new: parsers size.
	1 to: parsers size do: [ :index | 
		| parser |
		parser := parsers at: index.
		parser name
			ifNotNil: [ 
				| start stop |
				start := positions at: index.
				stop := positions at: index + 1 ifAbsent: [ self size ].
				trace addLast: (Array with: parser with: start with: stop) ] ].
	^ trace
]

{ #category : #converting }
PPBrowserStream >> asFrequencyTable [
	| bag total result |
	bag := parsers asBag.
	result := OrderedCollection new.
	bag isEmpty ifTrue: [ ^ result ].
	total := 100.0 / bag size.
	bag sortedCounts 
		do: [ :each | result addLast: (Array with: each value with: each key with: total * each key) ].
	^ result
]

{ #category : #converting }
PPBrowserStream >> asPositionDrawing [
	| stream source last |
	stream := WriteStream on: String new.
	source := self contents readStream.
	last := 0.
	[ source atEnd ] whileFalse: [
		[ source atEnd not and: [ source peek isSeparator ] ]
			whileTrue: [ source next ].
		stream nextPutAll: '\fill [source] ('; print: source position / 100.0; nextPutAll: ', 0) rectangle ('.
		[ source atEnd not and: [ source peek isSeparator not ] ]
			whileTrue: [ source next ].
		stream print: source position / 100.0; nextPutAll: ', '; print: self positions size / 100.0; nextPutAll: ');'; cr ].
	stream nextPutAll: '\draw [parser] (0, 0)'.
	1 to: self positions size do: [ :index |
		last <= (self positions at: index)
			ifTrue: [ stream nextPutAll: ' --' ].
		last := self positions at: index.
		stream nextPutAll: ' ('; print: last / 100.0; nextPutAll: ', '; print: index / 100.0; nextPut: $) ].
	stream nextPut: $;.
	^ stream contents
]

{ #category : #converting }
PPBrowserStream >> asPositionMorph [
	| width height canvas morph |
	width := self size + 1 min: 4096.
	height := self positions size min: 32768.
	canvas := FormCanvas extent: width @ height.
	self contents keysAndValuesDo: [ :index :char |
		char isSeparator 
			ifFalse: [ canvas line: index @ 1 to: index @ height color: Color paleBlue ] ].
	1 to: height do: [ :index |
		canvas form colorAt: (self positions at: index) @ index put: Color black ].
	morph := canvas form asMorph.
	morph 
		on: #mouseDown
		send: #mouseDown:with:
		to: self.
	^ morph
]

{ #category : #converting }
PPBrowserStream >> asTimingTable [
	| bag total result |
	bag := Bag new.
	1 to: stamps size - 1 do: [ :index |
		bag
			add: (parsers at: index) 
			withOccurrences: (stamps at: index + 1) - (stamps at: index) ].
	total := stamps last - stamps first.
	result := OrderedCollection new.
	bag sortedCounts
		do: [ :each | result addLast: (Array with: each value with: each key with: total * each key) ].
	^ result
]

{ #category : #accessing }
PPBrowserStream >> displayName [
	^self class name
]

{ #category : #private }
PPBrowserStream >> mouseDown: anEvent with: aMorph [
	| location string parser |
	location := anEvent position.
	string := collection 
		copyFrom: (location x - 5 min: collection size max: 1) asInteger
		to: (location x + 5 min: collection size max: 1) asInteger.
	parser := parsers at: location y
]

{ #category : #accessing }
PPBrowserStream >> next [
	| result |
	result := super next.
	self step.
	^ result
]

{ #category : #accessing }
PPBrowserStream >> next: aNumber [
	| result |
	result := super next: aNumber.
	self step.
	^ result
]

{ #category : #information }
PPBrowserStream >> parsers [
	^ parsers
]

{ #category : #positioning }
PPBrowserStream >> position: aNumber [
	super position: aNumber.
	self step
]

{ #category : #information }
PPBrowserStream >> positions [
	^ positions
]

{ #category : #'*petitgui-debug' }
PPBrowserStream >> progressIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite morph 
		title: 'Progress';
		display: [:result :sample :stream :parser  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: self asPositionMorph.
			morph ]
]

{ #category : #positioning }
PPBrowserStream >> reset [
	super reset.
	positions := OrderedCollection new: 1024.
	stamps := OrderedCollection new: 1024.
	parsers := OrderedCollection new: 1024
]

{ #category : #information }
PPBrowserStream >> stamps [
	^ stamps
]

{ #category : #private }
PPBrowserStream >> step [
	positions addLast: position.
	stamps addLast: Time millisecondClockValue.
	(thisContext findContextSuchThat: [ :ctxt | ctxt receiver isKindOf: PPSea ])
		ifNotNil: [ :aContext | parsers addLast: aContext receiver ].
]

{ #category : #'*petitgui-debug' }
PPBrowserStream >> tallyIn: composite [
	<gtInspectorPresentationOrder: 30>

	composite table 
		title: 'Tally';
		column: 'Parser' evaluated: [ :each | each first displayName ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTable ];
		noSelection;
		showOnly: 50
]
