Class {
	#name : #MooseAlgoToolEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseAlgoToolEntry >> execute [
	Metacello new
		baseline: 'SmaCC';
		repository: 'github://jmoosetechnology/MooseAlgos:' , self version, '/src';
		load
]

{ #category : #accessing }
MooseAlgoToolEntry >> label [
	^ 'Moose Algo'
]

{ #category : #accessing }
MooseAlgoToolEntry >> version [
	^ 'v1.1.3'
]
