Extension { #name : #FMMetamodelFactory }

{ #category : #'*Famix-Deprecated' }
FMMetamodelFactory class >> on: aMetamodelClass [
	self deprecated: 'Use #fm3Package: or #forModel: instead. #forModel: is only available with Moose.'.
	^ self forModel: aMetamodelClass
]
