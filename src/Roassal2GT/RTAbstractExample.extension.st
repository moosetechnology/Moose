Extension { #name : #RTAbstractExample }

{ #category : #'*Roassal2GT-Inspector' }
RTAbstractExample >> gtDisplayExamplesIn: aComposite [

	^ (self gtInspectorPreviewIn: aComposite)
		title: 'E.g'
]

{ #category : #'*Roassal2GT-Inspector' }
RTAbstractExample >> gtInspectorPreviewIn: composite [
	<gtInspectorPresentationOrder: 4>
	^ composite roassal2
		title: 'Examples';
		when: [ self gtExamples notEmpty ];
		send: [ :example | example ];
		painting: [ :view | 
			view @ RTDraggableView.
			self gtOpenOn: view ]
]

{ #category : #'*Roassal2GT-Inspector' }
RTAbstractExample class >> gtInspectorPreviewIn: composite [
	<gtInspectorPresentationOrder: 4>
	<gtInspectorTag: #examples>
	^ self new gtInspectorPreviewIn: composite
]

{ #category : #'*Roassal2GT-Inspector' }
RTAbstractExample >> gtOpenOn: v [
	| icon64Mime form element |
	(self gtExamples
		sorted: [ :a :b | a method selector asLowercase < b method selector asLowercase ])
		do: [ :anExample | 
			[ icon64Mime := self perform: (anExample method selector , #Icon) asSymbol.
			form := TRPlatform current formClass
				fromBinaryStream: (TRPlatform current mimeDecodeToBytes: icon64Mime readStream) ]
				on: Error
				do: [ :exception |  ].	" ignore, continue and use a fallback form "
			form ifNil: [ form := Color red iconOrThumbnailOfSize: 32 ].
			" not all examples stick to the naming convention or simply dont provide an icon, provide a fallback here since RTExampleBrowser is the only entity that depends strongly on icons "
			element := (RTBitmap new form: form) elementOn: anExample.
			element @ (RTPopup new text: anExample method selector asString).
			element @ (RTEventForwarder new eventClass: TRMouseDragging).
			element
				when: TRMouseClick
				do: [ :event | 
					self announcer
						announce:
							(RTExampleOpeningEvent new
								theClass: self className;
								theSelector: anExample method selector) ].
			v add: element ].
	RTGridLayout new
		gapSize: 50;
		on: v elements.
	v elements
		@
			(RTLabeled new
				below;
				fontSize: 10;
				text: [ :m | m method selector asString withoutPrefix: 'example' ])
]
