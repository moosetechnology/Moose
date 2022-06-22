Class {
	#name : #MooseLoadFASTJavaCommand,
	#superclass : #MooseAbstractLoadFASTCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadFASTJavaCommand class >> help [

	^ 'Famix representation of Java AST'
]

{ #category : #'world menu' }
MooseLoadFASTJavaCommand class >> label [

	^ 'FAST Java'
]

{ #category : #'world menu' }
MooseLoadFASTJavaCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self menuCommandOn: aBuilder forCommand: self)
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseLoadFASTJavaCommand class >> menuPriority [

	^ super menuPriority + 2
]

{ #category : #accessing }
MooseLoadFASTJavaCommand >> baselineName [

	^ 'FASTJava'
]

{ #category : #accessing }
MooseLoadFASTJavaCommand >> repositoryURL [

	^ 'github://moosetechnology/FAST-Java:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadFASTJavaCommand >> version [

	^ 'v1.x.x'
]
