Class {
	#name : #FamixFileBasedLanguageMetamodelFactory,
	#superclass : #FamixBasicInfrastructureMetamodelFactory,
	#category : #'Famix-BasicInfrastructure'
}

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> abstractFile [

	^ self entityNamed: #AbstractFile
]

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> abstractFileAnchor [

	^ self entityNamed: #AbstractFileAnchor
]

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> file [

	^ self entityNamed: #File
]

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> fileAnchor [

	^ self entityNamed: #FileAnchor
]

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> folder [

	^ self entityNamed: #Folder
]

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> indexedFileAnchor [

	^ self entityNamed: #IndexedFileAnchor
]

{ #category : #'as yet unclassified' }
FamixFileBasedLanguageMetamodelFactory >> multipleFileAnchor [

	^ self entityNamed: #MultipleFileAnchor
]
