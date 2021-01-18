Class {
	#name : #PaneRow,
	#superclass : #PaneAbstractLine,
	#category : #'Merlin-PartsLayout'
}

{ #category : #'accessing - parts' }
PaneRow >> column: aBlockOrAPart [

	(aBlockOrAPart isKindOf: WizardPart)
		ifTrue: [
			subComponents add:  aBlockOrAPart.
			self pane setPart: aBlockOrAPart. 
			aBlockOrAPart paneLine: self.
			].
	(aBlockOrAPart isKindOf: BlockClosure)
		ifTrue: [
			|column|
			column := PaneColumn fromPane: self pane.
			aBlockOrAPart value: column.
			subComponents add: column. 
			"partGroups add: (aBlockOrAPart value: (PaneColumn fromPane: self pane))"
			]
]

{ #category : #'accessing - parts' }
PaneRow >> column: aWizardPart associatedTo: aSymbol [

	subComponents add:  aWizardPart.
	self pane setPart: aWizardPart associatedTo: aSymbol. 
	aWizardPart paneLine: self.
	
]

{ #category : #'accessing - parts' }
PaneRow >> column: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbols [

	subComponents add:  aWizardPart.
	self pane setPart: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbols. 
	aWizardPart paneLine: self.
	
]

{ #category : #accessing }
PaneRow >> columnAt: anInteger [

	^ self subComponentAt: anInteger
]

{ #category : #rendering }
PaneRow >> merlinRendering [

	^ self renderer merlinRowRenderingFor: self
]

{ #category : #accessing }
PaneRow >> removeColumnAt: anInteger [

	^ self removeSubComponentAt: anInteger
]

{ #category : #rendering }
PaneRow >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderRow: self
]

{ #category : #'accessing - morph contents' }
PaneRow >> specificMorphContents [
		
	^ self newRowWith: (self subComponents collect: [:aPaneLine | self newColumnWith: {aPaneLine morphContents}])
]
