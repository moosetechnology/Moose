Extension { #name : #Boolean }

{ #category : #'*Fame-Pharo8Compatibility' }
Boolean >> threeWayCompareTo: anotherObject [
	^ self asBit threeWayCompareTo: anotherObject asBit
]
