Class {
	#name : #MooseFASTJavaToolEntry,
	#superclass : #MooseASTEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseFASTJavaToolEntry class >> help [

	^ 'Famix representation of Java AST'
]

{ #category : #'world menu' }
MooseFASTJavaToolEntry class >> label [

	^ 'FAST Java'
]

{ #category : #'world menu' }
MooseFASTJavaToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self toolEntryMenuCommandOn: aBuilder)
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseFASTJavaToolEntry class >> menuPriority [

	^ super menuPriority + 2
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> baselineName [

	^ 'FASTJava'
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> repositoryURL [

	^ 'github://moosetechnology/FAST-Java:' , self version , '/src'
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> version [

	^ 'v1.x.x'
]
