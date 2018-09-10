"
A simple cross-platform interface for finding classes that may not be in the image.
"
Class {
	#name : #XMLClassFinder,
	#superclass : #Object,
	#category : #'XML-Parser-Utils'
}

{ #category : #accessing }
XMLClassFinder class >> classNamed: aClassName [
	^ self
		classNamed: aClassName
		ifAbsent: [nil]
]

{ #category : #accessing }
XMLClassFinder class >> classNamed: aClassName ifAbsent: aBlock [
	"'self environment at:' is the proper way to get a class that may not
	exist, not 'Smalltalk at:', 'Smalltalk globals at:' or '#ClassName asClass'
	(assuming both this class and aClassName class are in the same environment)"
	^ self environment
		at: aClassName asSymbol
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLClassFinder class >> classNamed: aClassName ifPresent: aBlock [
	^ aBlock cull:
		(self
			classNamed: aClassName
			ifAbsent: [^ nil])
]

{ #category : #accessing }
XMLClassFinder class >> classNamed: aClassName ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ aPresentBlock cull:
		(self
			classNamed: aClassName
			ifAbsent: [^ anAbsentBlock value])
]

{ #category : #testing }
XMLClassFinder class >> hasClassNamed: aClassName [
	self
		classNamed: aClassName
		ifAbsent: [^ false].
	^ true.
]
