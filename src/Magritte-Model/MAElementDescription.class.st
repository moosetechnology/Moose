"
I am an abstract description for all basic description types.
"
Class {
	#name : #MAElementDescription,
	#superclass : #MADescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAElementDescription class >> defaultDisplayProperty [
	^ #greaseString
]

{ #category : #'instance creation' }
MAElementDescription class >> new [
	"override #new so that we can create an object without adding it to the collection returned by: MAElementDescription withAllConcreteClasses,
	that is so we can call  MAElementDescription new magritteDescription  and it works as expected, which is used in MADescriptionEditor>>#buildReport .
	Yes it's a hack, but it works... (better ideas gratefully received)"
	^ self basicNew initialize
]

{ #category : #visiting }
MAElementDescription >> acceptMagritte: aVisitor [
	aVisitor visitElementDescription: self
]

{ #category : #converting }
MAElementDescription >> asContainer [
	^ MAContainer with: self
]

{ #category : #accessing }
MAElementDescription >> default [
	^ self propertyAt: #default ifAbsent: [ self class defaultDefault ]
]

{ #category : #accessing }
MAElementDescription >> default: anObject [
	self propertyAt: #default put: anObject
]

{ #category : #'accessing-properties' }
MAElementDescription >> display: aBlockOrSymbol [
	"Transform how the file is converted to a string.
	aSymbol
		- is performed on the object
	aBlock
		- takes one argument, which is the domain object
		- returns the string to display"
	self propertyAt: #displayBlockOrSymbol put: aBlockOrSymbol.
]

{ #category : #'accessing-properties' }
MAElementDescription >> displayBlockOrSymbol [
	^self propertyAt: #displayBlockOrSymbol ifAbsent: [ self class defaultDisplayProperty ]
]

{ #category : #displaying }
MAElementDescription >> displayStringFor: anObject [
	"Convert object to a string. If a block was passed to #display: use that, otherwise send #greaseString by default"

	^self displayBlockOrSymbol value: anObject.
]
