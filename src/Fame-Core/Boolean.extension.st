Extension { #name : #Boolean }

{ #category : #'*Fame-Core' }
Boolean >> threeWayCompareTo: anotherObject [
	self flag: #todo.	"Remove me when https://github.com/pharo-project/pharo/pull/5023 will be integrated."
	^ self asBit threeWayCompareTo: anotherObject asBit
]
