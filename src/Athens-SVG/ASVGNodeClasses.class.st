Class {
	#name : #ASVGNodeClasses,
	#superclass : #Object,
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASVGNodeClasses class >> fromName: aNodeName [
	(self canUnderstand: aNodeName asSymbol) ifTrue: [ ^ self new perform: aNodeName asSymbol ]
	ifFalse: [ ^ ASMetadata ]
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> circle [
	^ ASCircle
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> defs [
	^ ASDefs
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> desc [
	^ ASMetadata
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> ellipse [
	^ ASEllipse 
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> filter [
	^ ASFilter
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> g [
	^ ASGroupElement
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> line [
	^ ASLine
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> linearGradient [
	^ ASLinearGradient
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> metadata [
	^ ASMetadata
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> path [
	^ ASPath 
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> polygon [
	^ ASPolygon
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> polyline [
	^ ASPolyLine 
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> radialGradient [
	^ ASRadialGradient
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> rect [
	^ ASRect
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> stop [
	
	^ ASGradientStop
]

{ #category : #'as yet unclassified' }
ASVGNodeClasses >> text [
	^ ASText
]
