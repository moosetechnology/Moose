Class {
	#name : #MerlinMorphicPaneRenderer,
	#superclass : #MerlinMorphicRenderer,
	#instVars : [
		'wizardPane',
		'wizardRenderer',
		'nextButtonActions',
		'terminateButtonActions'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #updating }
MerlinMorphicPaneRenderer >> adaptSize [
	"Adapt the size of the window to its contents. Usefull when you dynamically add elements to your window. (In fact simply re-open the window)"
	
	self builder openModal: self dialogWindow.
]

{ #category : #updating }
MerlinMorphicPaneRenderer >> applyChanges [
	"make sure that all changes become visible in the frame"
	
	| contentMorph |
	contentMorph := self dialogWindow contentMorph.
	contentMorph notNil
		ifTrue: [self dialogWindow contentMorph: contentMorph; model: nil].
]

{ #category : #'accessing - buttons' }
MerlinMorphicPaneRenderer >> backSign [
	^ '<< Back'
]

{ #category : #rendering }
MerlinMorphicPaneRenderer >> buttons: aCollectionOfButtons [
	"set the value of the buttons that will be visible at the right end of the WizardPane "
	
	self dialogWindow buttons: aCollectionOfButtons.
	self applyChanges.
]

{ #category : #'buttons actions' }
MerlinMorphicPaneRenderer >> cancelButtonAction [
	"represent the action to execute when the cancel button is pressed"
	self wizardPane cancelButtonAction.
	self wizardRenderer performCancelButtonAction
]

{ #category : #rendering }
MerlinMorphicPaneRenderer >> displayButtons [

	"each subclass should know which kind of buttons should be displayed in the dialog and what are the corresponding actions"
	^ self subclassResponsability
]

{ #category : #'accessing - buttons' }
MerlinMorphicPaneRenderer >> forwardSign [
	^ 'Next >>'
]

{ #category : #'initialize-release' }
MerlinMorphicPaneRenderer >> initialize [

	super initialize.
	self nextButtonActions: OrderedCollection new.  
	self terminateButtonActions: OrderedCollection new.  
]

{ #category : #'util - morph creation' }
MerlinMorphicPaneRenderer >> newButtonNamed: aString withAction: selector [
	"use this method to create a new classic button that will execute the method designed by selector when clicked. The method selector must be defined and implemented."
	
	| button |
	button := PluggableButtonMorph on: self getState: nil action: selector.
	button label: aString.
	^button
]

{ #category : #'accessing - buttons' }
MerlinMorphicPaneRenderer >> newCancelButton [
	"Each kind of pane contain a cancel button that enable to close the dialog window"

	^ self newButtonNamed: 'Cancel' withAction: #cancelButtonAction.
	
]

{ #category : #'accessing - buttons' }
MerlinMorphicPaneRenderer >> newFinishButton [
	
	^ self newButtonNamed: 'Finish' withAction: #terminateButtonAction.
]

{ #category : #'accessing - buttons' }
MerlinMorphicPaneRenderer >> newNextButton [
	^ self newButtonNamed: self forwardSign withAction: #nextButtonAction
]

{ #category : #'accessing - buttons' }
MerlinMorphicPaneRenderer >> newPreviousButton [
	^ self newButtonNamed: self backSign withAction: #previousButtonAction
]

{ #category : #'buttons actions' }
MerlinMorphicPaneRenderer >> nextButtonAction [
	"action executed when the next button is pressed"
	
	self nextButtonActions do: [:aBlock | aBlock value].
	self wizardPane nextButtonAction.
	self wizardRenderer performNextButtonAction.
]

{ #category : #'next button - actions' }
MerlinMorphicPaneRenderer >> nextButtonActions [

	^ nextButtonActions 
]

{ #category : #'next button - actions' }
MerlinMorphicPaneRenderer >> nextButtonActions: aCollectionOfBlocks [

	nextButtonActions := aCollectionOfBlocks
]

{ #category : #'buttons actions' }
MerlinMorphicPaneRenderer >> previousButtonAction [
	"action executed when the previous button is pressed"
	self wizardPane previousButtonAction.
	self wizardRenderer performPreviousButtonAction.
]

{ #category : #updating }
MerlinMorphicPaneRenderer >> refresh [

	^ self wizardRenderer refresh  
]

{ #category : #rendering }
MerlinMorphicPaneRenderer >> render: aWizardPane [

	|tmpPanelMorph tmpCellMorph|
	tmpPanelMorph := PanelMorph new
						hResizing: #spaceFill;
						vResizing: #spaceFill;
						fillStyle: Color transparent; 
						changeTableLayout;
						yourself.  
	self wizardPane: aWizardPane.
	self wizardPane failingConditions do: [:aString |
		|tmpText|
		tmpText := ('*',aString) asText. 
		tmpText addAttribute: (TextColor new color: Color red; yourself) from: 1 to: tmpText size.
		tmpPanelMorph addMorphBack: tmpText asMorph
		].
	tmpCellMorph := self wizardPane mainPaneLine renderOnMerlinRenderer: self.
	tmpPanelMorph addMorphBack:  tmpCellMorph.
	self dialogWindow  contentMorph: tmpPanelMorph.
	self applyChanges.
	self displayButtons.
	self setName.
	^ self dialogWindow. 
]

{ #category : #rendering }
MerlinMorphicPaneRenderer >> setName [

	self dialogWindow title: self wizardPane name
]

{ #category : #'buttons actions' }
MerlinMorphicPaneRenderer >> terminateButtonAction [
	"action executed when the terminate button is pressed"
	self terminateButtonActions do: [:aBlock | aBlock value].
	self wizardPane terminateButtonAction.
	self wizardRenderer performTerminateButtonAction.
]

{ #category : #'next button - actions' }
MerlinMorphicPaneRenderer >> terminateButtonActions [

	^ terminateButtonActions 
]

{ #category : #'next button - actions' }
MerlinMorphicPaneRenderer >> terminateButtonActions: aCollectionOfBlocks [

	terminateButtonActions := aCollectionOfBlocks 
]

{ #category : #'next button - actions' }
MerlinMorphicPaneRenderer >> whenNextIsPressedDo: aBlock [ 

	self nextButtonActions add: aBlock  
]

{ #category : #'next button - actions' }
MerlinMorphicPaneRenderer >> whenTerminateIsPressedDo: aBlock [ 

	self terminateButtonActions add: aBlock  
]

{ #category : #accessing }
MerlinMorphicPaneRenderer >> wizardPane [

	^ wizardPane
]

{ #category : #accessing }
MerlinMorphicPaneRenderer >> wizardPane: aWizardPane [

	wizardPane := aWizardPane
]

{ #category : #accessing }
MerlinMorphicPaneRenderer >> wizardRenderer [

	^ wizardRenderer 
]

{ #category : #accessing }
MerlinMorphicPaneRenderer >> wizardRenderer: aMerlinMorphicWizardRenderer [

	self dialogWindow: aMerlinMorphicWizardRenderer dialogWindow.
	wizardRenderer := aMerlinMorphicWizardRenderer 
]
