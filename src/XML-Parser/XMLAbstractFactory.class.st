"
An abstract class for dynamically choosing a supported concrete implementation from a class hierarchy for this platform.

Each root subclass needs to override #preferredImplementation to return the preferred subclass and #noSupportedImplementationFound to signal an error if none are supported, and then each subclass of the root needs to define #isSupportedImplementation to return true if it supports this platform.
"
Class {
	#name : #XMLAbstractFactory,
	#superclass : #Object,
	#classInstVars : [
		'implementation'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #testing }
XMLAbstractFactory class >> canBeImplemented [
	^ false
]

{ #category : #clearing }
XMLAbstractFactory class >> clearAllImplementations [
	"self clearAllImplementations"

	self
		implementation: nil;
		allSubclassesDo: [:each | each implementation: nil]
]

{ #category : #finding }
XMLAbstractFactory class >> findSupportedImplementation [
	self canBeImplemented
		ifTrue: [
			self isSupportedImplementation
				ifTrue: [^ self].

			(self preferredImplementation notNil
				and: [self preferredImplementation isSupportedImplementation])
				ifTrue: [^ self preferredImplementation].
			self allSubclassesDo: [:each |
				each isSupportedImplementation
					ifTrue: [^ each]]].

	^ nil.
]

{ #category : #testing }
XMLAbstractFactory class >> hasSupportedImplementation [
	^ self findSupportedImplementation notNil
]

{ #category : #accessing }
XMLAbstractFactory class >> implementation [
	^ implementation
		ifNil: [
			"avoid assigning to the class inst var unless an implementation
			was found to minimize write conflicts on GS"
			self findSupportedImplementation
				ifNil: [self noSupportedImplementationFound]
				ifNotNil: [:supportedImplementation |
					implementation := supportedImplementation].
			implementation]
]

{ #category : #accessing }
XMLAbstractFactory class >> implementation: aClassOrNil [
	implementation := aClassOrNil
]

{ #category : #'instance creation' }
XMLAbstractFactory class >> implementationNew [
	^ self implementation basicNew initialize
]

{ #category : #'class initialization' }
XMLAbstractFactory class >> initialize [
	"self initialize"

	self clearAllImplementations
]

{ #category : #testing }
XMLAbstractFactory class >> isSupportedImplementation [
	^ false
]

{ #category : #'instance creation' }
XMLAbstractFactory class >> new [
	^ self implementationNew
]

{ #category : #finding }
XMLAbstractFactory class >> noSupportedImplementationFound [
	Error signal: 'No implementation available'
]

{ #category : #defaults }
XMLAbstractFactory class >> preferredImplementation [
	^ nil
]
