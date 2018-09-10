Extension { #name : #Interval }

{ #category : #'*petitparser-core-converting' }
Interval >> asParser [    
	"Create a range of characters between start and stop."

    self assert:start isCharacter.
    self assert:stop isCharacter.
    self assert:step == 1.
    ^ PPPredicateObjectParser between: start and: stop

    "
		($a to: $f) asParser parse: 'a'
		($a to: $f) asParser parse: 'g'
    "
]
