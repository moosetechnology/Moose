Extension { #name : #PPParserDebuggerResult }

{ #category : #'*petitgui' }
PPParserDebuggerResult >> findStream [
	
	stream ifNil: [ ^ parent ifNotNil: [ parent findStream ] ].
	^ stream
]

{ #category : #'*petitgui' }
PPParserDebuggerResult >> findStreamContents [
	^ (self findStream ifNotNil: [ :s | s contents ]) ifNil: [ '' ]
]

{ #category : #'*petitgui' }
PPParserDebuggerResult >> gtDebugView: composite [
	<gtInspectorPresentationOrder: 40>

	| browser |
	browser := 
		composite tabulator.

	browser title: 'Debug View'.
	browser row: #tree;
			  row: #source.
				
	browser transmit 
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:debuggingResult | 
			(debuggingResult isNil or: [ debuggingResult start isNil or: [ debuggingResult end isNil ] ])
			ifTrue: [ 1 to: 0 ]
			ifFalse: [debuggingResult start to: debuggingResult end]
		].

	browser transmit
		to: #source;
		andShow: [ :a |  self sampleIn: a ].
	
	browser transmit 
		to: #tree;
		andShow: [ :a | self treeViewIn: a ].
		
	browser startOn: self
]

{ #category : #'*petitgui' }
PPParserDebuggerResult class >> gtExampleAlmostArithmetic [
	<gtExample>
	<label: 'Incomplete arithmetic expression'>
	
	^ PPParserDebuggerResult 
		parse: '1 + ' 
		with: PPArithmeticParser new
]

{ #category : #'*petitgui' }
PPParserDebuggerResult class >> gtExampleArithmetic [
	<gtExample>
	<label: 'Arithmetic expression'>
	
	^ PPParserDebuggerResult 
		parse: '1 + 2' 
		with: PPArithmeticParser new
]

{ #category : #'*petitgui' }
PPParserDebuggerResult class >> gtExampleNoNumber [
	<gtExample>
	<label: 'Result with #Number expected, but #String given'>
	
	^ PPParserDebuggerResult 
		parse: 'hello world' 
		with: (PPArithmeticParser new productionAt: #number)
]

{ #category : #'*petitgui' }
PPParserDebuggerResult class >> gtExampleNumber [
	<gtExample>
	<label: 'Result with #Number'>
	
	^ PPParserDebuggerResult 
		parse: '123' 
		with: (PPArithmeticParser new productionAt: #number)
]

{ #category : #'*petitgui' }
PPParserDebuggerResult >> sampleIn: composite [

	(composite text)
		title: 'Sample';
		display: [:res | res findStreamContents ];
		allowNil.
]

{ #category : #'*petitgui' }
PPParserDebuggerResult >> stream [
	
	^ stream
]

{ #category : #'*petitgui' }
PPParserDebuggerResult >> stream: anObject [
	
	stream := anObject
]

{ #category : #'*petitgui' }
PPParserDebuggerResult >> treeViewIn: composite [
	composite tree
		title: 'Execution Traces';
		format: [:resultNode | resultNode formattedText ];
		children: [:resultNode | resultNode children ]. 
]
