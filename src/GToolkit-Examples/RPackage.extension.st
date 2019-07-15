Extension { #name : #RPackage }

{ #category : #'*GToolkit-Examples-Core' }
RPackage >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	(self methods reject: [:m | m methodClass isTrait]) do: [ :method |
		examples addAll: method gtExamples ].
	^ examples
]
