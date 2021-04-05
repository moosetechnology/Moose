Class {
	#name : #MooseAlgoToolEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAlgoToolEntry class >> menuCommandOn: aBuilder [
	"method needed because for the pragma"
	<worldMenu>
	^self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseAlgoToolEntry class >> menuPriority [ 
	^50
]

{ #category : #execution }
MooseAlgoToolEntry >> execute [
	Metacello new
		baseline: 'SmaCC';
		repository: 'github://moosetechnology/MooseAlgos:' , self version, '/src';
		load
]

{ #category : #accessing }
MooseAlgoToolEntry >> label [
	^ 'Moose Algo'
]

{ #category : #accessing }
MooseAlgoToolEntry >> version [
	^ 'v1.x.x'
]
