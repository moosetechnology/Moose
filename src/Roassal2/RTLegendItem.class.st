Class {
	#name : #RTLegendItem,
	#superclass : #RTObject,
	#instVars : [
		'textSize'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #hooks }
RTLegendItem >> execute [
	self subclassResponsibility
]

{ #category : #initialization }
RTLegendItem >> initialize [
	super initialize.
	self textSize: TRLabelShape defaultFontSize.
]

{ #category : #utility }
RTLegendItem >> newLabelShape: widthDescription [
	"Return a new label with the argument as the content of the label"
	^ RTLabel new color: self textColor; text: widthDescription; height: textSize; yourself
]

{ #category : #utility }
RTLegendItem >> textColor [
	^ Color lightGray
]

{ #category : #accessing }
RTLegendItem >> textSize [
	^ textSize
]

{ #category : #accessing }
RTLegendItem >> textSize: anObject [
	textSize := anObject
]
