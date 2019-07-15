"
An abstract class for reentrant mutexes that support nested sends of #critical: by the same process without deadlocking.
"
Class {
	#name : #XMLReentrantMutex,
	#superclass : #XMLAbstractFactory,
	#category : #'XML-Parser-Utils'
}

{ #category : #testing }
XMLReentrantMutex class >> canBeImplemented [
	^ true
]

{ #category : #finding }
XMLReentrantMutex class >> noSupportedImplementationFound [
	Error signal: 'No supported reentrant mutex class available'
]

{ #category : #defaults }
XMLReentrantMutex class >> preferredImplementation [
	"Prefer the Pharo/Squeak Mutex-based implementation"
	^ XMLStandardReentrantMutex
]

{ #category : #'mutual exclusion' }
XMLReentrantMutex >> critical: aBlock [
	self subclassResponsibility
]
