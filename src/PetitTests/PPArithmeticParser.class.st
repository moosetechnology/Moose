Class {
	#name : #PPArithmeticParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'terms',
		'addition',
		'factors',
		'multiplication',
		'power',
		'primary',
		'parentheses',
		'number'
	],
	#category : #'PetitTests-Examples'
}

{ #category : #grammar }
PPArithmeticParser >> addition [
	^ (factors separatedBy: ($+ asParser / $- asParser) trim) 
		foldLeft: [ :a :op :b | a perform: op asSymbol with: b ]
]

{ #category : #grammar }
PPArithmeticParser >> factors [
	^ multiplication / power
]

{ #category : #grammar }
PPArithmeticParser >> multiplication [
	^ (power separatedBy: ($* asParser / $/ asParser) trim)
		foldLeft: [ :a :op :b | a perform: op asSymbol with: b ]
]

{ #category : #grammar }
PPArithmeticParser >> number [
	^ ($- asParser optional , #digit asParser plus , ($. asParser , #digit asParser plus) optional) flatten trim 
		==> [ :value | value asNumber ]
]

{ #category : #grammar }
PPArithmeticParser >> parentheses [
	^ $( asParser trim , terms , $) asParser trim
		==> [ :nodes | nodes at: 2 ]
]

{ #category : #grammar }
PPArithmeticParser >> power [
	^ (primary separatedBy: $^ asParser trim)
		foldRight: [ :a :op :b | a raisedTo: b ]
]

{ #category : #grammar }
PPArithmeticParser >> primary [
	^ number / parentheses
]

{ #category : #accessing }
PPArithmeticParser >> start [
	^ terms end
]

{ #category : #grammar }
PPArithmeticParser >> terms [
	^ addition / factors
]
