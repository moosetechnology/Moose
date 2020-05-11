Class {
	#name : #FamixFileBasedLanguageMetamodelFactory,
	#superclass : #FamixBasicInfrastructureMetamodelFactory,
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
FamixFileBasedLanguageMetamodelFactory class >> isAbstract [
	^ self = FamixFileBasedLanguageMetamodelFactory
]

{ #category : #testing }
FamixFileBasedLanguageMetamodelFactory class >> isDeprecated [
	^ true
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> abstractFile [

	^ self entityNamed: #AbstractFile
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> abstractFileAnchor [

	^ self entityNamed: #AbstractFileAnchor
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> file [

	^ self entityNamed: #File
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> fileAnchor [

	^ self entityNamed: #FileAnchor
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> folder [

	^ self entityNamed: #Folder
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> indexedFileAnchor [

	^ self entityNamed: #IndexedFileAnchor
]

{ #category : #accessing }
FamixFileBasedLanguageMetamodelFactory >> multipleFileAnchor [

	^ self entityNamed: #MultipleFileAnchor
]
