Class {
	#name : #MooseAbstractLoadFASTCommand,
	#superclass : #MooseAbstractLoadModuleCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseAbstractLoadFASTCommand class >> label [

	^ 'AST representation'
]

{ #category : #'world menu' }
MooseAbstractLoadFASTCommand class >> menuPriority [

	^ 10
]
