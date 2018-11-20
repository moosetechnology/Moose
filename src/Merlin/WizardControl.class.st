"
A WizardControl is the object controling the differents panes (WizardPane) that will be displayed in a Wizard. It make all the transition between those panes when button like 'next' or 'previous' are pressed. Those transitions are composed by opening and closing the panes but also by managing their inputs and outputs. Values of those outputs (representing the information you want to retrieve at the end of the wizard operation) are all stored in the WizardControl.

Instance Variables
	builder:		<StandardWindow>
	currentPane:		<Integer>
	dialogWindow:		<PluggableDialogWindow>
	
	wizardInformations:		<Dictionary>
	wizardPanes:		<OrderedCollection>

builder
	- the main window (common to all panes) in which we plugg a dialogWindow

currentPane
	- an index pointing on the current displayed pane.

dialogWindow
	- in which panes will position their elements (WizardPart). The dialog window is also common to all panes so that the wizard panes windows stay at the same position. (Create a new dialog window for each pane open a window at different positions each times)



wizardInformations
	- A dictionary to memorize output from the different panes. The keys of this dictionary are define when you create a WizardPart (object that composed a WizardPane).

wizardPanes
	- the different panes that composed a wizard. Those panes will be displayed in the order specify by this OrderedCollection. 

"
Class {
	#name : #WizardControl,
	#superclass : #Object,
	#instVars : [
		'currentPane',
		'wizardPanes',
		'wizardInformations',
		'branches',
		'finalActionBlock',
		'renderer'
	],
	#category : #'Merlin-Core'
}

{ #category : #'addition / removal' }
WizardControl >> addBranch [

	self branches add: OrderedCollection new
]

{ #category : #'addition / removal' }
WizardControl >> addPane: aWizardPane [  
	"add the WizardPane aWizardPane at the end of the panes list of this wizard control. Therefore, this pane will be the last one to be displayed"
	
	aWizardPane wizardControl: self.
	wizardPanes add: aWizardPane.
	^ aWizardPane 

]

{ #category : #accessing }
WizardControl >> atEndDo: aBlock [

	"this is the way to programatically set an action to execute at the end of the wizard panes transitions. aBlock has to be a 'one-argument' block, refering to the wizardInformations dictionary (linking each output of the wizard to its key)."
	finalActionBlock := aBlock.
]

{ #category : #accessing }
WizardControl >> branches [ 

	^ branches 
]

{ #category : #accessing }
WizardControl >> currentPane [ 

	^ self wizardPanes at: currentPane.
]

{ #category : #accessing }
WizardControl >> currentPaneIndex [

	^ currentPane 
]

{ #category : #accessing }
WizardControl >> finalActionBlock [ 

	^ finalActionBlock
]

{ #category : #testing }
WizardControl >> hasFinished [

	^ self currentPaneIndex > self size
]

{ #category : #accessing }
WizardControl >> information: aSymbol withValue: value [ 
	"set the value of the information designed by aSymbol. It is used by a pane when a next button or a terminate button is clicked to spread its output information"
	
	wizardInformations 
		at: aSymbol
		put: value
]

{ #category : #'initialize-release' }
WizardControl >> initialize [
	
	super initialize.
	wizardInformations := Dictionary new.
	branches := OrderedCollection new add: OrderedCollection new; yourself.
	wizardPanes := branches at: 1.
	currentPane :=1.



]

{ #category : #open }
WizardControl >> open [
	"launch the wizard system by opening the first wizard pane."
	
	wizardPanes isEmpty ifTrue: [ ^ self ].
	currentPane := 1.
	(wizardPanes at: currentPane) doOpen.
	self renderer open: self.
]

{ #category : #obsolete }
WizardControl >> openFirstWizardPane [
	"launch the wizard system by opening the first wizard pane."
	self deprecated: 'Use open instead'.
	self open.
]

{ #category : #'wizard panes transition' }
WizardControl >> performNextButtonAction [
	"this method is run when a next button is pressed"
	
	|tmpCurrentPane tmpProblems|
	tmpCurrentPane := wizardPanes at: currentPane.
	tmpProblems := OrderedCollection new.
	tmpCurrentPane conditions keysAndValuesDo:  [:aString :aBlock |
		(aBlock value: self wizardInformations) ifFalse: [
			tmpProblems add: aString
			]
		]. 
	tmpProblems isEmpty 
		ifTrue: [
			tmpCurrentPane failingConditions: #().
			(wizardPanes at: currentPane) doClose.
			currentPane := currentPane  + 1.
			(wizardPanes at: currentPane ) doOpen. 
		]
		ifFalse: [
			tmpCurrentPane failingConditions: tmpProblems 
			].
	
]

{ #category : #'wizard panes transition' }
WizardControl >> performPreviousButtonAction [
	"this method is run when a previous button is pressed"
	
	(wizardPanes at: currentPane) doClose.
	currentPane := currentPane  - 1.
	(wizardPanes at: currentPane ) doOpen. 
]

{ #category : #'wizard panes transition' }
WizardControl >> performTerminateButtonAction [
	"by default, just close the last current pane. Override this method if you want to create a subclass of WizardControl making a specific action"
	|tmpCurrentPane tmpProblems|
	tmpCurrentPane := wizardPanes at: currentPane.
	tmpProblems := OrderedCollection new.
	tmpCurrentPane conditions keysAndValuesDo:  [:aString :aBlock |
		(aBlock value: self wizardInformations) ifFalse: [
			tmpProblems add: aString
			]
		]. 
	tmpProblems isEmpty 
		ifTrue: [
			(wizardPanes at: currentPane) doClose.
			currentPane := currentPane + 1.
			self finalActionBlock ifNotNil: [
				self finalActionBlock value: self wizardInformations
			].
		]
		ifFalse: [
			tmpCurrentPane failingConditions: tmpProblems 
			].
	
		
]

{ #category : #'addition / removal' }
WizardControl >> removePaneAt: anIndex [

	|tmpPane|
	self wizardPanes size < anIndex ifTrue: [
		^ Error signal: 'Trying to remove a non-existant pane'
		].
	tmpPane := self wizardPanes at: anIndex.
	^ self wizardPanes remove: tmpPane.
	
	
]

{ #category : #accessing }
WizardControl >> renderer [

	^ renderer ifNil: [^ renderer := MerlinMorphicWizardRenderer new].
]

{ #category : #accessing }
WizardControl >> renderer: aMerlinRenderer [

	renderer := aMerlinRenderer
]

{ #category : #'addition / removal' }
WizardControl >> selectBranch: anInteger [

	self wizardPanes: (self branches at: anInteger )
]

{ #category : #accessing }
WizardControl >> selectedBranch [

	^ self branches indexOf: self wizardPanes.
]

{ #category : #accessing }
WizardControl >> size [

	^ self wizardPanes size
]

{ #category : #open }
WizardControl >> start [
	"launch the wizard system but does not open any UI window"
	
	wizardPanes isEmpty ifTrue: [ ^ self ].
	currentPane := 1.
	(wizardPanes at: currentPane) doOpen.
]

{ #category : #accessing }
WizardControl >> valueOfInformation: aSymbol [
	"return the value of the output information named aSymbol"
	          
	^ wizardInformations at: aSymbol.
]

{ #category : #accessing }
WizardControl >> wizardInformations [ 
	<lint: 'Methods implemented but not sent' rationale: 'method provided  to the user of the library' author: 'cyrille.delaunay'>
	"return a Dictionary containing the ids of the informations retrieved by the wizard and their values"
	
	^ wizardInformations 
]

{ #category : #accessing }
WizardControl >> wizardPanes [

	^ wizardPanes
]

{ #category : #accessing }
WizardControl >> wizardPanes: anOrderedCollection [
	<lint: 'Methods implemented but not sent' rationale: 'method provided  to the user of the library' author: 'cyrille.delaunay'>
	"set all the wizard panes controled by this wizard control. Those panes will be display in the same order than the one of anOrderedCollection"
	^wizardPanes := anOrderedCollection
]
