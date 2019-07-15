Class {
	#name : #MerlinMorphTextFieldWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'textField'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - wizard management' }
MerlinMorphTextFieldWidget >> populateWizardPartOutput [ 

	self wizardPart textEntryContents: ((ObjectStringConverter forClass: String) stringAsObject: textField textMorph asText asString)  
	
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextFieldWidget >> setMorphSize [
	self wizardPart horizontalSize
		ifNotNil: [ 
			self textField
				hResizing: #rigid;
				width: self wizardPart horizontalSize ]
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextFieldWidget >> specificMorphContents [ 

	self setMorphSize.
	^ self newRowWith: {(self newLabel: self wizardPart prefix) disable; yourself . self textField . (self newLabel: self wizardPart suffix) disable; yourself }

	
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextFieldWidget >> textField [

	^ textField ifNil: [
		textField := self newTextEntryFor: self wizardPart getText: #textEntryContents setText: #textEntryContents:
		]
]
