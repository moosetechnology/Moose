Class {
	#name : #MooseLoadAlgosMenuCommand,
	#superclass : #MooseAbstractLoadModuleMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseLoadAlgosMenuCommand class >> help [

	^ 'Algorithms for Moose'
]

{ #category : #accessing }
MooseLoadAlgosMenuCommand class >> label [

	^ 'Moose Algo'
]

{ #category : #'world menu' }
MooseLoadAlgosMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseLoadAlgosMenuCommand class >> menuPriority [

	^ 50
]

{ #category : #accessing }
MooseLoadAlgosMenuCommand >> baselineName [

	^ 'SmaCC'
]

{ #category : #accessing }
MooseLoadAlgosMenuCommand >> repositoryURL [

	^ 'github://moosetechnology/MooseAlgos:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadAlgosMenuCommand >> version [

	^ 'v1.x.x'
]
