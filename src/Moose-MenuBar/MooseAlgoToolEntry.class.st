Class {
	#name : #MooseAlgoToolEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAlgoToolEntry class >> help [

	^ 'Algorithms for Moose'
]

{ #category : #'world menu' }
MooseAlgoToolEntry class >> label [

	^ 'Moose Algo'
]

{ #category : #'world menu' }
MooseAlgoToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseAlgoToolEntry class >> menuPriority [

	^ 50
]

{ #category : #accessing }
MooseAlgoToolEntry >> baselineName [

	^ 'SmaCC'
]

{ #category : #accessing }
MooseAlgoToolEntry >> repositoryURL [

	^ 'github://moosetechnology/MooseAlgos:' , self version , '/src'
]

{ #category : #accessing }
MooseAlgoToolEntry >> version [

	^ 'v1.x.x'
]
