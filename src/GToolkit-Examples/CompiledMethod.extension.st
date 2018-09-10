Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExample [
	self gtExamplesFactory exampleMethod: self do: [ :example | ^ example ].
	^ nil
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExampleValue [
	^ self gtExample returnValue
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExamples [
	^ self gtExample 
		ifNotNil: [ :example | { example } ]
		ifNil: [ {  } ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExamplesFactory [
	^ self methodClass theNonMetaClass gtExamplesFactory
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtValueWithReceiver: aReceiver possibleArguments: anArray [ 
	^ anArray size = self numArgs 
		ifTrue: [ self valueWithReceiver: aReceiver arguments: anArray  ]
		ifFalse: [ self valueWithReceiver: aReceiver arguments: (anArray copyFrom: 1 to: self numArgs) ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> isGTExampleMethod [

	"Spy2 changes the AST of the method and removes pragmas.
	Therefore we need to ask an original method instead"
	((self respondsTo: #isSpy)
		and: [ self isSpy ])
			ifTrue: [ ^ self originalMethod isGTExampleMethod ].

	^ (self pragmas anySatisfy: [ :each | each isGTExamplePragma ])
		and: [ self numArgs = 0 ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> isGTReservedMethod [
	^ #( gtExamplesSubjects gtExamplesFactory gtExample gtExamples ) 
			anySatisfy: [ :selector | selector = self selector ]
]
