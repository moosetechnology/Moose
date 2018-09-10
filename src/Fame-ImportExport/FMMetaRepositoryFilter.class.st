Class {
	#name : #FMMetaRepositoryFilter,
	#superclass : #FMMetaRepositoryVisitor,
	#instVars : [
		'newMetaRepository',
		'classes'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMMetaRepositoryFilter >> classes [

	^ classes ifNil: [ classes := #()]
]

{ #category : #accessing }
FMMetaRepositoryFilter >> classes: anObject [

	classes := anObject
]

{ #category : #'initialize-release' }
FMMetaRepositoryFilter >> initialize [
	
	newMetaRepository := FMMetaRepository basicNew.
	newMetaRepository initialize: newMetaRepository
]

{ #category : #accessing }
FMMetaRepositoryFilter >> newMetaRepository [

	^ newMetaRepository
]

{ #category : #accessing }
FMMetaRepositoryFilter >> newMetaRepository: anObject [

	newMetaRepository := anObject
]

{ #category : #running }
FMMetaRepositoryFilter >> run [
	self classes do: [ :each | each accept: self ]
]

{ #category : #visiting }
FMMetaRepositoryFilter >> visitFM3MetaDescription: aFM3MetaDescription [

	(self newMetaRepository includes: aFM3MetaDescription) ifTrue: [^ self ].

	newMetaRepository add: aFM3MetaDescription.
	aFM3MetaDescription attributes do: [ :eachProperty | eachProperty accept: self ].
	aFM3MetaDescription allSuperclasses do: [ :each | each accept: self ].
	aFM3MetaDescription package ifNotNil: [ :pack | pack accept: self ].
]

{ #category : #visiting }
FMMetaRepositoryFilter >> visitFM3PackageDescription: aFM3PackageDescription [

	(self newMetaRepository includes: aFM3PackageDescription) ifTrue: [^ self ].

	newMetaRepository add: aFM3PackageDescription 
]

{ #category : #visiting }
FMMetaRepositoryFilter >> visitFM3PropertyDescription: aFM3PropertyDescription [

	(self newMetaRepository includes: aFM3PropertyDescription) ifTrue: [^ self ].
	
	newMetaRepository add: aFM3PropertyDescription.
	(aFM3PropertyDescription type isPrimitive or: [aFM3PropertyDescription type isRoot ]) ifFalse: [
		aFM3PropertyDescription type accept: self.
		aFM3PropertyDescription type allSubclassesDo: [:eachSubclass | eachSubclass accept: self ]].
	aFM3PropertyDescription package notNil ifTrue: [aFM3PropertyDescription package accept: self]
]
