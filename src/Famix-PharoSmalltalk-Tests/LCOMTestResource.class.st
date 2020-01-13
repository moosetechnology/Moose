"
I am a test resource building a FamixStModel with the LCOM test resource entities.
"
Class {
	#name : #LCOMTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #setup }
LCOMTestResource >> importModel [
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LCOM';
		run
]
