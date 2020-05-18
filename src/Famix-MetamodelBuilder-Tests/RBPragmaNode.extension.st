Extension { #name : #RBPragmaNode }

{ #category : #'*Famix-MetamodelBuilder-Tests' }
RBPragmaNode >> removeFromTree [
	self parent removePragma: self
]
