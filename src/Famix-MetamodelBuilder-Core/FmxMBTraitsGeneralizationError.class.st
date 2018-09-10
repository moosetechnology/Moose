Class {
	#name : #FmxMBTraitsGeneralizationError,
	#superclass : #Error,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBTraitsGeneralizationError >> messageText [

	^ 'Traits cannot inherit from classes'
]
