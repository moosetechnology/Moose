"
A ROMultipleColorLinearNormalizer is xxxxxxxxx.

Instance Variables
	normalizers:		<Object>

normalizers
	- xxxxx

"
Class {
	#name : #RTMultipleColorLinearNormalizer,
	#superclass : #RTNAbstractNormalizer,
	#instVars : [
		'normalizers'
	],
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #'instance creation' }
RTMultipleColorLinearNormalizer class >> valueRange: anArrayOfNumbers colorRange: anArrayOfColors [

	^ self new valueRange: anArrayOfNumbers colorRange: anArrayOfColors
]

{ #category : #'private-accessing' }
RTMultipleColorLinearNormalizer >> detectNormalizerFor: aValue [

	normalizers keysAndValuesDo: [:range :norm |
		(range rangeIncludes: aValue)
			ifTrue: [^ norm] ].
	self error: aValue asString, ' not in declared ranges'
]

{ #category : #'initialize-release' }
RTMultipleColorLinearNormalizer >> initialize [

	command := #yourself
]

{ #category : #accessing }
RTMultipleColorLinearNormalizer >> rtValue: anEntity [

	| value |
	value := self command rtValue: anEntity.
	"detect range for the value, retrieve and call corresponding normalizers"
	^ (self detectNormalizerFor: value) rtValue: value
]

{ #category : #'initialize-release' }
RTMultipleColorLinearNormalizer >> valueRange: anArrayOfNumbers colorRange: anArrayOfColors [
	" {1. 2. 3} {Color red. Color yellow. Color green}"
	
	| size start end |
	normalizers := Dictionary new.
	self assert: anArrayOfNumbers size = anArrayOfColors size.
	size := anArrayOfNumbers size.
	1 to: size - 1 do: [ :i |
		start := anArrayOfNumbers at: i.
		end :=  anArrayOfNumbers at: i + 1.
		normalizers
			at: (start to: end)
			put: (RTNColorLinearNormalizer
						inContext: (Array with: start with: end)
						lowColor: (anArrayOfColors at: i)
						highColor: (anArrayOfColors at: i + 1))
	].

]
