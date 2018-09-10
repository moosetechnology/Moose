Extension { #name : #RBBrowserEnvironment }

{ #category : #'*GToolkit-Examples-Core' }
RBBrowserEnvironment >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self methodsDo: [ :each | 
		(each methodClass isTrait not and: [ each isGTExampleMethod]) 
			ifTrue: [ 
				each gtExample ifNotNil: [ :example | 
					examples add: example ] ] ].
	^ examples
]
