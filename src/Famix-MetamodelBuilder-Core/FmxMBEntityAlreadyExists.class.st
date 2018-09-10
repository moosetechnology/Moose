Class {
	#name : #FmxMBEntityAlreadyExists,
	#superclass : #Error,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBEntityAlreadyExists >> messageText [

	^ 'Entity of this name already exists in the metamodel'
]
