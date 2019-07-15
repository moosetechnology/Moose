Class {
	#name : #RGReadOnlyBackendTest,
	#superclass : #RGBackendTest,
	#traits : 'TRGReadOnlyTest',
	#classTraits : 'TRGReadOnlyTest classTrait',
	#category : #'Ring2-Tests-Core'
}

{ #category : #'as yet unclassified' }
RGReadOnlyBackendTest >> backendClass [

	^ RGReadOnlyBackend
]
