"
This class is the standard implementation that uses Pharo and Squeak's Mutex class to implement a reentrant mutex.
"
Class {
	#name : #XMLStandardReentrantMutex,
	#superclass : #XMLReentrantMutex,
	#instVars : [
		'mutex'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #testing }
XMLStandardReentrantMutex class >> isSupportedImplementation [
	(XMLClassFinder hasClassNamed: #Mutex)
		ifFalse: [^ false].

	"MUST use the transient class on GS to avoid persisting and causing
	write conflicts"
	XMLClassFinder
		classNamed: #XMLTransientReentrantMutex
		ifPresent: [:transientReentrantMutexClass |
			transientReentrantMutexClass isSupportedImplementation
				ifTrue: [^ false]].

	^ true.
]

{ #category : #'mutual exclusion' }
XMLStandardReentrantMutex >> critical: aBlock [
	^ mutex critical: aBlock
]

{ #category : #initialization }
XMLStandardReentrantMutex >> initialize [
	super initialize.

	mutex := (XMLClassFinder classNamed: #Mutex) new.
]
