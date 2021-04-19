Class {
	#name : #MooseSmaCCToolEntry,
	#superclass : #MooseParserEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseSmaCCToolEntry class >> menuCommandOn: aBuilder [
	"method needed because for the pragma"
	<worldMenu>
	^(self toolEntryMenuCommandOn: aBuilder)
		withSeparatorAfter ;
		yourself
]

{ #category : #'world menu' }
MooseSmaCCToolEntry class >> menuPriority [ 
	^super menuPriority + 2
]

{ #category : #execution }
MooseSmaCCToolEntry >> execute [
	Metacello new
		baseline: 'SmaCC';
		repository: 'github://j-brant/SmaCC:' , self version, '/src';
		load
]

{ #category : #accessing }
MooseSmaCCToolEntry >> label [
	^ 'SmaCC'
]

{ #category : #accessing }
MooseSmaCCToolEntry >> version [
	^ 'master'
]
