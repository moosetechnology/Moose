Class {
	#name : #MooseAbstractLoadFASTMenuCommand,
	#superclass : #MooseAbstractLoadModuleMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseAbstractLoadFASTMenuCommand class >> label [

	^ 'AST representation'
]

{ #category : #accessing }
MooseAbstractLoadFASTMenuCommand class >> menuPriority [

	^ 10
]
