Class {
	#name : #MooseFASTJavaToolEntry,
	#superclass : #MooseASTEntry,
	#category : #'Moose-MenuBar'
}

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

{ #category : #execution }
MooseFASTJavaToolEntry >> execute [
	Metacello new
		baseline: 'FASTJava';
		repository: 'github://moosetechnology/FAST-Java:' , self version, '/src';
		load
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> label [
	^ 'FAST Java'
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> version [
	^ 'v1.x.x'
]
