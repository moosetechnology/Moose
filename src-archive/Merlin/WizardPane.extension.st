Extension { #name : #WizardPane }

{ #category : #'*merlin-rendering' }
WizardPane >> merlinSpecificRenderer [

	^ self subclassResponsability
]

{ #category : #'*merlin-rendering' }
WizardPane >> renderOnMerlinRenderer: aMerlinRenderer [

	self renderer: self merlinSpecificRenderer.
	^ self renderer wizardRenderer: aMerlinRenderer; render: self.

	
]

{ #category : #'*merlin-rendering' }
WizardPane >> renderer [

	^ renderer ifNil: [renderer := self wizardControl renderer]
]

{ #category : #'*merlin-rendering' }
WizardPane >> renderer: aMerlinRenderer [

	renderer := aMerlinRenderer
]

{ #category : #'*Merlin-Tests' }
WizardPane >> testOpen [
	"open this pane. To do that, we make sure that all the WizardParts retrieve the inputs they require and then, we display their morph contents"
	
	
	self distributeRequiredInputs.
	"now we populate the morph contents of each wizard part. To do that, we work on a copy of wizardPart. Indeed, populate the morph content pf a part can lauch a callback, which can add some parts to this pane. To avoid loosing informations (by iterating an a growing collection), we first iterate on a copy, and then do the job for the remaining parts "
	wizardParts copy do: [ :each | 
		self distributeRequiredInputsOf: each.
		each retrieveInputRequired.
		self populateContentsOf: each.
		"self retrieveOutputOf: each"
		 ].
	self populatePartsRemaining. 
	"self  buildDialogWindow."
	"self displayButtons.
	self checkForEnablingNextButton.
	wizardControl dialogWindowName: name."
	isOpen := true.
"	self builder openModal: self dialogWindow."
	
	

	
]
