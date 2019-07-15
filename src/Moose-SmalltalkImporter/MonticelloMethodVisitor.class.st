Class {
	#name : #MonticelloMethodVisitor,
	#superclass : #AbstractSmalltalkMethodVisitor,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #private }
MonticelloMethodVisitor >> resolve: name [ 
	"Return a famix entity that correspond to the reference 'name' contained in a source code. It does the lookup according to the Smalltalk semantics"

	| object |
	(name = 'self' or: [ name = 'super' or: [ name = 'thisContext' ] ]) ifTrue: 
		[ ^ importer 
			ensureImplicitVariable: name asSymbol
			inFamixMethod: famixMethod ].
	object := methodScope 
		resolve: name
		ifAbsent: nil.
	object ~~ nil ifTrue: [ ^ object ].
	
	^importer ensureClass: name asSymbol
]
