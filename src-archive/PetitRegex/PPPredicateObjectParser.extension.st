Extension { #name : #PPPredicateObjectParser }

{ #category : #'*petitregex-chars' }
PPPredicateObjectParser class >> control [
	^ self chars: ((0 to: 31) collect: [ :each | Character value: each ]) message: 'control character expected'
]
