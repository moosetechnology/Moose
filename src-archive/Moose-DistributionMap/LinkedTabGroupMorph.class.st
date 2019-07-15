"
This class represent a tabGroupMorph 'linked' to a ListOrTextFielfPart: when the selected page change, it also update the selected page of the listOrTextFieldPart 

"
Class {
	#name : #LinkedTabGroupMorph,
	#superclass : #TabGroupMorph,
	#instVars : [
		'listOrTextFieldPart'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
LinkedTabGroupMorph >> basicSelectedPageIndex: index [

	^ tabSelectorMorph basicSelectedIndex: index.
]

{ #category : #initialization }
LinkedTabGroupMorph >> newTabSelectorMorph [
	"Answer a new tab selector morph"

	^ LinkedTabSelectorMorph  new
		vResizing: #shrinkWrap;
		hResizing: #spaceFill
]

{ #category : #accessing }
LinkedTabGroupMorph >> secondSideLink: aListOrTextFieldPart [

	tabSelectorMorph secondSideLink: aListOrTextFieldPart .
]
