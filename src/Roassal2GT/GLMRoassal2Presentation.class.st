"
A GLMRoassalPresentation is xxxxxxxxx.

Instance Variables
	newViewBlock:		<Object>
	painting:		<Object>
	paintingBlock:		<Object>
	shouldPopulateSelection:		<Object>
	view:		<Object>

newViewBlock
	- xxxxx

painting
	- xxxxx

paintingBlock
	- xxxxx

shouldPopulateSelection
	- xxxxx

view
	- xxxxx

"
Class {
	#name : #GLMRoassal2Presentation,
	#superclass : #GLMPresentation,
	#instVars : [
		'painting',
		'paintingBlock',
		'view',
		'shouldPopulateSelection',
		'newViewBlock'
	],
	#category : #'Roassal2GT-Glamour'
}

{ #category : #'scripting actions' }
GLMRoassal2Presentation >> act: aBlock entitled: aString categorized: anotherString help: anotherString2 [
	 
	self 
		addAction: 
			((GLMGenericAction new) 
				action: aBlock; 
				title: aString; 
				category: anotherString;
				help: anotherString2;
				yourself)
]

{ #category : #'initialize-release' }
GLMRoassal2Presentation >> defaultActions [
	GLMRoassal2Action initializePresentation: self
]

{ #category : #context }
GLMRoassal2Presentation >> getContextFor: aView [
	"Return the context associated to the view. It none is defined, then this method create one, and set it in view."
	| context |
	context :=  RTAbstractViewContext getContextFor: aView.
	context view: aView.
	context presentation: self. 
	^ context
]

{ #category : #'initialize-release' }
GLMRoassal2Presentation >> initialize [ 
	super initialize.
	newViewBlock := [ RTView new ].
	shouldPopulateSelection := true.
	self defaultActions
]

{ #category : #accessing }
GLMRoassal2Presentation >> initializeView: aZeroArgBlock [
	^ newViewBlock := aZeroArgBlock 
]

{ #category : #accessing }
GLMRoassal2Presentation >> newView [
	view := nil.
	^ self view
]

{ #category : #accessing }
GLMRoassal2Presentation >> newViewBlock [
	^ newViewBlock
]

{ #category : #'initialize-release' }
GLMRoassal2Presentation >> openIfPossible: fileName [
	"
	By Sean
	
	Gofer it
	smalltalkhubUser: 'SeanDeNigris' project: 'SeansPlayground';
	package: 'NewExternalWebBrowser';
	load.

	'http://google.com' asUrl open.
	"
	
	#NewExternalWebBrowser asClassIfPresent: [ :cls | fileName asUrl open ].
	#NewExternalWebBrowser asClassIfAbsent: [ 
		self inform: 'Try to load NewExternalWebBrowser to fast open of this file' ].
]

{ #category : #scripting }
GLMRoassal2Presentation >> painting: anObject [
	paintingBlock := anObject
]

{ #category : #accessing }
GLMRoassal2Presentation >> paintingBlock [
	^ paintingBlock
]

{ #category : #rendering }
GLMRoassal2Presentation >> renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer renderRoassal2Presentation: self
]

{ #category : #rendering }
GLMRoassal2Presentation >> renderOn: aViewOrBuilder [
	self paintingBlock
		glamourValue:
			aViewOrBuilder asGlamorousMultiValue , self entity asGlamorousMultiValue
				, self asGlamorousMultiValue.
	aViewOrBuilder build.
	self useContextToInitialize: aViewOrBuilder view.
	self view: aViewOrBuilder
]

{ #category : #accessing }
GLMRoassal2Presentation >> shouldPopulateSelection [
	^ shouldPopulateSelection
]

{ #category : #accessing }
GLMRoassal2Presentation >> shouldPopulateSelection: aBoolean [
	"Configure whether elements present in the view should be clickable or not"
	shouldPopulateSelection := aBoolean
]

{ #category : #context }
GLMRoassal2Presentation >> useContextToInitialize: roassalView [
	"Use the context of the view to initilize the view"
	| context |
	context := self getContextFor: roassalView.
	context adjustView: roassalView inPresentation: self
]

{ #category : #accessing }
GLMRoassal2Presentation >> view [
	^ view ifNil: [ view := self newViewBlock value ]
]

{ #category : #accessing }
GLMRoassal2Presentation >> view: aRTView [
	view := aRTView
]
