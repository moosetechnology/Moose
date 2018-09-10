"
I am the super class of all the roassal examples.

Try to use this script to know the excecution of roassal examples 

| examples errors |
examples := OrderedCollection new.
errors := OrderedCollection new.
(RTAbstractExample subclasses collect: #new) 
	do: [ :example | 
		example gtExamples do: [:met | | time builder |
			time := DateAndTime now.
			[builder := example perform: met selector.
			(builder isKindOf: RTBuilder) 
				ifTrue: [ builder build ].
			time := DateAndTime now - time.
			time > (1 asDuration)
				ifTrue: [ examples add: met->time ]
			] on: Error do: [ errors add: met ] ] ]
	displayingProgress: 'Running examples'.
examples->errors
"
Class {
	#name : #RTAbstractExample,
	#superclass : #RTObject,
	#classVars : [
		'ExampleAnnouncer'
	],
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #announcement }
RTAbstractExample class >> announcer [
	ExampleAnnouncer ifNil: [ ExampleAnnouncer := Announcer new ].
	^ ExampleAnnouncer
]

{ #category : #utility }
RTAbstractExample class >> createIcon [
	"Execute and select part of the screen (your cursor will change), then you will get inspector on base64 representation of the selection"

	<script>
	| memFile |
	memFile := FileSystem memory / 'icon.png'.
	PNGReadWriter putForm: Form fromUser onStream: memFile writeStream binary.
	(Base64MimeConverter mimeEncode: memFile readStream binary) contents inspect
]

{ #category : #announcement }
RTAbstractExample class >> initialize [
	self announcer when: Announcement do: [ :announcement | 
			"RTEventCollector uniqueInstance add: announcement" ]
]

{ #category : #examples }
RTAbstractExample class >> runningAllExamples [
	<todo: 'deprecated (?) since the new GTExample API / UI-Runner is coming soon ...'>
	"
	self runningAllExamples
	"

	"Useful to find examples that may trigger an error"
	
	| examples result w |
	w := '/tmp/result.txt' asFileReference writeStream.
	self allSubclasses do: [ :cls |
		examples := cls selectors select: [ :k |( k beginsWith: 'example')  and: [ (k endsWith: 'Icon') not ] ].
		examples do: [ :k | 
			w nextPutAll: 'About to run ', cls name, '>>', k, ' ...'.
			result := cls new perform: k.
			[ result class == RTView or: [ result isKindOf: RTBuilder ] ] assert.
			w nextPutAll: 'done!'; cr
		] ]
]

{ #category : #announcement }
RTAbstractExample >> announcer [
	"Return the announcer responsible to emit example-related events"
	^ self class announcer
]

{ #category : #installing }
RTAbstractExample >> installOn: aView [
	| el |
	el := (RTLabel new text: (self label)) element.
	el @ RTHighlightable.
	aView add: el.
	
	el when: TRMouseClick do: [ :evt |
		aView clean.
		self openOn: aView.
		aView canvas camera focusOnCenter.
	].

]

{ #category : #installing }
RTAbstractExample >> installTitle: aTitle code: sourceCode [
	"SourceCode should be a complete example, executable within a workspace"
	
	| viewOrBuilder canvas icon64Mime stream window | 
	viewOrBuilder := ( self class compiler evaluate: sourceCode).
	window := viewOrBuilder open.
	viewOrBuilder class == RTView 
		ifTrue: [ canvas := viewOrBuilder canvas ]
		ifFalse: [ canvas := viewOrBuilder view canvas ].
	
	canvas morph ifNil: [ self error: 'You have forgotten to open the view!' ].
	
	(self class methodDict includesKey: ('example', aTitle) asSymbol)
		ifTrue: [ self error: 'Title already used. Proceed to override' ].
	
	self class compile: 'example', aTitle, String cr, sourceCode classified: 'sources'.
	
	stream := WriteStream on: ByteArray new.
	TRPlatform current pngReadWriterClass
		putForm: (canvas morph imageForm scaledToSize: 100 @ 100)
		onStream: stream.
	icon64Mime := (TRPlatform current mimeEncode: stream contents readStream) contents.
	self class 
		compile: 'example', aTitle, 'Icon', String cr, '	^ ''', icon64Mime, '''' 
		classified: 'icons'.
	window delete.
]

{ #category : #installing }
RTAbstractExample >> justToTry [


	
	RTGrapherExample new installTitle: 'ForceLayoutWithGreatCharge' 
		code:
		'


	| b |
	b := RTGraphBuilder new.
	b nodes
		shape: (RTEllipse new size: #numberOfMethods);
		whenOverShowEdges: [ :cls | cls dependentClasses ].

	b edges
		connectTo: [ :c | c subclasses ];
		shape: (RTLine new color: Color gray).

	b layout 
		use: (RTForceBasedLayout new charge: -180).

	b global
		minSize: 10;
		normalizeColor: [ :cls | cls methods size ] using: (Array with: Color green with: Color red).

	b addAll: (RTObject withAllSubclasses).
	b open.
	b view canvas'
	
]

{ #category : #accessing }
RTAbstractExample >> label [
	^ 'fill please'
]

{ #category : #'instance creation' }
RTAbstractExample >> open [

	| v |
	v := RTView new.
	v @ RTDraggableView.
	self openOn: v.
	v open.
	
]

{ #category : #'instance creation' }
RTAbstractExample >> openOn: v [

	| exampleSymbols icon64Mime form element  helpBar |

	exampleSymbols := self class selectors 
								select: [ :symbol | (symbol beginsWith: 'example') 
															and: [ (symbol endsWith: 'Icon') not ] ].
	exampleSymbols do: [ :k |
		icon64Mime := self perform: (k, #Icon) asSymbol.
		form := TRPlatform current formClass fromBinaryStream: 
							(TRPlatform current mimeDecodeToBytes: icon64Mime readStream).
		element := (RTBitmap new form: form) element.
		element @ (RTPopup new text: k asString).
		element when: TRMouseLeftClick do: [ :evt | self class new perform: k ].
		element when: TRMouseRightClick do: [ :evt | (self class >> k) browse ].
		element @ (RTEventForwarder new eventClass: TRMouseDragging). 
		v add: element.
	].

	RTGridLayout new on: v elements.
	
	helpBar := TRLabelShape new text: ' Left to run / Right for code'.
	v canvas addFixedShape: helpBar.
	TRConstraint stickAtTheBottomOfTheWindow: helpBar.
	
]
