Class {
	#name : #FMAbstractMetamodelValidator,
	#superclass : #Object,
	#instVars : [
		'metaModelBuilder'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #accessing }
FMAbstractMetamodelValidator >> metaModelBuilder [
	^ metaModelBuilder
]

{ #category : #accessing }
FMAbstractMetamodelValidator >> metaModelBuilder: anObject [
	metaModelBuilder := anObject
]

{ #category : #validation }
FMAbstractMetamodelValidator >> validate [
	self subclassResponsibility
]
