Class {
	#name : #RTInteractiveComposer,
	#superclass : #RTObject,
	#instVars : [
		'rules',
		'nextWindow'
	],
	#category : #'Roassal2-InteractiveComposer'
}

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> for: aClass do: oneArgBlock [
	self if: [ :obj | obj class == aClass or: [ obj class inheritsFrom: aClass ] ] do: oneArgBlock
]

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> forCollectionOf: aClass do: oneArgBlock [
	self if: [ :obj | (obj isCollection and: [ obj notEmpty ]) and: [ obj anyOne class inheritsFrom: aClass ] ] do: oneArgBlock
]

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> if: aPredicateAsOneArgBlock do: oneArgBlock [
	rules add: (aPredicateAsOneArgBlock -> oneArgBlock).
]

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> initialize [
	super initialize.
	rules := OrderedCollection new
]

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> openOn: anObject [
	"Return the window that was open"
	| r builderOrView window |
	r := (self ruleFor: anObject).
	r ifNil: [ ^ nil ].
	builderOrView := (r value rtValue: anObject).
	self prepareForInteraction: builderOrView.
	window := builderOrView view open.
	builderOrView view canvas camera focusOnCenterScaled.
	^ window
]

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> prepareForInteraction: aViewOrBuilder [
	| view |
	aViewOrBuilder build.
	view := aViewOrBuilder view.
	 
	view elements when: TRMouseClick do: [ :evt |
		| w |
		
		w := self openOn: evt element model.
		(nextWindow notNil and: [ w notNil ]) ifTrue: [ 
			w position: nextWindow position.
			w extent: nextWindow extent.
			nextWindow delete.
		].
		nextWindow := w.
	]
]

{ #category : #'as yet unclassified' }
RTInteractiveComposer >> ruleFor: anObject [
	^ rules detect: [ :assoc | assoc key value: anObject ] ifNone: [ ^ nil ]
]
