Class {
	#name : #RTAbstractViewContext,
	#superclass : #RTObject,
	#instVars : [
		'view',
		'presentation'
	],
	#category : #'Roassal2GT-Glamour-Context'
}

{ #category : #'private - utility' }
RTAbstractViewContext class >> createContext [
	"Define a new context in case none has been set"
	^ self defaultContextClass new
]

{ #category : #context }
RTAbstractViewContext class >> defaultContextClass [
	"Return the default context used by Glamour when no context is set"
	^ self withAllSubclasses detect: #isDefault
]

{ #category : #'private - utility' }
RTAbstractViewContext class >> getContextFor: aView [
	"Return the context associated to the view. It none is defined, then this method create one, and set it in view."
	^ aView attributeAt: #GlamourContext ifAbsentPut: [ self createContext ].

]

{ #category : #testing }
RTAbstractViewContext class >> isDefault [
	^ false
]

{ #category : #public }
RTAbstractViewContext class >> setOnView: aView [
	"Set the context on the view"
	(aView hasAttribute: #GlamourContext) ifTrue: [ 
		(aView attributeAt: #GlamourContext) unregisterPreviousContext
	].
	aView attributeAt: #GlamourContext put: self new
]

{ #category : #public }
RTAbstractViewContext >> adjustView: aView inPresentation: aPresentation. [
	self view: aView.
	self presentation: aPresentation.
	self registerCallbacks
]

{ #category : #accessing }
RTAbstractViewContext >> canvas [
	^ view canvas
]

{ #category : #hooks }
RTAbstractViewContext >> interactionsToBeRegistered [
	"Override to return a list of classes that have be to registered"
	self subclassResponsibility
]

{ #category : #accessing }
RTAbstractViewContext >> presentation [
	"Return the Roassal2Presentation in which I am used"
	^ presentation
]

{ #category : #accessing }
RTAbstractViewContext >> presentation: aPresentation [
	self assert: [ aPresentation isKindOf: GLMRoassal2Presentation ] description: 'Only a GLMRoassal2Presentation can be provided here'.
	presentation := aPresentation
]

{ #category : #documentation }
RTAbstractViewContext >> readme [
"
RTAbstractViewContext is the root class of the view contexts. A view context bridges Roassal with GT. 
You need to create a subclass of RTAbstractViewContext if you want to define a particular operation involving GT 

"
]

{ #category : #public }
RTAbstractViewContext >> registerCallbacks [
	"Register the different interactions on the view"
	self interactionsToBeRegistered 
		do: [ :intClass | self view @ (intClass new presentation: self presentation) ]
]

{ #category : #public }
RTAbstractViewContext >> removeFromView [
	"Remove the context from the view. All the callbacks due to the interaction are removed as well"
	self view removeAttributeAt: #GlamourContext ifAbsent: [ ].

	self interactionsToBeRegistered do: [ :intClass | 
		self view removeInteractionIfPresent: intClass ]
]

{ #category : #public }
RTAbstractViewContext >> unregisterPreviousContext [
	self view ifNil: [ ^ self ].
	(self class getContextFor: self view) removeFromView
]

{ #category : #accessing }
RTAbstractViewContext >> view [
	^ view
]

{ #category : #accessing }
RTAbstractViewContext >> view: aView [
	"Set the view in the context"
	self assert: [ aView isKindOf: RTView ] description: 'Only a roassal view may be provided'.
	view := aView
]
