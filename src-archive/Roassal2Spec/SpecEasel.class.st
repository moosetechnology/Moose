"
I am a demo of how to use the Spec Roassal Integration. I implement the behavior that was originally present in the Roassal Easel.

To run, do-it of the following: 
SpecEasel  new openWithSpec
"
Class {
	#name : #SpecEasel,
	#superclass : #ComposableModel,
	#instVars : [
		'label',
		'text',
		'diagram',
		'button'
	],
	#category : #'Roassal2Spec-Example'
}

{ #category : #specs }
SpecEasel class >> defaultSpec [ 
	<spec: #default>
	^ SpecLayout composed
		newColumn: [:tcol|
			tcol newRow: [:trow|
				trow newColumn: [:left |
					left
						add: #label height: self toolbarHeight;
						add: #text ;
						add: #button height: self toolbarHeight ] width: 400.
				trow add: #diagram]].
]

{ #category : #accessing }
SpecEasel >> button [
	^ button
]

{ #category : #accessing }
SpecEasel >> button: anObject [
	button := anObject
]

{ #category : #accessing }
SpecEasel >> diagram [
	^ diagram
]

{ #category : #accessing }
SpecEasel >> diagram: anObject [
	diagram := anObject
]

{ #category : #accessing }
SpecEasel >> extent [
	^800@600
]

{ #category : #initialization }
SpecEasel >> initializePresenter [

	"This causes the diagram's script to be executed again."
	button action: [ diagram refresh ]
]

{ #category : #initialization }
SpecEasel >> initializeWidgets [

	label := self newLabel.
	label label: 'Enter code below. Both view and canvas are accessible' .

	text := self newText.
	text text: self startText.
	text autoAccept: true.

	button := self newButton.
	button label: 'Draw this!'.

	diagram := self instantiate: RoassalModel.	
	"This is the code for the Roassal view.
	The block takes both a view and a canvas."
	diagram script: [ :view :canvas | self textAsCode value: view value: canvas ]
]

{ #category : #accessing }
SpecEasel >> label [
	^ label
]

{ #category : #accessing }
SpecEasel >> label: anObject [
	label := anObject
]

{ #category : #accessing }
SpecEasel >> startText [
	^
'|els|
	els := RTEllipse new
				size: #yourself;
				elementsOn: ((1 to: 20) collect: [ :v | 50 atRandom ]).
	view addAll: els.
	RTCellLayout new lineItemsCount: 5; on: view elements.
	
	view @ RTDraggableView.
	canvas camera focusOnCenterScaled: 300.
'  asText
]

{ #category : #accessing }
SpecEasel >> text [
	^ text
]

{ #category : #accessing }
SpecEasel >> text: anObject [
	text := anObject
]

{ #category : #drawing }
SpecEasel >> textAsCode [
	"This could be made more clever with regard to compilation and runtime errors. But for this simple example it should suffice."
	^OpalCompiler evaluate: '[:view :canvas | ', self text getText asString , ']'
		logged: false
	
]

{ #category : #accessing }
SpecEasel >> title [
	^ 	'The Spec Roassal Canvas'
]
