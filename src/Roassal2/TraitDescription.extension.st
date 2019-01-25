Extension { #name : #TraitDescription }

{ #category : #'*Roassal2' }
TraitDescription >> ageInDays [
	"Return the number of days the class exists"
	self numberOfMethods isZero ifTrue: [ ^ 0 ].
	^ (DateAndTime now - self oldestMethod date) asDays
]
