Class {
	#name : #MPImportHismoCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Wizard'
}

{ #category : #hooks }
MPImportHismoCommand >> execute [

	MooseHismoImportFromMSEWizard  new open
]

{ #category : #hooks }
MPImportHismoCommand >> label [

	^ 'Import Hismo model from MSE files'
]
