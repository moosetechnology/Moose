"
I am a description of multiline strings, possible values are instances of ==String==. My visual representation could be a text-area field.
"
Class {
	#name : #MAMemoDescription,
	#superclass : #MAStringDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAMemoDescription class >> defaultLineCount [
	^ 3
]

{ #category : #accessing }
MAMemoDescription class >> label [
	^ 'Memo'
]

{ #category : #visiting }
MAMemoDescription >> acceptMagritte: aVisitor [
	aVisitor visitMemoDescription: self
]

{ #category : #'acessing-magritte' }
MAMemoDescription >> descriptionLineCount [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #lineCount;
		label: 'Number of Lines';
		priority: 400;
		default: self class defaultLineCount;
		beInteger;
		min: 1;
		yourself
]

{ #category : #'accessing-properties' }
MAMemoDescription >> lineCount [
	^ self propertyAt: #lineCount ifAbsent: [ self class defaultLineCount ]
]

{ #category : #'accessing-properties' }
MAMemoDescription >> lineCount: anInteger [
	self propertyAt: #lineCount put: anInteger
]
