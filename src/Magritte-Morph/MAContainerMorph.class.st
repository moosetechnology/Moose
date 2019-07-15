Class {
	#name : #MAContainerMorph,
	#superclass : #MADescriptionMorph,
	#instVars : [
		'children',
		'answerBlock'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #decorating }
MAContainerMorph >> addButtons [
	self addButtons: #( save cancel )
]

{ #category : #decorating }
MAContainerMorph >> addButtons: anArray [
	morph := self rectangleMorph
		addMorphBack: self morph;
		addMorphBack: (self barMorph: anArray);
		yourself
]

{ #category : #decorating }
MAContainerMorph >> addWindow [
	| scrollPane newMorph |
	scrollPane := GeneralScrollPane new.
	newMorph := self morph 
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	scrollPane changeScrollerTableLayout; scrollTarget: newMorph.	


	morph := self windowMorph
		model: self;
		vResizing: #shrinkWrap;
		addMorph: (scrollPane layoutInset: 5 @ 5)
			frame: (0 @ 0 corner: 1 @ 1);
		yourself
]

{ #category : #answering }
MAContainerMorph >> answer: anObject [

	| didUserCancel |
	self morph delete.
	
	didUserCancel := anObject isNil.
	didUserCancel | answerBlock isNil ifTrue: [ ^ self ].

	answerBlock value: anObject.
]

{ #category : #private }
MAContainerMorph >> buildChildren [
	^ Array streamContents: [ :stream |
		self magritteDescription do: [ :each |
			each isVisible ifTrue: [
				stream nextPut: (each morphClass
					memento: self memento
					description: each
					parent: self) ] ] ]
]

{ #category : #private }
MAContainerMorph >> buildMorphViewOn: aMorph [

	| toolbar |
	aMorph
		listDirection: #topToBottom;
		cellInset: 3.
	self children do: [ :each |
		aMorph addMorphBack: each morph ].
	toolbar := self rectangleMorph
		listDirection: #leftToRight;
		cellInset: 4@0;
		layoutInset: 4@4;
		yourself.
	self model magritteActionButtons do: [ :e | toolbar addMorphBack: e ].
	aMorph addMorphBack: toolbar.
		
]

{ #category : #morphic }
MAContainerMorph >> callInHand [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInHand; waitUntilClosed.
	^ result
]

{ #category : #morphic }
MAContainerMorph >> callInWorld [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInWorld; waitUntilClosed.
	^ result
]

{ #category : #actions }
MAContainerMorph >> cancel [
	self reset; answer: nil
]

{ #category : #accessing }
MAContainerMorph >> children [
	^ children
]

{ #category : #'error handling' }
MAContainerMorph >> doesNotUnderstand: aMessage [
	"Forward callbacks from #addButtons: to the model if appropriate"

	(self model respondsTo: aMessage selector)
		ifTrue: [ self model perform: aMessage selector ]
		ifFalse: [ super doesNotUnderstand: aMessage ].
]

{ #category : #answering }
MAContainerMorph >> onAnswer: aBlock [
	answerBlock := aBlock
]

{ #category : #morphic }
MAContainerMorph >> openInHand [
	^ self morph openInHand
]

{ #category : #morphic }
MAContainerMorph >> openInWindow [

	^ self
		addWindow;
		openInWorld.
]

{ #category : #morphic }
MAContainerMorph >> openInWorld [
	^ self morph openInWorld
]

{ #category : #actions }
MAContainerMorph >> save [
	[ self validate ]
		on: MAValidationError
		do: [ :err | ^ self inform: err greaseString ].
	self commit; answer: self model
]

{ #category : #initialization }
MAContainerMorph >> setChildren: aCollection [
	children := aCollection
]

{ #category : #initialization }
MAContainerMorph >> setDescription: aDescription [
	super setDescription: aDescription.
	self setChildren: self buildChildren
]

{ #category : #morphic }
MAContainerMorph >> waitUntilClosed [
	[ self morph world notNil ]
		whileTrue: [ self morph outermostWorldMorph doOneCycle ]
]
