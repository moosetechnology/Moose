Extension { #name : #AbstractFileReference }

{ #category : #'*SmaCC_Debugging_Support' }
AbstractFileReference >> gtParseInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	| extension tabulator |
	extension := self extension.
	extension isEmpty
		ifTrue: [ ^ self ].
	extension := '.' , extension.
	SmaCCParser allSubclasses
		do: [ :parser | 
			(parser fileExtensions includes: extension)
				ifTrue: [ tabulator := composite tabulator.
					tabulator
						title: [ parser name asString ];
						row: #buttons size: 35;
						row: #result.
					tabulator transmit
						to: #buttons;
						andShow: [ :presentation | 
							presentation actionList
								act: [ :l | 
									((tabulator paneNamed: #buttons) port: #result)
										value:
											([ self smaCCParseUsing: parser ]
												on: SmaCCParserError
												do: [ :ex | ex return: ex ]) ]
									entitled: 'Parse';
								act: [ [ self smaCCParseUsing: parser.
									UIManager default message: 'Parses without errors' ]
										on: SmaCCParserError
										do: [ :ex | Processor activeProcess debug: thisContext title: ex description full: true ] ]
									entitled: 'Debug' ].
					tabulator transmit
						from: #buttons port: #result;
						to: #result;
						andShow: [ :presentation :obj | 
							| inspector |
							inspector := GTInspector new.
							inspector startOn: obj.
							(presentation custom: inspector) title: 'Result' ] ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
AbstractFileReference >> smaCCParseUsing: parserClass [
	| contents |
	self
		readStreamDo: [ :str | 
			parserClass setEncodingOn: str.
			contents := str contents ].
	^ parserClass parse: contents
]
