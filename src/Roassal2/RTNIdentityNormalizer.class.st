"
A RONIdentityNormalizer is xxxxxxxxx.

Instance Variables
	colorIndex:		<Object>
	dictionary:		<Object>

colorIndex
	- xxxxx

dictionary
	- xxxxx

"
Class {
	#name : #RTNIdentityNormalizer,
	#superclass : #RTNAbstractNormalizer,
	#instVars : [
		'dictionary',
		'colorIndex'
	],
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #'instance creation' }
RTNIdentityNormalizer class >> beginingAtBlue [
	^ self new
			setIndexTo: Color blue;
			yourself
]

{ #category : #'instance creation' }
RTNIdentityNormalizer class >> beginingAtRed [
	^ self new
			setIndexTo: Color red;
			yourself
]

{ #category : #'instance creation' }
RTNIdentityNormalizer class >> withCommand: aBlock [
	
	^(self new)
		command: aBlock;
		yourself
]

{ #category : #'initialize-release' }
RTNIdentityNormalizer >> colors [
	^ Color distinctTenStrongColors
]

{ #category : #'initialize-release' }
RTNIdentityNormalizer >> initialize [
	
	super initialize.
	colorIndex := 0.
	dictionary := Dictionary new.
	command := #yourself
]

{ #category : #private }
RTNIdentityNormalizer >> nextColor [
	
	colorIndex := colorIndex \\ self colors size + 1.
	^self colors at: colorIndex
]

{ #category : #accessing }
RTNIdentityNormalizer >> rtValue: anEntity [
	
	^dictionary
		at: (command rtValue: anEntity)
		ifAbsentPut: [ self nextColor ]
]

{ #category : #private }
RTNIdentityNormalizer >> setIndexTo: aColor [
	"colorAsSymbol has to be one of Color colorNames. 
	The method set the current index to the color given in parameter"
	
	colorIndex := (self colors indexOf: aColor) - 1
]
