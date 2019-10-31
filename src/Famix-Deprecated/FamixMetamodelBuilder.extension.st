Extension { #name : #FamixMetamodelBuilder }

{ #category : #'*Famix-Deprecated' }
FamixMetamodelBuilder >> doNotGenerateCurrent [
	self deprecated: 'Only used by deprecated feature.'.
	self classes do: [ :each | each willGenerate: false ].
	self traits do: [ :each | each willGenerate: false ]
]
