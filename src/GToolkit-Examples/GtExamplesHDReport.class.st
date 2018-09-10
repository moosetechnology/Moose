"
I create a Hudson report by running examples from a given list of packages. Apart from running an example, if it is a success, I also try to run all inspector presentations for the return value of the example.
"
Class {
	#name : #GtExamplesHDReport,
	#superclass : #HDReport,
	#instVars : [
		'stream',
		'progressFile',
		'examples',
		'executionTime',
		'examplesPosition',
		'examplesErrors',
		'examplesFailures',
		'title'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #running }
GtExamplesHDReport class >> runPackage: aString [
	^ self new 
		initializeExamples: (RPackage organizer packageNamed: aString) gtExamplesContained 
		entitled: aString;
		run
]

{ #category : #running }
GtExamplesHDReport >> begin [
	progressFile nextPutAll: 'running suite: ';
		nextPutAll: 'Examples' ; crlf; flush.
		
	stream := StandardFileStream forceNewFileNamed: 'Examples' , '-Test.xml'.
	stream := MultiByteFileStream newFrom: stream.
	stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf.
	stream nextPutAll: '<testsuite name="'; nextPutAll: (self encode: 'Examples'); 
		nextPutAll: '" tests="'; print: examples size; nextPutAll: '">'.
	
	"Now this is ugly. We want to update the time and the number of failures and errors, but still at the same time stream a valid XML. So remember this position and add some whitespace, that we can fill later."
	examplesPosition := stream position - 1.
	stream nextPutAll: (String new: 100 withAll: $ ); lf
]

{ #category : #private }
GtExamplesHDReport >> beginExample: anExample runBlock: aBlock [
	| time |
	progressFile 
		nextPutAll: 'starting example: ';
		nextPutAll: anExample methodClass name;
		nextPutAll: '>>';
		nextPutAll: anExample selector.
	progressFile nextPutAll: ' ... '; flush.
	time := aBlock timeToRun.
	stream tab; 
		nextPutAll: '<testcase classname="'; 
		nextPutAll: (self encode: (anExample methodClass category copyReplaceAll: '-' with: '.')); 
		nextPut: $.; nextPutAll: (self encode: anExample methodClass name); 
		nextPutAll: '" name="'; nextPutAll: (self encode: anExample selector); 
		nextPutAll: '" time="'; print: (time asMilliSeconds / 1000.0); 
		nextPutAll: '">'; lf
	

]

{ #category : #running }
GtExamplesHDReport >> checkAllPresentationsOf: exampleToTest [
	| browser window failedSelectors |
	exampleToTest class name = #ProtoObject ifTrue: [ ^ self ]. " no longer implemented "
	failedSelectors := OrderedCollection new.
	(Pragma
		allNamed: #gtInspectorPresentationOrder:
		from: exampleToTest class
		to: ProtoObject)
		do: [ :eachPragma | 
			browser := GLMWrapper new.
			 [ browser
				show: [ :composite | 
					(eachPragma methodSelector findTokens: $:) size = 1
						ifTrue: [ exampleToTest perform: eachPragma methodSelector with: composite ].
					(eachPragma methodSelector findTokens: $:) size = 2
						ifTrue: [ exampleToTest
								perform: eachPragma methodSelector
								with: composite
								with: browser ] ].
			window := browser openOn: exampleToTest ]
				on: Error
				do: [ :err | failedSelectors add: eachPragma methodSelector -> err ] 
			].
		window ifNotNil: [ window delete ].
		^ failedSelectors.
]

{ #category : #running }
GtExamplesHDReport >> done [
	"just close the file"
	[ progressFile close ] on: Error do: []
]

{ #category : #running }
GtExamplesHDReport >> end [		
	stream tab; nextPutAll: '<system-out><![CDATA[]]></system-out>'; lf.
	stream tab; nextPutAll: '<system-err><![CDATA[]]></system-err>'; lf.
	stream nextPutAll: '</testsuite>'.
	
	stream position: examplesPosition.
	stream 
"		nextPutAll: ' failures=""'; print: examplesFailures; "
		nextPutAll: '" errors="'; print: examplesErrors; 
		nextPutAll: '" time="'; print: executionTime asMilliSeconds / 1000.0; 
		nextPutAll: '">'.
	stream close.
	
	progressFile 
		nextPutAll: 'finished running suite: ';
		nextPutAll: 'Examples';
		close
]

{ #category : #private }
GtExamplesHDReport >> endExample [
	stream tab; nextPutAll: '</testcase>'; lf.
	progressFile nextPutAll: 'finished' ; crlf; flush.

]

{ #category : #initialization }
GtExamplesHDReport >> examples: aCollection [
	examples := aCollection
]

{ #category : #accessing }
GtExamplesHDReport >> examplesErrors [
	^ examplesErrors
]

{ #category : #accessing }
GtExamplesHDReport >> examplesFailures [
	^ examplesFailures
]

{ #category : #accessing }
GtExamplesHDReport >> examplesPassing [ 
	^ self examplesTotal - self examplesFailures - self examplesErrors
]

{ #category : #accessing }
GtExamplesHDReport >> examplesTotal [
	^ examples size
]

{ #category : #testing }
GtExamplesHDReport >> hasErrors [ 
	^ examplesErrors ~= 0
]

{ #category : #testing }
GtExamplesHDReport >> hasFailures [ 
	^ examplesFailures ~= 0
]

{ #category : #initialization }
GtExamplesHDReport >> initialize [
	super initialize.
	executionTime := 0 asDuration.
	examplesPosition := examplesFailures := examplesErrors := 0.
	progressFile := StandardFileStream forceNewFileNamed: 'progress.log'
	
]

{ #category : #initialization }
GtExamplesHDReport >> initializeExamples: aCollection entitled: aString [
	examples := aCollection.
	title := aString
]

{ #category : #running }
GtExamplesHDReport >> run [
	Author uniqueInstance
		ifUnknownAuthorUse: 'hudson'
		during: [ [ 
			self setUp.
			executionTime := [ self runAll ]
				timeToRun ]
					ensure: [ self tearDown ] ]
]

{ #category : #running }
GtExamplesHDReport >> runAll [
	CurrentExecutionEnvironment runTestsBy: [ 
		examples do: [ :each | each ignoreTest ifFalse: [ self runExample: each ] ]
	]
]

{ #category : #running }
GtExamplesHDReport >> runExample: anExample [
	| errors |
	errors := OrderedCollection new.
	self
		beginExample: anExample
		runBlock: [ | returnValue stack |
			[ returnValue := anExample debug returnValue.
			(self checkAllPresentationsOf: returnValue)
				do: [ :each | 
					stack := each value asString , Character cr asString , Character tab asString , ' in ' , returnValue class name , '>>>' , each key asString.
					errors add: each value -> stack ] ]
				on: Halt , Error , AssertionFailure
				do: [ :err | 
					(anExample exceptions handles: err)
						ifFalse: [ stack := self stackTraceString: err of: anExample.
							errors add: err -> stack ] ] ].
	errors do: [ :each | self writeError: each key andStack: each value for: anExample ].
	
	self endExample
]

{ #category : #running }
GtExamplesHDReport >> serializeError: error of: anExample [
	"We got an error from a test, let's serialize it so we can properly debug it later on..."
	| context testCaseMethodContext |
	
	context := error signalerContext.
	testCaseMethodContext := context findContextSuchThat: [ :ctx| 
		ctx receiver == anExample and: [ ctx methodSelector == #performTest ]].
	context := context copyTo: testCaseMethodContext.
	
	[ FuelOutStackDebugAction
		serializeTestFailureContext: context sender 		
		toFileNamed: anExample methodClass name asString,'-', anExample selector, '.fuel' ] 
	on: Error 
	do: [:err| "simply continue..." ]


]

{ #category : #running }
GtExamplesHDReport >> setUp [
	progressFile nextPutAll: 'running examples: ';
		nextPutAll: title ; crlf; flush.
		
	stream := StandardFileStream forceNewFileNamed: title , '-Test.xml'.
	stream := MultiByteFileStream newFrom: stream.
	stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf.
	stream nextPutAll: '<testsuite name="'; nextPutAll: (self encode: title); 
		nextPutAll: '" tests="'; print: examples size; nextPutAll: '">'.
	
	"Now this is ugly. We want to update the time and the number of failures and errors, but still at the same time stream a valid XML. So remember this position and add some whitespace, that we can fill later."
	examplesPosition := stream position - 1.
	stream nextPutAll: (String new: 100 withAll: $ ); lf.
]

{ #category : #private }
GtExamplesHDReport >> stackTraceString: err of: anExample [
	^ String streamContents: [ :str | 
		| context |
		context := err signalerContext.
		[ context isNil 
			or: [  
				(context methodSelector == #'primitiveProcessExample:withArguments:' and: [ 
					context arguments first = anExample ])
					or: [ context receiver = anExample and: [ context methodSelector = #debug ] ] ] ] whileFalse: [
			str print: context; lf.
			context := context sender ] ] 
]

{ #category : #running }
GtExamplesHDReport >> tearDown [
	stream tab; nextPutAll: '<system-out><![CDATA[]]></system-out>'; lf.
	stream tab; nextPutAll: '<system-err><![CDATA[]]></system-err>'; lf.
	stream nextPutAll: '</testsuite>'.
	
	stream position: examplesPosition.
	stream 
		nextPutAll: ' failures="'; print: examplesFailures; 
		nextPutAll: '" errors="'; print: examplesErrors; 
		nextPutAll: '" time="'; print: executionTime asMilliSeconds / 1000.0; 
		nextPutAll: '">'.
	stream close.
	
	progressFile 
		nextPutAll: 'finished running examples: ';
		nextPutAll: title;
		close
]

{ #category : #private }
GtExamplesHDReport >> writeError: anError andStack: aString for: aTestCase [
	"XML tag is now open"
	anError ifNotNil: [
		(anError isKindOf: AssertionFailure)
			ifTrue: [ self writeFailure: anError stack: aString ]
			ifFalse: [ self writeError: anError stack: aString ] ]
]

{ #category : #private }
GtExamplesHDReport >> writeError: error stack: stack [
	examplesErrors := examplesErrors + 1.
	stream tab; tab; nextPutAll: '<error type="'.
	self writeException: error stack: stack.
	stream nextPutAll: '</error>'; lf
]

{ #category : #private }
GtExamplesHDReport >> writeException: error stack: stack. [

	stream 
		nextPutAll: (self encode: error class name); 
		nextPutAll: '" message="'; nextPutAll: (self encode: (error messageText ifNil: [ error description ])); 
		nextPutAll: '">'; 
		nextPutAll: (self encode: stack).
]

{ #category : #private }
GtExamplesHDReport >> writeFailure: error stack: stack [
	examplesFailures := examplesFailures + 1.
	stream tab; tab; nextPutAll: '<failure type="'.
	self writeException: error stack: stack.  
	stream	nextPutAll: '</failure>'; lf
]
