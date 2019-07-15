"
This object holds the state for the scanner so that multiple GLR parses can use the same scanner by simply restoring the state.

    Instance Variables
	position		<Integer>	current location in the input stream
	scope		<Symbol>	the type of item to be scanned (most of the time #default)
"
Class {
	#name : #SmaCCScannerState,
	#superclass : #Object,
	#instVars : [
		'position',
		'scope'
	],
	#category : #'SmaCC_GLR_Runtime'
}

{ #category : #'instance creation' }
SmaCCScannerState class >> position: anInteger scope: aSymbol [
	^ self new
		position: anInteger;
		scope: aSymbol;
		yourself
]

{ #category : #comparing }
SmaCCScannerState >> = anObject [
	^ self class = anObject class and: [ self position = anObject position and: [ self scope = anObject scope ] ]
]

{ #category : #comparing }
SmaCCScannerState >> hash [
	^ position hash hashMultiply bitXor: scope hash
]

{ #category : #accessing }
SmaCCScannerState >> position [
	^ position
]

{ #category : #accessing }
SmaCCScannerState >> position: anInteger [
	position := anInteger
]

{ #category : #accessing }
SmaCCScannerState >> scope [
	^ scope
]

{ #category : #accessing }
SmaCCScannerState >> scope: aSymbol [
	scope := aSymbol
]
