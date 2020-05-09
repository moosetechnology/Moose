Class {
	#name : #MerlinMorphPartWidget,
	#superclass : #MerlinMorphWidget,
	#instVars : [
		'wizardPart',
		'defaultValue'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #accessing }
MerlinMorphPartWidget >> defaultValue [

	^ defaultValue
]

{ #category : #accessing }
MerlinMorphPartWidget >> defaultValue: anObject [

	defaultValue := anObject
]

{ #category : #'accessing - morph contents' }
MerlinMorphPartWidget >> morphContents [
	self defaultValue: (self wizardPart defaultValue meValue: self wizardPart requiredInputs).
	^ self wizardPart groupBoxName
		ifNotNil: [ :aString | self newGroupBoxNamed: aString with: self specificMorphContents ]
		ifNil: [ self specificMorphContents ]
]

{ #category : #'accessing - wizard management' }
MerlinMorphPartWidget >> populateWizardPartOutput [

	"a subclass could implement this method to set the value entered by the user to the corresponding wizardPart output. It can be usefull if a wizard does not totally contain the model of the morph displayed. In this case, the wizard part should be updated at least each time we jump to a new window"
  
]

{ #category : #'accessing - morph contents' }
MerlinMorphPartWidget >> specificMorphContents [ 

	"each subclass should implement this method to return its morph contents. This is the hook used by the abstract class to generically iniatilzed some shared parameters"
	^ self subclassResponsability 
]

{ #category : #accessing }
MerlinMorphPartWidget >> wizardPart [ 					
				
	^ wizardPart
]

{ #category : #accessing }
MerlinMorphPartWidget >> wizardPart: aWizardPart [ 					
	
	"We want to keep a hook to act when the next button (or the terminate button) of a pane is pressed. Looks a bit hacky but usefull. By default we just execute the 'populateWizardPartOutput' method, but you can reuse this hook in any other place of this MerlinMorphPartWidget"			
	aWizardPart wizardPane renderer whenNextIsPressedDo: [self populateWizardPartOutput].  
	aWizardPart wizardPane renderer whenTerminateIsPressedDo: [self populateWizardPartOutput]. 
	wizardPart := aWizardPart 
]
