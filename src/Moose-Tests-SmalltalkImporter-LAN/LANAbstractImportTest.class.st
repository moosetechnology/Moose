Class {
	#name : #LANAbstractImportTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #resources }
LANAbstractImportTest class >> resources [
	^ Array with: LANPackageTestResource
]

{ #category : #private }
LANAbstractImportTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model
]

{ #category : #tests }
LANAbstractImportTest >> testClasses [
	"self debug: #testClasses"
	
	self deny: (self model entityStorage selectAllWithType: FamixTClass) isEmpty
]

{ #category : #private }
LANAbstractImportTest >> totalNumberOfAttributesFor: aClass [

	^ aClass allInstVarNames size + aClass allClassVarNames size
]
