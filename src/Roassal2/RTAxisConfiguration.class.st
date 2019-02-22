"
A RTAxisConfiguration describes an axis configuration
"
Class {
	#name : #RTAxisConfiguration,
	#superclass : #RTObject,
	#instVars : [
		'numberOfTicks',
		'numberOfLabels',
		'labelConvertion',
		'positionLabel',
		'minValue',
		'maxValue',
		'thousandsSeparator',
		'title',
		'builder',
		'color',
		'titlePosition',
		'labelRotation',
		'lineThickness',
		'fromPoint',
		'toPoint',
		'maxValueManuallySet',
		'minValueManuallySet',
		'ticksCentered',
		'labelFontHeight',
		'scaleTransformation'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #accessing }
RTAxisConfiguration >> adjustNumberOfTicksAndLabelsIfNecessaryPriorityOnLabels [
	"This methods is called after each change of the number of ticks or labels. 
	The rule is that an axis config cannot have more than labels than ticks"
	"Cannot have more labels than ticks"
	"The number of labels remains fixed"
	
	self numberOfTicks < self numberOfLabels
		ifTrue: [ self numberOfTicks: self numberOfLabels ]

]

{ #category : #accessing }
RTAxisConfiguration >> adjustNumberOfTicksAndLabelsIfNecessaryPriorityOnTicks [
	"This methods is called after each change of the number of ticks or labels. 
	The rule is that an axis config cannot have more than labels than ticks"
	"Cannot have more labels than ticks"
	"The number of ticks remains fixed"
		
	self numberOfTicks < self numberOfLabels
		ifTrue: [ self numberOfLabels: self numberOfTicks ]

]

{ #category : #testing }
RTAxisConfiguration >> areLabelRotated [
	"Return true if labels are rotated"
	^ labelRotation ~= 0
]

{ #category : #rendering }
RTAxisConfiguration >> axisFrom: fromPosition to: toPosition [ 
	| renderer |
	renderer := RTAxisRenderer new.
	renderer builder: self builder.
	renderer config: self.
	renderer axisFrom: fromPosition to: toPosition width: lineThickness
]

{ #category : #accessing }
RTAxisConfiguration >> builder [
	^ builder
]

{ #category : #accessing }
RTAxisConfiguration >> builder: anObject [
	builder := anObject
]

{ #category : #accessing }
RTAxisConfiguration >> color [
	"Return the color of the axis"
	^ color
]

{ #category : #accessing }
RTAxisConfiguration >> color: aColor [
	"Set the color of the axis"
	color := aColor
]

{ #category : #configuration }
RTAxisConfiguration >> decimal: anInteger [
	"Set the number of decimals"
	self labelConversion: [ :number | number asFloat round: anInteger ]
]

{ #category : #configuration }
RTAxisConfiguration >> decimalIfNecessary [
	self labelConversion: [ :number | number asInteger = number
		ifTrue: [ number asInteger ]
		ifFalse: [ number asFloat ] ]
]

{ #category : #configuration }
RTAxisConfiguration >> defaultColor [
	^ Color gray
]

{ #category : #configuration }
RTAxisConfiguration >> defaultTitlePosition [
	^ 0 @ 20
]

{ #category : #configuration }
RTAxisConfiguration >> doNotRotateLabels [
	labelRotation := 0
]

{ #category : #accessing }
RTAxisConfiguration >> fromPoint [
	^ fromPoint
]

{ #category : #accessing }
RTAxisConfiguration >> fromPoint: aPoint [
	fromPoint := aPoint
]

{ #category : #action }
RTAxisConfiguration >> getStringFromNumber: aNumber [
	^ (self labelConversion rtValue: aNumber) asString
]

{ #category : #testing }
RTAxisConfiguration >> hasMaxValueBeenManuallySet [
	^ maxValueManuallySet 
]

{ #category : #testing }
RTAxisConfiguration >> hasMinValueBeenManuallySet [
	^ minValueManuallySet 
]

{ #category : #initialization }
RTAxisConfiguration >> initialize [
	super initialize.
	labelConvertion := [ :number | (number asFloat round: 2) asString ].
	positionLabel := [ :aLabel :aTick | aLabel translateTo: aTick position ].
	self smallFontSize.
	numberOfTicks := 4.
	numberOfLabels := numberOfTicks.
	lineThickness := 1.
	minValue := 0.
	maxValue := 0.
	maxValueManuallySet := false.
	minValueManuallySet := false.
	self twoDecimals.
	self noThousandsSeparator.
	self noTitle.
	color := self defaultColor.
	titlePosition := self defaultTitlePosition.
	self doNotRotateLabels.
	ticksCentered := false.
	scaleTransformation := #yourself
]

{ #category : #accessing }
RTAxisConfiguration >> labelConversion [
	^ labelConvertion
]

{ #category : #accessing }
RTAxisConfiguration >> labelConversion: aOneArgBlock [
	"The argument is a one arg block taking the numerical value and returning another numerical value or a string
	
#labelConversion: can be used to move the orgin of the graph. For example:
-=-=-=-=
graphCenter := 5 @ 10.
data := (-3.1415 to: 3.1415 by: 0.1) collect: [ :x |  x @ (x sin * 3 + 10) ]. 
b := RTGrapher new. 
ds := RTData new.
ds noDot; connectColor: Color blue. 
ds points: data. 
ds x: [ :p | p x - graphCenter x ]. 
ds y: [ :p | p y - graphCenter y ].
b add: ds. 
b axisX labelConversion: [ :v | (v + graphCenter x) asFloat round: 2 ].
b axisY labelConversion: [ :v | (v + graphCenter x) asFloat round: 2 ].
b.
-=-=-=-=


-=-=-=-=
	values := #(  5 6 10 10 20 22 23   5 6 10 10 20 22 23  5 6 10 10 20 22 23).
    lo := values min.
    hi := values max.
    ds := RTData new.
    ds points: values.
	ds y: [ :value | value - lo ].
    ds dotShape ellipse 
        color: (Color blue alpha: 0.3).
    ds connectColor: Color blue.
    b := RTGrapher new.
    b add: ds. 
    b axisX noLabel; numberOfTicks: (values size / 10).
    b axisY numberOfTicks: 5.
    b axisY labelConversion: [ :v | v + lo ].
    ^ b
-=-=-=-=
	"
	
	
	labelConvertion := aOneArgBlock
]

{ #category : #accessing }
RTAxisConfiguration >> labelFontHeight [
	^ labelFontHeight
]

{ #category : #accessing }
RTAxisConfiguration >> labelFontHeight: aFontSize [
	"Values between 6 and 20 are typically acceptable"
	labelFontHeight := aFontSize
]

{ #category : #accessing }
RTAxisConfiguration >> labelRotation [
	"Return the rotation of the label"
	^ labelRotation
]

{ #category : #configuration }
RTAxisConfiguration >> labelRotation: rotationAsDegrees [
	"Rotate the labels"
	labelRotation := rotationAsDegrees
]

{ #category : #accessing }
RTAxisConfiguration >> lineThickness [
	^ lineThickness
]

{ #category : #accessing }
RTAxisConfiguration >> lineThickness: lineThicknessInPixels [
	lineThickness := lineThicknessInPixels
]

{ #category : #accessing }
RTAxisConfiguration >> maxValue [
	^ maxValue
]

{ #category : #accessing }
RTAxisConfiguration >> maxValue: aMaxValue [
	"Do not use this to set the maximum. Instead, use RTGrapher>>maxX:, minX:, maxY:, minY:"
	maxValueManuallySet := true.
	self privateMaxValue: aMaxValue
]

{ #category : #accessing }
RTAxisConfiguration >> maxValueIfNotSet: aMinValue [
	self maxValue: (aMinValue max: maxValue)
]

{ #category : #accessing }
RTAxisConfiguration >> minValue [
	^ minValue
]

{ #category : #accessing }
RTAxisConfiguration >> minValue: aMinValue [
	"Do not use this to set the maximum. Instead, use RTGrapher>>maxX:, minX:, maxY:, minY:"
	minValueManuallySet := true.
	self privateMinValue: aMinValue
]

{ #category : #accessing }
RTAxisConfiguration >> minValueIfNotSet: aMinValue [
	self minValue: (aMinValue min: minValue)
]

{ #category : #configuration }
RTAxisConfiguration >> noDecimal [
	"Make the axis labels without decimal"
	self labelConversion: [ :number | number asInteger ]
]

{ #category : #configuration }
RTAxisConfiguration >> noLabel [
	self numberOfLabels: 0
]

{ #category : #configuration }
RTAxisConfiguration >> noThousandsSeparator [
	thousandsSeparator := false
]

{ #category : #configuration }
RTAxisConfiguration >> noTick [
	self numberOfTicks: 0
]

{ #category : #configuration }
RTAxisConfiguration >> noTitle [
	self title: ''
]

{ #category : #configuration }
RTAxisConfiguration >> normalFontSize [
	self labelFontHeight: 12
]

{ #category : #accessing }
RTAxisConfiguration >> numberOfLabels [
	^ numberOfLabels
]

{ #category : #accessing }
RTAxisConfiguration >> numberOfLabels: aValue [
	"Set the number of labels the axis should contains. In case that the number of ticks is less than the number of labels, then an adjustment is made"
	numberOfLabels := aValue.
	self adjustNumberOfTicksAndLabelsIfNecessaryPriorityOnLabels.

]

{ #category : #accessing }
RTAxisConfiguration >> numberOfTicks [
	^ numberOfTicks
]

{ #category : #accessing }
RTAxisConfiguration >> numberOfTicks: aValue [
	"Set the number of ticks the axis should contains. In case that the number of ticks is less than the number of labels, then an adjustment is made"
	numberOfTicks := aValue.
	self adjustNumberOfTicksAndLabelsIfNecessaryPriorityOnTicks
]

{ #category : #configuration }
RTAxisConfiguration >> oneDecimal [
	self decimal: 1
]

{ #category : #configuration }
RTAxisConfiguration >> plain [
	"Make the axis a plain line"
	self noLabel; noTick
]

{ #category : #accessing }
RTAxisConfiguration >> positionLabel [
	^ positionLabel
]

{ #category : #accessing }
RTAxisConfiguration >> positionLabel: aTwoArgBlock [
	"This method expect a two argblock to set where the label should be"
	"eg. [ :aLabel :aTick | aLabel translateTo: aTick position + (0 @ 15) ]"
	positionLabel := aTwoArgBlock
]

{ #category : #accessing }
RTAxisConfiguration >> privateMaxValue: aMaxValue [
	maxValue := aMaxValue
]

{ #category : #accessing }
RTAxisConfiguration >> privateMinValue: aMinValue [
	minValue := aMinValue
]

{ #category : #configuration }
RTAxisConfiguration >> rotateLabels [
	"Rotate the labels"
	labelRotation := -45
]

{ #category : #accessing }
RTAxisConfiguration >> scaleTransformation [
	^ scaleTransformation
]

{ #category : #accessing }
RTAxisConfiguration >> scaleTransformation: anObject [
	scaleTransformation := anObject
]

{ #category : #configuration }
RTAxisConfiguration >> smallFontSize [
	self labelFontHeight: 9
]

{ #category : #accessing }
RTAxisConfiguration >> step [
	"Return the step between each tick"
	
	^ (self maxValue - self minValue) / self numberOfTicks.
"	| s |
	s := (self maxValue - self minValue) / self numberOfTicks.
	((self minValue to: self maxValue by: s) includes: 0.0) ifTrue: [ ^ s ].
	
	numberOfTicks := numberOfTicks + 1.
	s := (self maxValue - self minValue) / self numberOfTicks.

	self maxValue: (self maxValue / s) asInteger * s. 
	s := (self maxValue - self minValue) / self numberOfTicks.
	^ s"
]

{ #category : #accessing }
RTAxisConfiguration >> tickIntervalForLabel [
	^ numberOfTicks / numberOfLabels
]

{ #category : #accessing }
RTAxisConfiguration >> tickLabelOffset: aPoint [
	"Specify the offset between the tick and its label"
	self positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position + aPoint ].
]

{ #category : #accessing }
RTAxisConfiguration >> ticksCentered [
	^ ticksCentered
]

{ #category : #accessing }
RTAxisConfiguration >> ticksCentered: aBoolean [
	ticksCentered := aBoolean.
]

{ #category : #accessing }
RTAxisConfiguration >> title [
	^ title
]

{ #category : #accessing }
RTAxisConfiguration >> title: aTitleAsString [
	title := aTitleAsString
]

{ #category : #accessing }
RTAxisConfiguration >> titlePosition [
	^ titlePosition
]

{ #category : #accessing }
RTAxisConfiguration >> titlePosition: aPoint [
	"Set the position of the title according to the toPosition when rendering the axis"
	"The argument is added to the toPosition"
	titlePosition := aPoint
]

{ #category : #accessing }
RTAxisConfiguration >> toPoint [
	^ toPoint
]

{ #category : #accessing }
RTAxisConfiguration >> toPoint: anObject [
	toPoint := anObject
]

{ #category : #configuration }
RTAxisConfiguration >> twoDecimals [
	self decimal: 2
]

{ #category : #configuration }
RTAxisConfiguration >> withThousandsSeparator [
	"Make the labels on the axis using comma separatation of thousands"
	self labelConversion: [ :number | number asInteger asStringWithCommas ] 
]
