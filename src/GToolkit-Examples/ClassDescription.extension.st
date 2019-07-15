Extension { #name : #ClassDescription }

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> asGTExampleSubject [
	^ self gtExamplesFactoryClass classSubjectFrom: self
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamples [
	^ self gtExamplesFactory gtExamplesContained
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesFactory [
	^ self gtExamplesFactoryClass new
		sourceClass: self;
		yourself
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesFactoryClass [
	^ GtExampleFactory
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesSubjects [
	^ { self }
]
