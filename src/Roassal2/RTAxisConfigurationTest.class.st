Class {
	#name : #RTAxisConfigurationTest,
	#superclass : #RTTest,
	#instVars : [
		'config'
	],
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #running }
RTAxisConfigurationTest >> setUp [
	super setUp.
	config := RTAxisConfiguration new
]

{ #category : #tests }
RTAxisConfigurationTest >> testDecimalIfNecessary [
	config decimalIfNecessary.
	self assert: (config getStringFromNumber: 10) equals: '10'.
	self assert: (config getStringFromNumber: 3.22) equals: '3.22'
]

{ #category : #tests }
RTAxisConfigurationTest >> testDefault [
	self deny: config areLabelRotated
]

{ #category : #'min max' }
RTAxisConfigurationTest >> testHasBeenManuallySet [

	| axis |
	axis := RTAxisConfiguration new.
	self deny: axis hasMinValueBeenManuallySet.
	self deny: axis hasMaxValueBeenManuallySet.
]

{ #category : #'min max' }
RTAxisConfigurationTest >> testHasBeenManuallySet02 [

	| axis |
	axis := RTAxisConfiguration new.
	axis minValue: -5.
	self assert: axis hasMinValueBeenManuallySet.
	self deny: axis hasMaxValueBeenManuallySet.
]

{ #category : #'min max' }
RTAxisConfigurationTest >> testHasBeenManuallySet03 [

	| axis |
	axis := RTAxisConfiguration new.
	axis maxValue: -5.
	self deny: axis hasMinValueBeenManuallySet.
	self assert: axis hasMaxValueBeenManuallySet.
]

{ #category : #tests }
RTAxisConfigurationTest >> testLabelConversion [

	self assert: (config labelConversion rtValue: 1000) equals: 1000.0
]

{ #category : #tests }
RTAxisConfigurationTest >> testLabelRotation [
	self assert: config labelRotation equals: 0.
]

{ #category : #tests }
RTAxisConfigurationTest >> testLabelRotationBy45 [
	config labelRotation: -45.
	self assert: config labelRotation equals: -45
]

{ #category : #tests }
RTAxisConfigurationTest >> testMaxValue [
	config maxValue: 5.
	self assert: config maxValue equals: 5
]

{ #category : #tests }
RTAxisConfigurationTest >> testMaxValueIfNotSet [
	config maxValueIfNotSet: 5.
	self assert: config maxValue equals: 5
]

{ #category : #tests }
RTAxisConfigurationTest >> testMaxValueIfNotSet02 [
	config maxValueIfNotSet: 5.
	config maxValueIfNotSet: 10.
	config maxValueIfNotSet: 2.
	self assert: config maxValue equals: 10
]

{ #category : #tests }
RTAxisConfigurationTest >> testMaxValueInScript01 [

	| b ds axeConfig |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(1 2 3).
	ds x: #yourself.
	ds y: #yourself.
	b add: ds.
	axeConfig := b axisX.
	b build.
	

	self assert: axeConfig maxValue equals: 3
]

{ #category : #tests }
RTAxisConfigurationTest >> testMinValue [
	config minValue: 5.
	self assert: config minValue equals: 5
]

{ #category : #tests }
RTAxisConfigurationTest >> testMinValueIfNotSet [
	config minValueIfNotSet: -5.
	config minValueIfNotSet: -2.
	self assert: config minValue equals: -5
]

{ #category : #tests }
RTAxisConfigurationTest >> testMinValueIfNotSet02 [
	config minValueIfNotSet: -5.
	config minValueIfNotSet: -10.
	config minValueIfNotSet: -1.
	self assert: config minValue equals: -10
]

{ #category : #tests }
RTAxisConfigurationTest >> testNoRotation [
	config rotateLabels.
	config doNotRotateLabels.
	self deny: config areLabelRotated 
]

{ #category : #tests }
RTAxisConfigurationTest >> testNumberOfTicksAndLabel [

	self assert: config numberOfTicks equals: 4.
	self assert: config numberOfLabels equals: 4.
	
	config numberOfLabels: 5.
	self assert: config numberOfTicks equals: 5.
	self assert: config numberOfLabels equals: 5.

]

{ #category : #tests }
RTAxisConfigurationTest >> testNumberOfTicksAndLabels02 [

	self assert: config numberOfTicks equals: 4.
	self assert: config numberOfLabels equals: 4.
]

{ #category : #tests }
RTAxisConfigurationTest >> testNumberOfTicksAndLabels02Default [

	self assert: config numberOfTicks equals: 4.
	self assert: config numberOfLabels equals: 4.
]

{ #category : #tests }
RTAxisConfigurationTest >> testNumberOfTicksAndLabels03 [

	self assert: config numberOfLabels equals: 4.
	
	config numberOfTicks: 3.
	"Cannot have more labels than ticks"
	self assert: config numberOfLabels equals: 3.
	
]

{ #category : #tests }
RTAxisConfigurationTest >> testNumberOfTicksAndLabels04 [
	
	config numberOfTicks: 3.
	self assert: config numberOfLabels equals: 3.
	
	config numberOfLabels: 2.
	self assert: config numberOfTicks equals: 3.
	self assert: config numberOfLabels equals: 2.
	
	config numberOfLabels: 5.
	self assert: config numberOfTicks equals: 5.
	self assert: config numberOfLabels equals: 5.
]

{ #category : #tests }
RTAxisConfigurationTest >> testPlain [

	config plain.
	self assert: config numberOfTicks equals: 0.
	self assert: config numberOfLabels equals: 0.
]

{ #category : #tests }
RTAxisConfigurationTest >> testRotation [
	config rotateLabels.
	self assert: config areLabelRotated 
]

{ #category : #tests }
RTAxisConfigurationTest >> testcolor [
	self assert: config color equals: Color gray
]

{ #category : #tests }
RTAxisConfigurationTest >> testnoDecimal [
	config noDecimal.
	self assert: (config getStringFromNumber: 1000) equals: '1000'.
	self assert: (config getStringFromNumber: 1000000) equals: '1000000'
]

{ #category : #tests }
RTAxisConfigurationTest >> testoneDecimal [
	config oneDecimal.
	self assert: (config labelConversion rtValue: 1000) equals: 1000.0.
	self assert: (config labelConversion rtValue: 1000000) equals: 1000000.0.
]

{ #category : #tests }
RTAxisConfigurationTest >> testtitlePosition [
	self assert: config titlePosition equals: 0 @ 20

]

{ #category : #tests }
RTAxisConfigurationTest >> testtitlePosition02 [
	config titlePosition: 50 @ 30.
	self assert: config titlePosition equals: 50 @ 30
]

{ #category : #tests }
RTAxisConfigurationTest >> testwithThousandsSeparator [
	config withThousandsSeparator.
	self assert: (config getStringFromNumber: 1000) equals: '1,000'.
	self assert: (config getStringFromNumber: 1000000) equals: '1,000,000'.
]
