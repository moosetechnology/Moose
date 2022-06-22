Class {
	#name : #MooseSmaCCToolEntry,
	#superclass : #MooseParserEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseSmaCCToolEntry class >> help [

	^ 'Smacc parser'
]

{ #category : #'world menu' }
MooseSmaCCToolEntry class >> label [

	^ 'SmaCC'
]

{ #category : #'world menu' }
MooseSmaCCToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self toolEntryMenuCommandOn: aBuilder)
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseSmaCCToolEntry class >> menuPriority [

	^ super menuPriority + 2
]

{ #category : #accessing }
MooseSmaCCToolEntry >> baselineName [

	^ 'SmaCC'
]

{ #category : #accessing }
MooseSmaCCToolEntry >> repositoryURL [

	^ 'github://j-brant/SmaCC:' , self version , '/src'
]

{ #category : #accessing }
MooseSmaCCToolEntry >> version [

	^ 'master'
]
