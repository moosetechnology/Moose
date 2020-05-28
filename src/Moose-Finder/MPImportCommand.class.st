Class {
	#name : #MPImportCommand,
	#superclass : #MoosePanelCommand,
	#category : #'Moose-Finder'
}

{ #category : #testing }
MPImportCommand class >> isAbstract [
	^ self = MPImportCommand
]

{ #category : #hooks }
MPImportCommand >> category [

	^ 'Import'
]
