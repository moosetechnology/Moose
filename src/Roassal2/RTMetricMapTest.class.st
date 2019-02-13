Class {
	#name : #RTMetricMapTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Map-Tests'
}

{ #category : #running }
RTMetricMapTest >> setUp [
	super setUp.
	b := RTMetricMap new.
]

{ #category : #tests }
RTMetricMapTest >> testNameConversion [

	self assert: (b convertIntoSVGCountryName: 'France') = #France.
	self assert: (b convertIntoSVGCountryName: 'Germany') = #Germany.
	self assert: (b convertIntoSVGCountryName: 'New Zealand') = #NewZealand.
	self assert: (b convertIntoSVGCountryName: 'Mauritius') = #Mauritania.
	self assert: (b convertIntoSVGCountryName: 'MauritiusNotExisting') isNil.
	
	self assert: (b convertIntoSVGCountryName: 'FR') = #France.
	self assert: (b convertIntoSVGCountryName: 'UK') = #GreatBritian.
	self assert: (b convertIntoSVGCountryName: 'DE') = #Germany.
	self assert: (b convertIntoSVGCountryName: 'US') = #UnitedStates.
	self assert: (b convertIntoSVGCountryName: 'CH') = #Switzerland.
	self assert: (b convertIntoSVGCountryName: 'CA') = #Canada.
	self assert: (b convertIntoSVGCountryName: 'AU') = #Austria.
	self assert: (b convertIntoSVGCountryName: 'IE') = #Israel.
	self assert: (b convertIntoSVGCountryName: 'IT') = #Italy.
]
