"
I encapsulate a metod that provides an icon for an example. I use the converter methods from my class side to create an icon (a Form object) from varios kinds of data, like byte array or base 64 strings.
"
Class {
	#name : #GtExampleMethodIcon,
	#superclass : #GtAbstractExampleMethod,
	#instVars : [
		'converter'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #converters }
GtExampleMethodIcon class >> convertFromBase64String: aString [
	^ Form fromBinaryStream: (aString base64Decoded readStream )
]

{ #category : #converters }
GtExampleMethodIcon class >> convertFromByteArray: aByteArray [
	^ self convertFromByteArray: aByteArray extent: 16@16 depth: 32 offset: 0@0
]

{ #category : #converters }
GtExampleMethodIcon class >> convertFromByteArray: aByteArray extent: anExtent depth: aDepth offset: anOffset [
	^ Form
		extent: anExtent
		depth: aDepth
		fromArray: aByteArray 
		offset: anOffset
]

{ #category : #private }
GtExampleMethodIcon >> basicForm [
	^ self class 
		perform: self converter 
		withArguments: { self provider perform: self selector }
]

{ #category : #accessing }
GtExampleMethodIcon >> converter [
	^ converter
]

{ #category : #accessing }
GtExampleMethodIcon >> converter: anObject [
	converter := anObject
]

{ #category : #testing }
GtExampleMethodIcon >> exists [
	^ super exists
		and: [ self converter notNil
			and: [ self class class includesSelector: self converter ] ]
]

{ #category : #'accessing-dynamic' }
GtExampleMethodIcon >> form [
	"I return the icon created by the associated method."
	^ self exists
		ifTrue: [ self basicForm ]
		ifFalse: [ nil ]
]

{ #category : #ui }
GtExampleMethodIcon >> gtInspectorFormIn: composite [ 
	<gtInspectorPresentationOrder: 0>
	self exists ifFalse: [ ^ self ].
	
	self form gtInspectorFormIn: composite
]
