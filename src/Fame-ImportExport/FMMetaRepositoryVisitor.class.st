Class {
	#name : #FMMetaRepositoryVisitor,
	#superclass : #Object,
	#instVars : [
		'metaRepository'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMMetaRepositoryVisitor >> metaRepository [

	^ metaRepository
]

{ #category : #accessing }
FMMetaRepositoryVisitor >> metaRepository: aMetaRepository [

	metaRepository := aMetaRepository
]

{ #category : #running }
FMMetaRepositoryVisitor >> run [

	^ self subclassResponsibility
	
]

{ #category : #visiting }
FMMetaRepositoryVisitor >> visitFM3MetaDescription: aFM3MetaDescription [

	self subclassResponsibility
]

{ #category : #visiting }
FMMetaRepositoryVisitor >> visitFM3PackageDescription: aFM3PackageDescription [

	self subclassResponsibility
]

{ #category : #visiting }
FMMetaRepositoryVisitor >> visitFM3PropertyDescription: aFM3PropertyDescription [

	self subclassResponsibility
]
