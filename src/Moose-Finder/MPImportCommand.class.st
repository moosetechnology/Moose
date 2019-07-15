Class {
	#name : #MPImportCommand,
	#superclass : #MoosePanelCommand,
	#category : #'Moose-Finder'
}

{ #category : #accessing }
MPImportCommand >> abstractTag [
	"Say that this class will not taken into consideration when querying command hierarchy"
]

{ #category : #hooks }
MPImportCommand >> category [

	^ 'Import'
]
