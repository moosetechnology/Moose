Extension { #name : #TraitDescription }

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> asGTExampleSubject [
	^ self class gtExamplesFactoryClass classSubjectFrom: self
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtExamples [
	^ self gtExamplesFactory gtExamplesContained
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtExamplesFactory [
	^ self class gtExamplesFactoryClass new
		sourceClass: self;
		yourself
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtExamplesSubjects [
	^ { self }
]
