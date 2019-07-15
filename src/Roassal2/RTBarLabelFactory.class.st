"
Useful to provide an object with a configuration when creating label for bars.

For example:

b := RTGrapher new.
d := RTData new.
d points: (Collection withAllSubclasses copyFrom: 1 to: 20).
d y: #numberOfMethods.
d barChartUsing: (RTBarLabelFactory new label: #name; fontSize: 7).
b add: d.
b axisX noLabel; noTick.
b
"
Class {
	#name : #RTBarLabelFactory,
	#superclass : #RTObject,
	#instVars : [
		'color',
		'label',
		'rotation',
		'fontSize',
		'labelShape'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #accessing }
RTBarLabelFactory >> color [
	^ color
]

{ #category : #accessing }
RTBarLabelFactory >> color: aBlockOrAValue [
	"Use to compute the color given to the label. A one-arg block may be provided. The block is then evaluated with the model of the element"
	color := aBlockOrAValue
]

{ #category : #computing }
RTBarLabelFactory >> createLabelForModel: anObject [
	"Take as argument the model object of the element. Return the label"

	| lbl |
	lbl := self labelShape elementOn: anObject.
	lbl rotateByDegrees: (rotation rtValue: anObject).
	^ lbl
]

{ #category : #accessing }
RTBarLabelFactory >> fontSize [
	^ fontSize
]

{ #category : #accessing }
RTBarLabelFactory >> fontSize: aBlockOrValue [
	"Use to compute the font size of the label. A one-arg block may be provided. The block is then evaluated with the model of the element"
	fontSize := aBlockOrValue
]

{ #category : #initialization }
RTBarLabelFactory >> initialize [
	super initialize.
	self color: Color gray.
	self fontSize: 12.
	self label: #yourself.
	self rotation: -30.
	 
]

{ #category : #accessing }
RTBarLabelFactory >> label [
	^ label
]

{ #category : #accessing }
RTBarLabelFactory >> label: aBlockOrValue [
	"Use to compute the label. A one-arg block may be provided. The block is then evaluated with the model of the element"
	label := aBlockOrValue
]

{ #category : #computing }
RTBarLabelFactory >> labelShape [
	labelShape ifNotNil: [ ^ labelShape ].
	labelShape := RTLabel new
		text: label;
		color: color;
		height: fontSize.
	^ labelShape
]

{ #category : #accessing }
RTBarLabelFactory >> rotation [
	^ rotation
]

{ #category : #accessing }
RTBarLabelFactory >> rotation: aValue [
	"Define the rotation angle in degrees of the label. A typical value is -30"
	rotation := aValue
]
