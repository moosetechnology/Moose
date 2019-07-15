Extension { #name : #Metaclass }

{ #category : #'*Ring2-Core' }
Metaclass >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ RGMetaclass named: self name parent: anRGEnvironment.

]
