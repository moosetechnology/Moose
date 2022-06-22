Class {
	#name : #MooseASTEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseASTEntry class >> menuPriority [

	^ 10
]

{ #category : #execution }
MooseASTEntry >> label [
	^ 'AST representation'
]
