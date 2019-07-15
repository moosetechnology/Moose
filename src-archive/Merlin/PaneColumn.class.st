Class {
	#name : #PaneColumn,
	#superclass : #PaneAbstractLine,
	#category : #'Merlin-PartsLayout'
}

{ #category : #'*Merlin-Rendering' }
PaneColumn >> merlinMorphWidget [

	^ nil
]

{ #category : #'*Merlin-Rendering' }
PaneColumn >> merlinRendering [

	^ self renderer merlinColumnRenderingFor: self
]

{ #category : #accessing }
PaneColumn >> removeRowAt: anInteger [

	^ self removeSubComponentAt: anInteger
]

{ #category : #'*Merlin-Rendering' }
PaneColumn >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderColumn: self
]

{ #category : #'accessing - parts' }
PaneColumn >> row: aBlockOrAPart [


	(aBlockOrAPart isKindOf: WizardPart)
		ifTrue: [
			subComponents add: aBlockOrAPart.
			self pane setPart: aBlockOrAPart.
			aBlockOrAPart paneLine: self 
			].
	(aBlockOrAPart isKindOf: BlockClosure)
		ifTrue: [
			|row|
			row := (PaneRow fromPane: self pane).
			"partGroups add: (aBlockOrAPart value: (PaneRow fromPane: self pane))"
			aBlockOrAPart value: row.
			subComponents add: row
			
			].

]

{ #category : #'accessing - parts' }
PaneColumn >> row: aWizardPart associatedTo: aSymbol [

	subComponents add: aWizardPart.
	self pane setPart: aWizardPart associatedTo: aSymbol. 
	aWizardPart paneLine: self.
	
]

{ #category : #'accessing - parts' }
PaneColumn >> row: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbol [

	subComponents add: aWizardPart.
	self pane setPart: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbol. 
	aWizardPart paneLine: self
	
]

{ #category : #accessing }
PaneColumn >> rowAt: anInteger [

	^ self subComponentAt: anInteger
]

{ #category : #'accessing - morph contents' }
PaneColumn >> specificMorphContents [

	^ self newColumnWith: (self subComponents collect: [:aPaneLine | self newRowWith: {aPaneLine morphContents}])
		
]
