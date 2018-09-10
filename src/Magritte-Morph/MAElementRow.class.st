Class {
	#name : #MAElementRow,
	#superclass : #BorderedMorph,
	#instVars : [
		'object',
		'container'
	],
	#category : #'Magritte-Morph-Report'
}

{ #category : #'instance creation' }
MAElementRow class >> addMorphFor: anObject of: aDescriptionMorph to: aMorph [
	| instance |
	instance := self for: anObject of: aDescriptionMorph.
	aMorph addMorphBack: instance.
]

{ #category : #'instance creation' }
MAElementRow class >> for: anObject of: aDescriptionMorph [
	^ self basicNew
		object: anObject;
		container: aDescriptionMorph;
		initialize.
]

{ #category : #private }
MAElementRow >> buildButton: aSymbol [ 
	^ UITheme current builder newButtonFor: self action: aSymbol label: aSymbol capitalized help: ''.
]

{ #category : #private }
MAElementRow >> buildCommands [
	| commands |
	commands := self rectangleMorph
		listDirection: #leftToRight;
		cellInset: self cellInset;
		yourself.
	container magritteDescription isDefinitive ifFalse: [
		commands
			addMorphBack: (self buildButton: #edit);
			addMorphBack: (self buildButton: #remove) ].
	container magritteDescription isOrdered ifTrue: [
		self shouldBeImplemented.
		"commands
			addCommandOn: self selector: #up: text: 'up';
			addCommandOn: self selector: #down: text: 'down'" ].
	^ commands
]

{ #category : #private }
MAElementRow >> cellInset [

	^ 4@4.
]

{ #category : #private }
MAElementRow >> container: aDescriptionMorph [
	container := aDescriptionMorph
]

{ #category : #callbacks }
MAElementRow >> edit [

	object asMagritteMorph
		onAnswer: [ :result | self summary: result printString ];
		addButtons;
		addWindow;
		openInWorld.
]

{ #category : #private }
MAElementRow >> initialize [
	super initialize.
	self
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		listDirection: #leftToRight;
		cellInset: self cellInset;
		layoutInset: 0@2.
	self
		addMorphBack: (container magritteDescription displayStringFor: object) asMorph;
		addMorphBack: self buildCommands
]

{ #category : #private }
MAElementRow >> object: anObject [

	object := anObject
]

{ #category : #private }
MAElementRow >> rectangleMorph [
	^ MADescriptionMorph new rectangleMorph.
]

{ #category : #callbacks }
MAElementRow >> remove [
	container value: (container value copyWithout: object).
	self delete.
]

{ #category : #private }
MAElementRow >> summary: aString [
	submorphs first contents: aString
]

{ #category : #private }
MAElementRow >> value [
	^ self memento readUsing: self magritteDescription
]

{ #category : #private }
MAElementRow >> value: anObject [
	self memento write: anObject using: self magritteDescription
]
