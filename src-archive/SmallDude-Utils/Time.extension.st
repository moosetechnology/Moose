Extension { #name : #Time }

{ #category : #'*SmallDude-Utils' }
Time class >> secondClock [
	"Answer an integer representing the number of seconds since
	1901 began."

	^self millisecondClockValue // 1000
]
