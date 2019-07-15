Extension { #name : #Metaclass }

{ #category : #'*Moose-Core' }
Metaclass >> absoluteName [
	"Answer an environment independent (and therefore truely unique) name."

	<localMetaclassMethod> 
    "This method is supposed to be local in Metaclass because of a good reason.
    We use this pragma to test if Metaclass does not contain some accidental 
    local selectors."

	^thisClass absoluteName, ' class'
]

{ #category : #'*Moose-Core' }
Metaclass >> mooseName [

	<localMetaclassMethod> 
    "This method is supposed to be local in Metaclass because of a good reason.
    We use this pragma to test if Metaclass does not contain some accidental 
    local selectors."

	^ ('Smalltalk::' , self soleInstance name, '_class') asSymbol
]

{ #category : #'*Moose-Core' }
Metaclass >> relatedGroupType [
	^ MooseGroup
]
