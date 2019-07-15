Extension { #name : #RPackageTag }

{ #category : #'*GToolkit-Examples-Core' }
RPackageTag >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	(self package methods reject: [:m | m methodClass isTrait]) do: [ :method |
		examples addAll: method gtExamples ].
	^ examples
]
