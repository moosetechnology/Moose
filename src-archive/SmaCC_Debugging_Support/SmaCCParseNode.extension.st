Extension { #name : #SmaCCParseNode }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode >> gtAttributesIn: aComposite [
	<gtInspectorPresentationOrder: 35>
	| tabulator |
	(attributes notNil and: [ attributes notEmpty ])
		ifFalse: [ ^ self ].
	tabulator := aComposite tabulator.
	tabulator
		title: 'Attributes';
		row: #attributes.
	tabulator transmit
		to: #attributes;
		andShow: [ :pres | 
			pres fastTable
				display: [ attributes keys asSortedCollection ];
				column: 'Name' evaluated: [ :each | each ];
				column: 'Value' evaluated: [ :each | self attributeNamed: each ifAbsent: [  ] ] ].
	tabulator transmit
		toOutsidePort: #selection;
		from: #attributes port: #selection;
		transformed: [ :name | self attributeNamed: name ifAbsent: [  ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode >> gtCollectionItems: aCollection type: aSymbol [
	^ (1 to: aCollection size) collect: [ :i | Array with: i printString with: aSymbol with: (aCollection at: i) ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode class >> gtExampleSimple [
	<gtExample>
	^ self new
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode >> gtInspectorItems [
	| items |
	items := OrderedCollection new.
	self class allInstVarNames
		do:
			[ :each | 
			| selector tag value |
			selector := each asSymbol.
			(value := self perform: selector) notNil
				ifTrue:
					[ tag := nil.
					((self otherVariables includes: selector) or: [ self ignoredOtherVariables includes: selector ])
						ifTrue: [ tag := #other ].
					((self nodeVariables includes: selector) or: [ self ignoredNodeVariables includes: selector ])
						ifTrue: [ tag := #node ].
					(((self compositeNodeVariables includes: selector) or: [ self ignoredCompositeNodeVariables includes: selector ])
						and: [ value notEmpty ])
						ifTrue: [ tag := #nodes ].
					((self tokenVariables includes: selector) or: [ self ignoredTokenVariables includes: selector ])
						ifTrue: [ tag := #token ].
					(((self compositeTokenVariables includes: selector) or: [ self ignoredCompositeTokenVariables includes: selector ])
						and: [ value notEmpty ])
						ifTrue: [ tag := #tokens ].
					tag notNil
						ifTrue: [ items add: (Array with: each with: tag with: value) ] ] ].
	^ items
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode >> gtInspectorSourceIn: aComposite [
	<gtInspectorPresentationOrder: 40>
	aComposite text
		title: 'Source';
		display: [ self topParent completeSource ];
		initialize: [ :textPresentation | textPresentation selectionInterval: (self startPosition to: self stopPosition) ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode >> gtInspectorTreeIn: aComposite [
	<gtInspectorPresentationOrder: 30>
	aComposite tabulator
		with: [ :browser | 
			browser title: 'Tree'.
			browser row: #variables.
			browser transmit
				from: #variables;
				toOutsidePort: #selection;
				transformed: [ :each | each ifNotNil: [ each last ] ].
			browser transmit
				to: #variables;
				andShow: [ :composite | 
					composite table
						display: [ Array with: (Array with: 'self' with: #node with: self) ];
						children: [ :each | 
							(each at: 2) = #node
								ifTrue: [ each last gtInspectorItems ]
								ifFalse: [ (each at: 2) = #nodes
										ifTrue: [ self gtCollectionItems: each last type: #node ]
										ifFalse: [ (each at: 2) = #tokens
												ifTrue: [ self gtCollectionItems: each last type: #token ]
												ifFalse: [ #() ] ] ] ];
						format: [ :each | each first ];
						column: 'Variable' evaluated: [ :each | each first ];
						column: 'Type'
							evaluated: [ :each | 
							(each at: 2) = #node
								ifTrue: [ each last class name ]
								ifFalse: [ '' ] ]
							tags: [ :each | Array with: (each at: 2) ] ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParseNode >> gtParentsIn: aComposite [
	<gtInspectorPresentationOrder: 34>
	parent isNil
		ifTrue: [ ^ self ].
	aComposite tree
		title: 'Parents';
		allExpanded;
		display: [ Array with: self ];
		children: [ :each | 
			(each notNil and: [ each parent notNil ])
				ifTrue: [ Array with: each parent ] ]
]
