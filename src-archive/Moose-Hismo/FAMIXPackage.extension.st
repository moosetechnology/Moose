Extension { #name : #FAMIXPackage }

{ #category : #'*moose-hismo' }
FAMIXPackage >> historicalUniqueName [
	^ (self parentPackage isNil 
		ifTrue: [ self name ]
		ifFalse: [ self parentPackage historicalUniqueName , '.' , self name ]) asSymbol
]
