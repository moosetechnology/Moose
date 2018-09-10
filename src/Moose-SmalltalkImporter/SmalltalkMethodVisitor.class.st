Class {
	#name : #SmalltalkMethodVisitor,
	#superclass : #AbstractSmalltalkMethodVisitor,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #private }
SmalltalkMethodVisitor >> resolve: name [
	"Return a famix entity that correspond to the reference 'name' contained in a source code. It does the lookup according to the Smalltalk semantics"

	| object klass pool |
	(name = 'self' or: [ name = 'super' or: [ name = 'thisContext' ] ])
		ifTrue: [ ^ importer
				ensureImplicitVariable: name asSymbol
				inFamixMethod: famixMethod ].
	object := methodScope resolve: name ifAbsent: nil.
	object ~~ nil
		ifTrue: [ ^ object ].
	name asString = 'Smalltalk'
		ifTrue: [ ^ importer ensureNamespace: Smalltalk ].
	klass := self methodEntity smalltalkClass instanceSide.
	(klass usesLocalPoolVarNamed: name)
		ifTrue: [ pool := klass sharedPoolOfVarNamed: name.
			^ self importer ensureClassVarAttribute: name for: pool ].
	(Smalltalk globals includesKey: name asSymbol)
		ifFalse: [ ^ importer ensureUnknownVariable: name ].

	"The name must be a global accessible variable"
	object := Smalltalk at: name asSymbol.
	object isBehavior
		ifTrue: [ ^ importer ensureClass: object class ].
	^ importer ensureGlobalVariable: name asSymbol value: object
]
