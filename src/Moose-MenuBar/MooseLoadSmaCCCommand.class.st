Class {
	#name : #MooseLoadSmaCCCommand,
	#superclass : #MooseAbstractLoadParserCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadSmaCCCommand class >> help [

	^ 'Smacc parser'
]

{ #category : #'world menu' }
MooseLoadSmaCCCommand class >> label [

	^ 'SmaCC'
]

{ #category : #'world menu' }
MooseLoadSmaCCCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self menuCommandOn: aBuilder forCommand: self)
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseLoadSmaCCCommand class >> menuPriority [

	^ super menuPriority + 2
]

{ #category : #accessing }
MooseLoadSmaCCCommand >> baselineName [

	^ 'SmaCC'
]

{ #category : #accessing }
MooseLoadSmaCCCommand >> repositoryURL [

	^ 'github://j-brant/SmaCC:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadSmaCCCommand >> version [

	^ 'master'
]
