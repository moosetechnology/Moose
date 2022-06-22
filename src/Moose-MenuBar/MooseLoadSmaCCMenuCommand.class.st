Class {
	#name : #MooseLoadSmaCCMenuCommand,
	#superclass : #MooseAbstractLoadParserMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseLoadSmaCCMenuCommand class >> help [

	^ 'Smacc parser'
]

{ #category : #accessing }
MooseLoadSmaCCMenuCommand class >> label [

	^ 'SmaCC'
]

{ #category : #'world menu' }
MooseLoadSmaCCMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self menuCommandOn: aBuilder forCommand: self)
		  withSeparatorAfter;
		  yourself
]

{ #category : #accessing }
MooseLoadSmaCCMenuCommand class >> menuPriority [

	^ super menuPriority + 2
]

{ #category : #accessing }
MooseLoadSmaCCMenuCommand >> baselineName [

	^ 'SmaCC'
]

{ #category : #accessing }
MooseLoadSmaCCMenuCommand >> repositoryURL [

	^ 'github://j-brant/SmaCC:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadSmaCCMenuCommand >> version [

	^ 'master'
]
