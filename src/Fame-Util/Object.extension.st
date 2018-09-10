Extension { #name : #Object }

{ #category : #'*fame-util' }
Object >> handleFameProperty: aSymbol value: anObject [
	"override me if you want your object to deal with undefined properties loaded from MSE"
	Transcript show: 'Unkown property ''', aSymbol, ''' in ', self class asString.
	Transcript cr.

]

{ #category : #'*fame-util' }
Object >> isFM3Class [
	^false
]

{ #category : #'*fame-util' }
Object >> isFM3Package [
	^false
]

{ #category : #'*fame-util' }
Object >> isFM3Property [
	^false
]

{ #category : #'*fame-util' }
Object >> mmGetProperty: aFM3PropertyDescription [
	"Get instance value for a property. Override if you want to handle the property by yourself"

	^ aFM3PropertyDescription getRawFrom: self
]

{ #category : #'*fame-util' }
Object >> mmSetProperty: aFM3PropertyDescription to: value [
	"Set instance value for a property"

	aFM3PropertyDescription setOn: self rawValue: value
]
