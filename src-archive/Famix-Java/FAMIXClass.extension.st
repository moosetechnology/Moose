Extension { #name : #FAMIXClass }

{ #category : #'*Famix-Java' }
FAMIXClass >> exceptions [
	<MSEProperty: #exceptions type: #FAMIXException opposite: #exceptionClass>
	<multivalued>
	<derived>
	<MSEComment: 'Exceptions which class is myself.'>
	^ self privateState
		attributeAt: #exceptions
		ifAbsentPut: [ FMMultivalueLink on: self opposite: #exceptionClass: ]
]

{ #category : #'*Famix-Java' }
FAMIXClass >> exceptions: values [
	(self privateState at: #exceptions) value: values
]

{ #category : #'*Famix-Java' }
FAMIXClass >> isIgnored [
	<MSEProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<MSEComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]
