"
I am a factory that can create ==GtExample== instances. 

Users should configure me with a #sourceClass:. This is the class used to look for methods defining examples. To create an example, a method defining an example is executed having a provider as a receiver. If the example method is defined on the class side, the provider is the class object. If the method is defined on the instance side,  the provider consists in a new instance of that class. In the second case, a new instance is created for running each example method. Optionally users can configure the factory with an explicit provider. If this is done, this provider will be used for all examples created by the factory.

To initialize the subjects of an example I call #gtExampleSubjects on the provider object.
To initialize various properties of an example I detect all pragmas from the example method for which a method exists in class of the example (the method should have the same name as the pragma keyword). Then I execute those methods with the example as a receiver and the pragma arguments.
"
Class {
	#name : #GtExampleFactory,
	#superclass : #Object,
	#instVars : [
		'cache',
		'source',
		'provider',
		'exampleClass'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #subjects }
GtExampleFactory class >> classSubjectFrom: aClass [
	^ GtExampleClassSubject fromClass: aClass
]

{ #category : #accessing }
GtExampleFactory class >> gtExampleContext [
	^ GtCurrentExampleContext value 
]

{ #category : #subjects }
GtExampleFactory class >> instanceSubjectFromObject: anObject [
	^ GtExampleInstanceSubject fromObject: anObject
]

{ #category : #subjects }
GtExampleFactory class >> subjectFrom: anObject [
	^ anObject isClass
		ifTrue: [ self classSubjectFrom: anObject] 
		ifFalse: [ self instanceSubjectFromObject: anObject ]
]

{ #category : #'private-utils' }
GtExampleFactory >> createExample: aCompiledMethod [
	| newExample |
	newExample := self exampleClass new.
	[ newExample initializeFromMethod: aCompiledMethod usingFactory: self ]
		on: Deprecation
		do: [ :exception | 
			newExample addProblem: (GtExampleDeprecationDetected new
				example: newExample;
				signaledException: exception; 
				yourself).
			exception resume ].
	^ newExample
]

{ #category : #'accessing-defaults' }
GtExampleFactory >> defaultExampleClass [
	^ GtExample
]

{ #category : #'accessing-defaults' }
GtExampleFactory >> defaultProviderFor: aCompiledMethod [ 
	^ aCompiledMethod methodClass isMeta
		ifTrue: [ aCompiledMethod methodClass theNonMetaClass ]
		ifFalse: [ aCompiledMethod methodClass theNonMetaClass new " WARNING: not all classes support this -> override this using: #provider: " ] 
]

{ #category : #private }
GtExampleFactory >> exampleAt: aCompiledMethod ifAbsentPut: aBlock [
	^ aBlock value
]

{ #category : #accessing }
GtExampleFactory >> exampleClass [
	^ exampleClass ifNil: [ exampleClass := self defaultExampleClass ]
]

{ #category : #accessing }
GtExampleFactory >> exampleClass: anObject [
	exampleClass := anObject
]

{ #category : #private }
GtExampleFactory >> exampleFromMethod: aCompiledMethod do: aBlock [
	aBlock value: (self createExample: aCompiledMethod)
]

{ #category : #private }
GtExampleFactory >> exampleMethod: aCompiledMethod do: aBlock [
	(self isExampleMethod: aCompiledMethod) ifFalse: [ ^ self ].
	self exampleFromMethod: aCompiledMethod do: aBlock
]

{ #category : #private }
GtExampleFactory >> exampleMethodsDo: aBlock [
	self sourceClass theNonMetaClass methods
		select: [ :each | self isExampleMethod: each ]
		thenDo: aBlock.
	self sourceClass theMetaClass methods
		select: [ :each | self isExampleMethod: each ]
		thenDo: aBlock.
		
]

{ #category : #private }
GtExampleFactory >> examplesDo: aBlock [
	self exampleMethodsDo: [ :method |
		self exampleFromMethod: method do: aBlock ]
]

{ #category : #public }
GtExampleFactory >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self examplesDo: [ :example | examples add: example ].
	^ examples
]

{ #category : #'private - creating examples' }
GtExampleFactory >> initializeExample: aGTExample fromMethod: aCompiledMethod [
	self initializeSubjectsForMethod: aCompiledMethod forExample: aGTExample.
	self initializePragmasFromMethod: aCompiledMethod forExample: aGTExample.

]

{ #category : #'private-init' }
GtExampleFactory >> initializePragmas: aCollection forExample: aGTExample [
	aCollection do: [ :pragma | 
		(aGTExample class canPerform: pragma keyword) ifTrue: [ 
			[ aGTExample perform: pragma keyword withArguments: pragma arguments ]
				on:Error
				do:[ :exception | 
					aGTExample addProblem: (GtExamplePragmaError new 
						example: aGTExample;
						pragma: pragma;
						signaledException: exception;
						yourself) ] ] ]
]

{ #category : #'private-init' }
GtExampleFactory >> initializePragmasFromMethod: aCompiledMethod forExample: aGTExample [
	self initializePragmas: aCompiledMethod pragmas forExample: aGTExample
]

{ #category : #'private-init' }
GtExampleFactory >> initializeSubjects: aCollection forExample: aGTExample [
	aCollection isEmptyOrNil ifTrue: [ ^ self ].
	
	aCollection do: [ :subject | 
		[ aGTExample addSubject: (self class subjectFrom: subject) ]
			on:Error
			do: [ :exception | 
				aGTExample addProblem: (GtExampleSubjectError new 
					example: aGTExample;
					subject: subject;
					signaledException: exception;
					yourself) ] ] 
]

{ #category : #'private-init' }
GtExampleFactory >> initializeSubjectsForMethod: aCompiledMethod forExample: aGTExample [
	[ self providerFor: aCompiledMethod do: [ :aProvider | 
			(aProvider class canPerform: #gtExamplesSubjects) ifTrue: [
				self initializeSubjects: aProvider gtExamplesSubjects forExample: aGTExample ] ] ]
		on: Error
		do: [ :exception | 
			aGTExample addProblem: (GtExampleSubjectError new 
				example: aGTExample;
				signaledException: exception;
				yourself) ]
]

{ #category : #testing }
GtExampleFactory >> isExampleMethod: aCompiledMethod [
	^ self isGTExampleMethod: aCompiledMethod 
]

{ #category : #testing }
GtExampleFactory >> isGTExampleMethod: aCompiledMethod [
	^ aCompiledMethod isGTExampleMethod
]

{ #category : #accessing }
GtExampleFactory >> provider [
	^ provider
]

{ #category : #accessing }
GtExampleFactory >> provider: anObject [
	provider := anObject
]

{ #category : #'private-utils' }
GtExampleFactory >> providerFor: aCompiledMethod [
	^ provider ifNil: [ self defaultProviderFor: aCompiledMethod ]
]

{ #category : #'private-utils' }
GtExampleFactory >> providerFor: aCompiledMethod do: aBlock1 [
	^ self providerFor: aCompiledMethod do: aBlock1 ifNone: nil
]

{ #category : #'private-utils' }
GtExampleFactory >> providerFor: aCompiledMethod do: aBlock1 ifNone: aBlock2 [
	^ (self providerFor: aCompiledMethod)
		ifNotNil: aBlock1
		ifNil: aBlock2
]

{ #category : #accessing }
GtExampleFactory >> sourceClass [
	^ source
]

{ #category : #accessing }
GtExampleFactory >> sourceClass: anObject [
	"The class used to locate example methods."
	source := anObject
]
