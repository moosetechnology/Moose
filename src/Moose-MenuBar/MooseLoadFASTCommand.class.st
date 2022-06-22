Class {
	#name : #MooseLoadFASTCommand,
	#superclass : #MooseAbstractLoadFASTCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadFASTCommand class >> help [

	^ 'Famix AST Metamodel'
]

{ #category : #'world menu' }
MooseLoadFASTCommand class >> label [

	^ 'FAST Core'
]

{ #category : #'world menu' }
MooseLoadFASTCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseLoadFASTCommand class >> menuPriority [

	^ super menuPriority + 1
]

{ #category : #accessing }
MooseLoadFASTCommand >> baselineName [

	^ 'FAST'
]

{ #category : #accessing }
MooseLoadFASTCommand >> repositoryURL [

	^ 'github://moosetechnology/FAST:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadFASTCommand >> version [

	^ 'v1.x.x'
]
