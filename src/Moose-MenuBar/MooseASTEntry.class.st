Class {
	#name : #MooseASTEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseASTEntry class >> label [

	^ 'AST representation'
]

{ #category : #'world menu' }
MooseASTEntry class >> menuPriority [

	^ 10
]
