Class {
	#name : #MerlinRenderer,
	#superclass : #Object,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinRenderer >> doOpen: aUI [

	^ self subclassResponsability 
]

{ #category : #rendering }
MerlinRenderer >> open: aWizardControl [

	^ self doOpen: (self render: aWizardControl)
]

{ #category : #rendering }
MerlinRenderer >> render: aWizardControl [

	"Each concrete renderer should now how to display a WizardControl instance. "
	^ self subclassResponsability
]
