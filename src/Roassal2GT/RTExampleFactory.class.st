Class {
	#name : #RTExampleFactory,
	#superclass : #GtExampleFactory,
	#category : #'Roassal2GT-Examples'
}

{ #category : #'accessing-defaults' }
RTExampleFactory >> defaultExampleClass [
	^ RTExampleSelection
]

{ #category : #'private - creating examples' }
RTExampleFactory >> initializeExample: aGTExample fromMethod: aCompiledMethod [
	super initializeExample: aGTExample fromMethod: aCompiledMethod.
	
	self initializeIconFromMethod: aCompiledMethod forExample: aGTExample.

]

{ #category : #'private - creating examples' }
RTExampleFactory >> initializeIconFromMethod: aCompiledMethod forExample: aGTExample [
	aGTExample icon ifNotNil: [ ^ self ].

	[ aGTExample form: (aGTExample methodResolverClass resolve: RTExampleMethodIcon example: self className: aCompiledMethod methodClass meta: aCompiledMethod methodClass isMeta selector: aCompiledMethod selector)  ]
		on: Error
		do: [ :exception | 
			aGTExample addProblem: (GtExampleError new 
				example: aGTExample;
				signaledException: exception;
				yourself) ]
]

{ #category : #testing }
RTExampleFactory >> isExampleMethod: aCompiledMethod [
	^ (super isExampleMethod: aCompiledMethod)
		or: [ self isOldStyleRTExampleMethod: aCompiledMethod ]
]

{ #category : #testing }
RTExampleFactory >> isOldStyleRTExampleMethod: aCompiledMethod [
	^ (aCompiledMethod selector beginsWith: 'example')
		and: [ (aCompiledMethod selector endsWith: 'Icon') not ]
]
