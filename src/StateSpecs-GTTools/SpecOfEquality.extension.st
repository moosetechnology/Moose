Extension { #name : #SpecOfEquality }

{ #category : #'*StateSpecs-GTTools' }
SpecOfEquality >> gtInspectorIn: composite forFailedValidationOf: anObject [

	^composite diff
		title: 'Diff (actual vs. expected)';
		display: [ 
			{anObject gtDebuggerSUnitPrint. requiredValue gtDebuggerSUnitPrint} ]
]
