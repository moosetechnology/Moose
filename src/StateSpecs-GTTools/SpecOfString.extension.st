Extension { #name : #SpecOfString }

{ #category : #'*StateSpecs-GTTools' }
SpecOfString >> gtInspectorIn: composite forFailedValidationOf: anObject [

	^composite diff
		title: 'String vs expected part';
		display: [ 
			{anObject gtDebuggerSUnitPrint. requiredValue gtDebuggerSUnitPrint} ]
]
