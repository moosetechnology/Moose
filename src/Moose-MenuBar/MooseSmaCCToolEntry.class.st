Class {
	#name : #MooseSmaCCToolEntry,
	#superclass : #MooseParserEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseSmaCCToolEntry >> execute [
	Metacello new
		baseline: 'SmaCC';
		repository: 'github://j-brant/SmaCC' , self version, '/src';
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
