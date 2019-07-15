Class {
	#name : #ClassesExtensionTestResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #hook }
ClassesExtensionTestResource >> importModel [

	SmalltalkImporter new model: model; addPackageNamed: 'ReferenceModel' ; run.
]
