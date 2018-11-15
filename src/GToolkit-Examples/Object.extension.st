Extension { #name : #Object }

{ #category : #'*GToolkit-Examples-Core' }
Object >> asGTExampleSubject [
	^ self class gtExamplesFactoryClass instanceSubjectFromObject: self
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> assert: actual equals: expected [
	self assert: actual = expected
]

{ #category : #'*GToolkit-Examples-Core' }
Object class >> gtExampleContext [
	^ self gtExamplesFactoryClass gtExampleContext
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExampleContext [
	^ self class gtExampleContext
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExampleSubstrings [
	^ {  }
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamples [
	^ self class gtExamples
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesContained [
	^ self gtExamples
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesFactory [
	^ self class gtExamplesFactory
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesSubjects [
	^ {  }
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> isGTExample [
	^ false
]

{ #category : #'*GToolkit-Examples-Exceptions' }
Object >> isGTExampleError [
	^ false
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> isGTExampleMethod [
	^ false
]
