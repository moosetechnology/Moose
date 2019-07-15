Extension { #name : #SmaCCParserError }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParserError >> gtParserErrorInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 1>
	composite text
		title: 'Error';
		display: [ | source |
			source := self tag scanner debugSource.
			(source isEmpty and: [ self tag position > 1 ])
				ifTrue: [ 'No source available' ]
				ifFalse: [ (source copyFrom: 1 to: self tag position - 1) , self description , ' ->' , (source copyFrom: self tag position to: source size) ] ];
		primarySelectionInterval: (self tag position to: self tag position + self description size + 2);
		withLineNumbers: true
]
