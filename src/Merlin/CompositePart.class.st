Class {
	#name : #CompositePart,
	#superclass : #WizardPart,
	#instVars : [
		'titlesAndParts',
		'selectedPageIndex'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'accessing - titlesAndParts' }
CompositePart >> addPart: aWizardPart [

	titlesAndParts add: (aWizardPart asString -> aWizardPart ). 
]

{ #category : #'accessing - titlesAndParts' }
CompositePart >> addTitleAndPart: anAssociation [

	titlesAndParts add: anAssociation. 
]

{ #category : #accessing }
CompositePart >> latePopulateContents [


	self titlesAndParts do: [:anAssoc | 
		anAssoc value wizardPane: self wizardPane.
		anAssoc value latePopulateContents].
]

{ #category : #rendering }
CompositePart >> merlinRendering [

	^ self renderer merlinMultiPartsRenderingFor: self
]

{ #category : #'accessing - wizard management' }
CompositePart >> outputValue [

	^ self selectedPart  value transformedOutputValue  
]

{ #category : #'accessing - page selection' }
CompositePart >> selectedPageIndex [

	^ selectedPageIndex ifNil: [selectedPageIndex := 1]
]

{ #category : #'accessing - page selection' }
CompositePart >> selectedPageIndex: anIndex [

	selectedPageIndex := anIndex.
]

{ #category : #'accessing - page selection' }
CompositePart >> selectedPart [

	^ self titlesAndParts at: self selectedPageIndex
]

{ #category : #'accessing - titlesAndParts' }
CompositePart >> titlesAndParts [

	^ titlesAndParts  
]

{ #category : #'accessing - titlesAndParts' }
CompositePart >> withParts: aCollectionOfWizardParts [

	titlesAndParts := aCollectionOfWizardParts collect: [:aWizardPart | (aWizardPart asString -> aWizardPart) ]. 
]

{ #category : #'accessing - titlesAndParts' }
CompositePart >> withTitlesAndParts: aCollectionOfAssociations [

	titlesAndParts := aCollectionOfAssociations. 
]

{ #category : #'accessing - titlesAndParts' }
CompositePart >> wizardParts [

	^ self titlesAndParts collect: [:each | each value]
]

{ #category : #'accessing - titlesAndParts' }
CompositePart >> wizardParts: aCollectionOfWizardParts [

	titlesAndParts := aCollectionOfWizardParts collect: [:aWizardPart | (aWizardPart asString -> aWizardPart) ]. 
]
