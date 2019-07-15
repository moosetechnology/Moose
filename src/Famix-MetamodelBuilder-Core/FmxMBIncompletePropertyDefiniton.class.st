"
FamixMetamodelBuilderIncompletePropertyDefiniton
"
Class {
	#name : #FmxMBIncompletePropertyDefiniton,
	#superclass : #Error,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBIncompletePropertyDefiniton >> messageText [

	<ignoreForCoverage>
	^ 'Properties need to be part of a relations or have a primitive type'
]
