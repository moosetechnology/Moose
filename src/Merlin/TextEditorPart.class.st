Class {
	#name : #TextEditorPart,
	#superclass : #WizardPart,
	#instVars : [
		'contents',
		'textEditorContents',
		'horizontalSize',
		'verticalSize'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'instance creation' }
TextEditorPart class >> inGroupboxNamed: aString [

	^ super new initializeInGroupboxNamed: aString; yourself.
]

{ #category : #'instance creation' }
TextEditorPart class >> inGroupboxNamed: aString defaultText: anotherString [

	^ super new initializeInGroupboxNamed: aString withDefaultText: anotherString ; yourself.
]

{ #category : #accessing }
TextEditorPart >> horizontalSize [

	^ horizontalSize
]

{ #category : #accessing }
TextEditorPart >> horizontalSize: anInteger [

	horizontalSize := anInteger
]

{ #category : #accessing }
TextEditorPart >> latePopulateContents [
	| default |
	default := self valueOf: self defaultValue.
	default ifNotNil: [ :aString | self textEditorContents: aString ]
]

{ #category : #rendering }
TextEditorPart >> merlinRendering [

	^ self renderer merlinTextEditorRenderingFor: self
]

{ #category : #'accessing - wizard mangement' }
TextEditorPart >> outputValue [

	"^ self textEditorContents."
	^ textEditorContents 
]

{ #category : #'text editor control' }
TextEditorPart >> textEditorContents [
	^textEditorContents
]

{ #category : #'text editor control' }
TextEditorPart >> textEditorContents: newContents [
	textEditorContents := newContents.
	self changed: #textEditorContents
]

{ #category : #accessing }
TextEditorPart >> textEditorHorizontalSize: anInteger [ 

	self horizontalSize: anInteger.
]

{ #category : #accessing }
TextEditorPart >> textEditorVerticalSize: anInteger [ 

	self verticalSize: anInteger.  
]

{ #category : #accessing }
TextEditorPart >> verticalSize [

	^ verticalSize
]

{ #category : #accessing }
TextEditorPart >> verticalSize: anInteger [

	verticalSize := anInteger
]
