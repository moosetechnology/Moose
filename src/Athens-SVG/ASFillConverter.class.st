Class {
	#name : #ASFillConverter,
	#superclass : #ASConverter,
	#category : #'Athens-SVG'
}

{ #category : #parsing }
ASFillConverter >> fromColor: aColor [
	^ ASColorPaint new color: aColor
]

{ #category : #parsing }
ASFillConverter >> fromHex: aString [
	^ ASColorPaint new color: (self parseColor: aString allButFirst)
]

{ #category : #parsing }
ASFillConverter >> fromName: aString [
	^ ASColorPaint new color: (Color perform: aString asSymbol)
]

{ #category : #parsing }
ASFillConverter >> fromRgb: aString [
	| str numbers |
	str := (aString copyAfter: $( ) copyUpTo: $).
	numbers := (str substrings: ',') collect: [:ea| ea trimBoth asNumber].

	^ ASColorPaint new color: (
		Color r: numbers first
			g: numbers second
			b: numbers third
			range: 255)
]

{ #category : #parsing }
ASFillConverter >> fromString: aString [

	(self isHex: aString) ifTrue: [
		^ self fromHex: aString ].
	
	(self isNone: aString) ifTrue: [
		^ self noFill ].
	
	(self isUrl: aString) ifTrue: [
		^ self fromUrl: aString ].
	
	(self isRgb: aString) ifTrue: [
		^ self fromRgb: aString ].
	
	(self isName: aString) ifTrue: [
		^ self fromName: aString ].
	
	Error signal: ('Unknown fill property: ', aString asString)
]

{ #category : #parsing }
ASFillConverter >> fromUrl: aString [
	^ ASLink new url: ( (aString copyAfter: $( ) copyUpTo: $) )
]

{ #category : #testing }
ASFillConverter >> isHex: aString [
	^ aString first = $#
]

{ #category : #testing }
ASFillConverter >> isName: aString [
	^ Color respondsTo: aString asSymbol
]

{ #category : #testing }
ASFillConverter >> isNone: aString [
	^ aString = 'none'
]

{ #category : #testing }
ASFillConverter >> isRgb: aString [
	^ aString beginsWith: 'rgb'
]

{ #category : #testing }
ASFillConverter >> isUrl: aString [
	^ aString beginsWith: 'url'
]

{ #category : #translate }
ASFillConverter >> translate: anObject [
	
	^ anObject asFillOn: self
]
