"
A RONFontLinearNormalizer is xxxxxxxxx.

"
Class {
	#name : #RTNFontLinearNormalizer,
	#superclass : #RTNLinearNormalizer,
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #accessing }
RTNFontLinearNormalizer >> rtValue: anEntity [
	"Calculates the color of the entity based on the context."
	
	| value |
	value := self command rtValue: anEntity.
	^5 + (38 * (value abs / (self maximumValue: anEntity))) asInteger
]
