Extension { #name : #ClassDescription }

{ #category : #'*Famix-MetamodelBuilder-Core' }
ClassDescription >> needToAdaptToMethod: aRGMethod [
	^ self
		compiledMethodAt: aRGMethod selector
		ifPresent: [ :realMethod | (aRGMethod sourceCode = realMethod sourceCode and: [ aRGMethod protocol = realMethod protocol ]) not ]
		ifAbsent: [ true ]
]
