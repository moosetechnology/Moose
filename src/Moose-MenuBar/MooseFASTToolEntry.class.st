Class {
	#name : #MooseFASTToolEntry,
	#superclass : #MooseASTEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseFASTToolEntry class >> help [

	^ 'Famix AST Metamodel'
]

{ #category : #'world menu' }
MooseFASTToolEntry class >> label [

	^ 'FAST Core'
]

{ #category : #'world menu' }
MooseFASTToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseFASTToolEntry class >> menuPriority [

	^ super menuPriority + 1
]

{ #category : #accessing }
MooseFASTToolEntry >> baselineName [

	^ 'FAST'
]

{ #category : #accessing }
MooseFASTToolEntry >> repositoryURL [

	^ 'github://moosetechnology/FAST:' , self version , '/src'
]

{ #category : #accessing }
MooseFASTToolEntry >> version [

	^ 'v1.x.x'
]
