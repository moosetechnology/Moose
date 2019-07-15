"
I allow one to type in content and run the parser for the content.

This browser expects an instance of PPParser in the #entity port.

self openOn: PPArithmeticParser new.


"
Class {
	#name : #PPParserInspector,
	#superclass : #GLMCompositePresentation,
	#category : #'PetitGui-Core'
}

{ #category : #'as yet unclassified' }
PPParserInspector class >> exampleOpenOn [
	^ self new openOn: PPArithmeticParser new
]

{ #category : #'as yet unclassified' }
PPParserInspector class >> openOn: aParserInstance [
	^ self new openOn: aParserInstance
]

{ #category : #'private building' }
PPParserInspector >> browserStructureFor: browser [
	browser
		column: #sample;
		column: #inspectors
]

{ #category : #building }
PPParserInspector >> compose [
	"self new openOn: PPArithmeticParser new"

	self title: [ :each | 'Parser Inspector on ' , (each name ifNil: [ each class name ]) ].
	self tabulator
		with: [ :browser | 
			self browserStructureFor: browser.
			browser transmit
				fromOutsidePort: #entity;
				fromOutsidePort: #sampleText;
				to: #sample;
				andShowIfNone: [ :a | self sampleIn: a ].
			browser transmit
				from: #sample port: #text;
				toOutsidePort: #sampleText.
			browser transmit
				from: #sample;
				passivelyFrom: #sample port: #text;
				from: #sample port: #stream;
				fromOutsidePort: #entity;
				to: #inspectors;
				andShow: [ :a | self inspectorsIn: a ].	"result"	"sample text"	"parser stream"	"parser"
			browser transmit
				from: #inspectors;
				to: #sample port: #selectionInterval;
				transformed: [ :debugResult | debugResult ifNotNil: [ debugResult start to: debugResult end ] ] ]
]

{ #category : #'private building' }
PPParserInspector >> debuggerIn: composite [
	composite tree
		title: 'Debugger';
		format: [:resultNode | resultNode formattedText ];
		display: [ :result :sample :stream :parser | {PPParserDebuggerResult parse: sample with: parser } ];
		children: [:resultNode | resultNode children ].
]

{ #category : #'private building' }
PPParserInspector >> inspectorsIn: composite [
	self resultIn: composite.
	self debuggerIn: composite.
	self tallyIn: composite.
	self profileIn: composite.
	self progressIn: composite
]

{ #category : #'private building' }
PPParserInspector >> profileIn: composite [
	composite table 
		title: 'Profile';
		column: 'Parser' evaluated: [ :each | each first displayName ];
		column: 'Time (ms)' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ :result :sample :stream :parser  | stream asFrequencyTable ];
		noSelection;
		showOnly: 50

]

{ #category : #'private building' }
PPParserInspector >> progressChartIn: composite [
	composite morph 
		title: 'Progress';
		display: [ :stream |
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: stream asPositionMorph.
			morph ]
]

{ #category : #'private building' }
PPParserInspector >> progressIn: composite [
	composite morph 
		title: 'Progress';
		display: [:result :sample :stream :parser  | 
			| morph |
			morph := ScrollPane new.
			morph color: UITheme current backgroundColor.
			morph scroller addMorph: stream asPositionMorph.
			morph ]
]

{ #category : #'private building' }
PPParserInspector >> resultIn: composite [
	(composite text)
		title: 'Result';
		display: [ :result :sample :stream :parser | result ];
		act: [ :text :result :sample :stream :parser | result inspect ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect';
		act: [ :text :result :sample :stream :parser | result explore ] icon: GLMUIThemeExtraIcons glamorousSearch entitled: 'Explore'.
]

{ #category : #'private building' }
PPParserInspector >> sampleIn: composite [
	(composite text)
		title: 'Sample';
		display: [:parser :sample | sample ifNil: [''] ];
		allowNil;
		populate: #selection
			icon: GLMUIThemeExtraIcons glamorousPlay
			on: $s
			entitled: 'Parse (s)'
			with: [ :presentation :parser | 
				| stream output |
				stream := PPBrowserStream on: presentation text asString.
				output := parser parse: stream.
				output isPetitFailure
					ifTrue: [ presentation selectionInterval: (output position + 1 to: output position) ].
				(presentation pane port: #stream) value: stream.
				output ]
]

{ #category : #'private building' }
PPParserInspector >> tallyIn: composite [
	composite table 
		title: 'Tally';
		column: 'Parser' evaluated: [ :each | each first displayName ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [:result :sample :stream :parser | stream asFrequencyTable ];
		noSelection;
		showOnly: 50
]
