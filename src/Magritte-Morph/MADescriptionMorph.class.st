Class {
	#name : #MADescriptionMorph,
	#superclass : #Model,
	#instVars : [
		'memento',
		'description',
		'parent',
		'morph'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #'instance creation' }
MADescriptionMorph class >> memento: aMemento [
	^ self memento: aMemento description: aMemento magritteDescription
]

{ #category : #'instance creation' }
MADescriptionMorph class >> memento: aMemento description: aDescription [
	^ self memento: aMemento description: aDescription parent: nil
]

{ #category : #'instance creation' }
MADescriptionMorph class >> memento: aMemento description: aDescription parent: aComponent [
	^ self new
		setMemento: aMemento;
		setDescription: aDescription;
		setParent: aComponent;
		yourself
]

{ #category : #prototypes }
MADescriptionMorph >> barMorph: anArray [
	| bar |
	bar := self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #center;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself.
	anArray do: [ :selector |
		bar addMorphBack: (self buttonMorph: selector) ].
	^ bar
]

{ #category : #private }
MADescriptionMorph >> buildMorph [

	| result |
	result := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		yourself.
	self magritteDescription isReadonly
		ifTrue: [ self buildMorphViewOn: result ]
		ifFalse: [ self buildMorphEditorOn: result ].
	^ result
]

{ #category : #private }
MADescriptionMorph >> buildMorphEditorOn: aMorph [
	self buildMorphViewOn: aMorph
]

{ #category : #private }
MADescriptionMorph >> buildMorphViewOn: aMorph [
	self subclassResponsibility
]

{ #category : #prototypes }
MADescriptionMorph >> buttonMorph: aSelector [
	| button |
	button := PluggableButtonMorph
		on: self
		getState: #buttonState
		action: aSelector.
	button
		label: aSelector;
		hResizing: #spaceFill;
		shortcutCharacter: aSelector first.
	^ button
]

{ #category : #'private-morphic' }
MADescriptionMorph >> buttonState [
	^ true
]

{ #category : #actions }
MADescriptionMorph >> commit [
	self memento commit
]

{ #category : #'accessing-configuration' }
MADescriptionMorph >> defaultBackgroundColor [
	^ self magritteDescription morphColor
]

{ #category : #'accessing-configuration' }
MADescriptionMorph >> defaultSpacerSize [
	^ 5
]

{ #category : #accessing }
MADescriptionMorph >> magritteDescription [
	^ description
]

{ #category : #accessing }
MADescriptionMorph >> memento [
	^ memento
]

{ #category : #'accessing-dynamic' }
MADescriptionMorph >> model [
	^ self memento model
]

{ #category : #accessing }
MADescriptionMorph >> morph [
	^ morph ifNil: [ morph := self buildMorph ]
]

{ #category : #accessing }
MADescriptionMorph >> parent [
	^ parent
]

{ #category : #'private-morphic' }
MADescriptionMorph >> perform: selector orSendTo: otherTarget [
	^ (self respondsTo: selector)
		ifTrue: [ self perform: selector ]
		ifFalse: [ otherTarget perform: selector ]
]

{ #category : #prototypes }
MADescriptionMorph >> rectangleMorph [
	^ BorderedMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself
]

{ #category : #actions }
MADescriptionMorph >> reset [
	self memento reset
]

{ #category : #'accessing-dynamic' }
MADescriptionMorph >> root [
	^ self parent isNil
		ifTrue: [ self ]
		ifFalse: [ self parent root ]
]

{ #category : #initialization }
MADescriptionMorph >> setDescription: aDescription [
	description := aDescription
]

{ #category : #initialization }
MADescriptionMorph >> setMemento: aMemento [
	memento := aMemento
]

{ #category : #initialization }
MADescriptionMorph >> setParent: aMorph [
	parent := aMorph
]

{ #category : #prototypes }
MADescriptionMorph >> stringMorph [
	^ StringMorph new
]

{ #category : #actions }
MADescriptionMorph >> validate [
	"Flushes the cached state of some morphic elements (such as text-morphs) to the memento and then does the validation. I don't know of a better flush the morphic contents (happy flickering), probably morphic is just too limited to customize that easily or I am too dumb to find out."

	self morph allMorphsDo: [ :each |
		(each respondsTo: #accept)
			ifTrue: [ each accept ] ].
	self memento validate
]

{ #category : #prototypes }
MADescriptionMorph >> windowMorph [
	^ SystemWindow labelled: self magritteDescription label
]
