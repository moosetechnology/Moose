Extension { #name : #Integer }

{ #category : #'*PetitJava-AST' }
Integer class >> readFromJavaString: aString [
	^ Number readFromString: (
		(aString asLowercase beginsWith: '0x')
			ifTrue: [ '16r', (aString allButFirst: 2) ]
			ifFalse: [ aString size > 1 & aString first = $0
				ifTrue: [ '8r', aString ]
				ifFalse: [ aString ]])
]
