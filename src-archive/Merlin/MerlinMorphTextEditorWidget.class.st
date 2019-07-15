Class {
	#name : #MerlinMorphTextEditorWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'textEditor'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - wizard management' }
MerlinMorphTextEditorWidget >> populateWizardPartOutput [ 

	self wizardPart outputValue: ((ObjectStringConverter forClass: String) stringAsObject: textEditor textMorph asText asString  )..
	
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextEditorWidget >> setMorphContents [

	self wizardPart textEditorContents ifNotNil: [
		
		]
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextEditorWidget >> setMorphSize [
	self wizardPart horizontalSize
		ifNotNil: [ 
			self textEditor
				hResizing: #rigid;
				width: self wizardPart horizontalSize ].
	self wizardPart verticalSize
		ifNotNil: [ 
			self textEditor
				vResizing: #rigid;
				height: self wizardPart verticalSize ]
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextEditorWidget >> specificMorphContents [
	
	self setMorphSize.
	self setMorphContents.
	^ self textEditor
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextEditorWidget >> textEditor [

	^ textEditor ifNil: [
		textEditor := (self newTextEditorFor: self wizardPart getText: #textEditorContents setText: #textEditorContents:)
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself
		]
]
