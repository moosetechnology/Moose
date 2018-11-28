Class {
	#name : #GLMMorphicMagritteRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'scrollPane',
		'containerMorphClass'
	],
	#category : #'Glamour-Magritte-Presentations'
}

{ #category : #rendering }
GLMMorphicMagritteRenderer >> actOnPresentationUpdated: ann [
	scrollPane scrollTarget: (self magritteMorphFrom: ann presentation) 
]

{ #category : #rendering }
GLMMorphicMagritteRenderer >> magritteMorphFrom: aMagrittePresentation [
	| toShow description magritteMorph magritteDescriptionMorph |
	toShow := aMagrittePresentation displayValue.
	description := (aMagrittePresentation magritteDescription glamourValue: toShow) copy.
	"Using MAContainerMorph can raise some problems, as it try to delete morphs after commiting. We don't want this behavior."
	(description morphClass = MAContainerMorph)
		ifTrue: [description morphClass: MASilentContainerMorph]. 
	magritteDescriptionMorph :=  (description asMorphOn: toShow)
		onAnswer: [ :value | aMagrittePresentation reactOnAnswerFor: value ].
	magritteMorph := magritteDescriptionMorph
		addButtons;
		morph.
	magritteMorph
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutChanged.
	^ magritteMorph
]

{ #category : #rendering }
GLMMorphicMagritteRenderer >> render: aMagrittePresentation [		.
	scrollPane := GeneralScrollPane new.
	scrollPane changeScrollerTableLayout.
	scrollPane scrollTarget: (self magritteMorphFrom: aMagrittePresentation).
	scrollPane layoutFrame: (LayoutFrame identity 
		topOffset: 25).

	aMagrittePresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^ scrollPane
]
