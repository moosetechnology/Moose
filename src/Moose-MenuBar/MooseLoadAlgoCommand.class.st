Class {
	#name : #MooseLoadAlgoCommand,
	#superclass : #MooseAbstractLoadModuleCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadAlgoCommand class >> help [

	^ 'Algorithms for Moose'
]

{ #category : #'world menu' }
MooseLoadAlgoCommand class >> label [

	^ 'Moose Algo'
]

{ #category : #'world menu' }
MooseLoadAlgoCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseLoadAlgoCommand class >> menuPriority [

	^ 50
]

{ #category : #accessing }
MooseLoadAlgoCommand >> baselineName [

	^ 'SmaCC'
]

{ #category : #accessing }
MooseLoadAlgoCommand >> repositoryURL [

	^ 'github://moosetechnology/MooseAlgos:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadAlgoCommand >> version [

	^ 'v1.x.x'
]
