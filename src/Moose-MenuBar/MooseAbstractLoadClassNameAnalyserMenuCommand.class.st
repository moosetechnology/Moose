Class {
	#name : #MooseAbstractLoadClassNameAnalyserMenuCommand,
	#superclass : #MooseAbstractLoadToolMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseAbstractLoadClassNameAnalyserMenuCommand class >> label [

	^ 'Class Name Analyser'
]

{ #category : #'world menu' }
MooseAbstractLoadClassNameAnalyserMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self menuCommandOn: aBuilder forCommand: self)
		  withSeparatorAfter;
		  yourself
]

{ #category : #accessing }
MooseAbstractLoadClassNameAnalyserMenuCommand class >> menuPriority [

	^ super menuPriority + 2
]

{ #category : #accessing }
MooseAbstractLoadClassNameAnalyserMenuCommand >> baselineName [

	^ 'ClassNameAnalyser'
]

{ #category : #accessing }
MooseAbstractLoadClassNameAnalyserMenuCommand >> repositoryURL [

	^ 'github://moosetechnology/ClassNameAnalyser:' , self version , '/src'
]

{ #category : #accessing }
MooseAbstractLoadClassNameAnalyserMenuCommand >> version [

	^ 'master'
]
