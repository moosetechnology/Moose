Class {
	#name : #RTPolymorphicBoxLegendItem,
	#superclass : #RTLegendItem,
	#instVars : [
		'widthDescription',
		'heightDescription',
		'boxDescription'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #accessing }
RTPolymorphicBoxLegendItem >> boxDescription [
	^ boxDescription
]

{ #category : #accessing }
RTPolymorphicBoxLegendItem >> boxDescription: aString [
	boxDescription := aString
]

{ #category : #hooks }
RTPolymorphicBoxLegendItem >> execute [
	| g ext1 ext2 box e lineExtremityShape lineShape topLine leftLine widthDescriptionElement heightDescriptionElement boxDescriptionLabel |
	g := RTGroup new.
	
	"Defining extremities and line shape"
	lineExtremityShape := RTBox new size: 1.
	lineShape := RTDoubleArrowedLine new color: Color red.
	
	"Label for the descriptions"
	widthDescriptionElement := (self newLabelShape: widthDescription) element.
	heightDescriptionElement := (self newLabelShape: heightDescription) element.
	g add: widthDescriptionElement.
	g add: heightDescriptionElement.
	
	"The box"
	box := (RTBox new extent: 30 @ 50) element.
	g add: box.
	e := box encompassingRectangle.
	
	"The top line"
	ext1 := lineExtremityShape element.
	ext2 := lineExtremityShape element.
	topLine := lineShape edgeFrom: ext1 to: ext2.
	ext1 translateBy: e topLeft - (0 @ 10).
	ext2 translateBy: e topRight - (0 @ 10).
	g
		add: ext1;
		add: ext2.
	g add: topLine.
	
	"The width label"
	boxDescriptionLabel := (self newLabelShape: boxDescription) element.
	g add: boxDescriptionLabel.
	RTConstraint move: boxDescriptionLabel onTheRightOf: box.
	
	TRConstraint move: widthDescriptionElement between: ext1 and: ext2.
	widthDescriptionElement translateBy: 0 @ (widthDescriptionElement extent y / -2 - 3).
	ext1 := lineExtremityShape element.
	ext2 := lineExtremityShape element.
	leftLine := lineShape edgeFrom: ext1 to: ext2.
	ext1 translateBy: e topLeft - (10 @ 0).
	ext2 translateBy: e bottomLeft - (10 @ 0).
	g
		add: ext1;
		add: ext2.
	g add: leftLine.
	TRConstraint move: heightDescriptionElement between: ext1 and: ext2.
	heightDescriptionElement translateBy: (heightDescriptionElement extent x / -2) @ 0.
	^ g
]

{ #category : #accessing }
RTPolymorphicBoxLegendItem >> heightDescription [
	^ heightDescription
]

{ #category : #accessing }
RTPolymorphicBoxLegendItem >> heightDescription: aString [
	heightDescription := aString
]

{ #category : #accessing }
RTPolymorphicBoxLegendItem >> widthDescription [
	^ widthDescription
]

{ #category : #accessing }
RTPolymorphicBoxLegendItem >> widthDescription: aString [
	widthDescription := aString
]
