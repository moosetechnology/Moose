Extension { #name : #Metaclass }

{ #category : #'*Famix-Smalltalk-Utils' }
Metaclass >> mooseName [
	^ ('Smalltalk::' , self soleInstance name , '_class') asSymbol
]
