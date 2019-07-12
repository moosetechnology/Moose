Extension { #name : #CompiledMethod }

{ #category : #'*Famix-MetamodelBuilder-Core' }
CompiledMethod >> hasGeneratedPragma [
	^ self pragmas anySatisfy: [ :p | p selector = #generated ]
]
