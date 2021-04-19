Class {
	#name : #MPImportMSECommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder-Import'
}

{ #category : #hooks }
MPImportMSECommand class >> defaultDescription [

	^ 'Import model from MSE file'
]

{ #category : #hooks }
MPImportMSECommand class >> defaultIcon [

	^ MooseIcons mooseImportMse
]

{ #category : #hooks }
MPImportMSECommand class >> defaultIconName [

	^ #mooseImportMse
]

{ #category : #hooks }
MPImportMSECommand class >> defaultName [

	^ 'Import from MSE'
]

{ #category : #accessing }
MPImportMSECommand class >> importForm [

	^ MooseImportFromMSEForm
]
