Extension { #name : #Pragma }

{ #category : #'*fame-util' }
Pragma class >> inMethod: compiledMethod named: keyword [

	| all keywords selection |
	all := compiledMethod pragmas.
	keyword isArray
		ifTrue:[ keywords := keyword ]
		ifFalse: [ keywords := Array with: keyword ].
	selection := all select: [ :each | keywords includes: each keyword ].
	selection size > 1 ifTrue: [ Error signal ].
	selection size = 0 ifTrue: [ ^nil ].
	^selection first
]
