"
This class represent a tabSelectorMorph 'linked' to a ListOrTextFielfPart: when the selected page change, it also update the selected page of the listOrTextFieldPart 

"
Class {
	#name : #LinkedTabSelectorMorph,
	#superclass : #TabSelectorMorph,
	#instVars : [
		'listOrTextFieldPart',
		'firstSideLink',
		'secondSideLink'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
LinkedTabSelectorMorph >> basicSelectedIndex: index [

	"Set the value of selectedIndex"
	selectedIndex == index ifTrue: [^self].
	selectedIndex := index.
	self adoptPaneColor: self paneColor.
	self changed: #selectedIndex
]

{ #category : #accessing }
LinkedTabSelectorMorph >> linkedTo: aListOrTextFieldPart [

	firstSideLink := aListOrTextFieldPart.
]

{ #category : #accessing }
LinkedTabSelectorMorph >> secondSideLink: aDropListOrTextfieldPart [

	secondSideLink := aDropListOrTextfieldPart 
]

{ #category : #accessing }
LinkedTabSelectorMorph >> selectedIndex: index [

	"Set the value of selectedIndex"
	firstSideLink ifNotNil: [firstSideLink  basicSelectedPageIndex: index].
	secondSideLink ifNotNil: [secondSideLink basicSelectedPageIndex: index] .
	selectedIndex == index ifTrue: [^self].
	selectedIndex := index.
	self adoptPaneColor: self paneColor.
	self changed: #selectedIndex
]
