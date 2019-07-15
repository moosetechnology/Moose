Extension { #name : #SmaCCString }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCString >> gtStringIn: aComposite [
	<gtInspectorPresentationOrder: 0>
	aComposite text
		title: 'String';
		withLineNumbers: true;
		display: [ self asString ]
]
