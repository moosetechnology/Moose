Class {
	#name : #MooseParserEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseParserEntry class >> menuPriority [ 
	^20
]

{ #category : #execution }
MooseParserEntry >> label [
	^ 'Parser'
]
