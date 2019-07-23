Extension { #name : #ClassDescription }

{ #category : #'*Famix-MetamodelBuilder-Core' }
ClassDescription >> needToAdaptToMethod: aRGMethod [
	| realMethod |
	realMethod := self >> aRGMethod selector.
	^ (aRGMethod sourceCode = realMethod sourceCode and: [ aRGMethod protocol = realMethod protocol ]) not
]
