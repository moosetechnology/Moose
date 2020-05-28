Class {
	#name : #PaneAbstractLine,
	#superclass : #Object,
	#instVars : [
		'parts',
		'pane',
		'subComponents',
		'groupBoxName'
	],
	#category : #'Merlin-PartsLayout'
}

{ #category : #'instance creation' }
PaneAbstractLine class >> fromPane: aWizardPane [

	^ super new pane: aWizardPane
]

{ #category : #customizing }
PaneAbstractLine >> groupBoxName [ 

	^ groupBoxName 
]

{ #category : #customizing }
PaneAbstractLine >> inGroupboxNamed: aString [

	"to display all elements of this PaneLine in a same groubBox named aString"
	groupBoxName := aString.
]

{ #category : #initialization }
PaneAbstractLine >> initialize [
	super initialize.

	subComponents := OrderedCollection new
]

{ #category : #'accessing - morph contents' }
PaneAbstractLine >> morphContents [
	^ self groupBoxName
		ifNil: [ self specificMorphContents ]
		ifNotNil: [ :name | self newGroupboxNamed: name With: self specificMorphContents ]
]

{ #category : #'morph tools' }
PaneAbstractLine >> newColumnWith: aCollectionOfMorphElements [
	"use this method to create a new column in your block"
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	
	|answer|
	answer := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{ #category : #'morph tools' }
PaneAbstractLine >> newGroupboxNamed: aString [ 
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	"Answer a groupbox with the given label."
	^ GroupboxMorph new
		cornerStyle: #rounded;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		label: aString;
		yourself
		

]

{ #category : #'morph tools' }
PaneAbstractLine >> newGroupboxNamed: aString With: aMorph [ 
	"Answer a groupbox with the given label and control."
	^ (self newGroupboxNamed: aString)
		addContentMorph: aMorph;
		yourself
]

{ #category : #'morph tools' }
PaneAbstractLine >> newRowWith: aCollectionOfMorphElements [
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	"use this method to create a new row in your block"
	
	|answer|
	answer := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{ #category : #accessing }
PaneAbstractLine >> numberOfSubComponents [

	^ self subComponents size
]

{ #category : #accessing }
PaneAbstractLine >> pane [

	^ pane  
]

{ #category : #accessing }
PaneAbstractLine >> pane: aWizardPane [

	pane := aWizardPane 
]

{ #category : #accessing }
PaneAbstractLine >> removeSubComponentAt: anInteger [
	"remove the subComponent of this this 'AbstractLine' located at the position an integer "
	"when we want to remove a complete row or column, we have to also un-associat the removed wizardParts with their information"
	| componentToRemove |
	componentToRemove := subComponents at: anInteger ifAbsent: [^ nil].
	componentToRemove unassociatePartsFromTheirPanes. 
	subComponents remove: componentToRemove. 
]

{ #category : #accessing }
PaneAbstractLine >> removeWithouUnassociateSubComponentAt: anInteger [
	"remove the subComponent of this this 'AbstractLine' located at the position an integer "
	"using this method, the sucomponent will only be remove from the Morphic pane, in other words it will just become non visible, but will still be associated and registred in the wizard pane"
	| componentToRemove |
	componentToRemove := subComponents at: anInteger ifAbsent: [^ nil].
	subComponents remove: componentToRemove. 
]

{ #category : #accessing }
PaneAbstractLine >> renderer [

	^ self pane renderer
]

{ #category : #'accessing - morph contents' }
PaneAbstractLine >> specificMorphContents [

	"Each subclass has to return here a specific morphContents to return. (A row will have to dispatch its subComponents one beside the other, a Column: one under the other) "
	
	^ self subclassResponsibility 
]

{ #category : #accessing }
PaneAbstractLine >> subComponentAt: anInteger [
	"return the subComponent of this this 'AbstractLine' located at the position an integer "
	^ subComponents at: anInteger 
]

{ #category : #accessing }
PaneAbstractLine >> subComponents [
	"return the subComponents of this this 'AbstractLine'. For a row, it will be a collection of PaneColumns composing this row. For a column. it will be a collection of PaneRows composing this row "
	^ subComponents
]

{ #category : #accessing }
PaneAbstractLine >> unassociatePartsFromTheirPanes [

	"when we want to remove a complete row or column, we have to also un-associat the removed wizardParts with their information"
	self subComponents do: [:aPartOrAPaneLine |
		aPartOrAPaneLine unassociatePartsFromTheirPanes. 
		]
]
