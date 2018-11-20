"
This defines a parser for the MSE format.

Instance Variables:
	elements	<BalloonBezierSimulation | BalloonLineSimulation | Character class | ECMenuMorph | FMSingleEdgeStrategy | GLMSelectedTextChanged | LineSegment | MABreadthFirstSearchPath | MADijkstra | PPParser | REPHudson | SHRange | Stopwatch | Timespan>
	element	<Heap | PPParser | RecordingControlsMorph>
	elementName	<ProtoObject | PseudoContext>
	elementId	<PPParser>
"
Class {
	#name : #PPMSEGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'elements',
		'element',
		'attributeValue',
		'attribute',
		'elementName',
		'primitive',
		'reference',
		'id',
		'string',
		'number',
		'boolean',
		'integerReference',
		'nameReference',
		'open',
		'close',
		'simpleName',
		'natural',
		'e',
		'stringText'
	],
	#category : #PetitMSE
}

{ #category : #grammar }
PPMSEGrammar >> attribute [
	^ (open , simpleName , attributeValue , close) trim
]

{ #category : #grammar }
PPMSEGrammar >> attributeValue [
	^ (primitive / reference / element) star
]

{ #category : #basic }
PPMSEGrammar >> boolean [ 
	^ ('true' asParser / 'false' asParser) flatten token trim
]

{ #category : #basic }
PPMSEGrammar >> close [
	^ $) asParser trim
]

{ #category : #basic }
PPMSEGrammar >> e [
	^ ($e asParser / $E asParser) , ($- asParser / $+ asParser) optional , natural
]

{ #category : #grammar }
PPMSEGrammar >> element [
	^ (open , elementName , id optional , attribute star , close) trim
]

{ #category : #basic }
PPMSEGrammar >> elementName [
	^ (#word asParser star flatten , 
		( $. asParser , #word asParser star flatten ) optional) token trim
]

{ #category : #grammar }
PPMSEGrammar >> elements [
	^ open , element star , close
]

{ #category : #grammar }
PPMSEGrammar >> id [
	^ open , 'id:' asParser , #digit asParser star token trim , close
]

{ #category : #grammar }
PPMSEGrammar >> integerReference [ 
	^ (open , 'ref:' asParser , natural trim , close) token trim
]

{ #category : #grammar }
PPMSEGrammar >> nameReference [ 
	^ open , 'ref:' asParser , elementName trim , close
]

{ #category : #basic }
PPMSEGrammar >> natural [
	^ #digit asParser plus flatten trim
]

{ #category : #basic }
PPMSEGrammar >> number [
	^ ($- asParser optional , natural , ($. asParser , natural , e optional) optional) flatten token trim
]

{ #category : #basic }
PPMSEGrammar >> open [
	^ $( asParser trim
]

{ #category : #basic }
PPMSEGrammar >> primitive [ 
	^ string / number / boolean" , unlimited"
]

{ #category : #grammar }
PPMSEGrammar >> reference [ 
	^ integerReference / nameReference
]

{ #category : #basic }
PPMSEGrammar >> simpleName [
	^ #word asParser star flatten token trim
]

{ #category : #accessing }
PPMSEGrammar >> start [ 
	^ elements end
]

{ #category : #basic }
PPMSEGrammar >> string [
	^ ($' asParser , stringText , $' asParser) trim
]

{ #category : #basic }
PPMSEGrammar >> stringText [
	^ ('''''' asParser / $' asParser negate) star flatten token
]
