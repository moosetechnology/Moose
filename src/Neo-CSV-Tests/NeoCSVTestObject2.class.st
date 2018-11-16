"
I am NeoCSVTestObject2. I am a NeoCSVTestObject.

I initialize my fields to specific values.
"
Class {
	#name : #NeoCSVTestObject2,
	#superclass : #NeoCSVTestObject,
	#category : 'Neo-CSV-Tests'
}

{ #category : #initalize }
NeoCSVTestObject2 >> initialize [
	super initialize.
	x := #x.
	y := #y.
	z := #z
]
