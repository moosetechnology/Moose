Class {
	#name : #MooseUtilities,
	#superclass : #Object,
	#category : #'Famix-Utils'
}

{ #category : #'naming conventions' }
MooseUtilities class >> famixNamespaceSeparator [
	^'::'
]

{ #category : #'getting classes' }
MooseUtilities class >> findClassNamedOrNilFromFullName: stClassFullNameSymbol [
	"returns the class whose name is aClassFullNameSymbol. 
	aClassFullNameSymbol should smalltalk and not moose related.and should not represent a metaclass"

	^ self class environment at: stClassFullNameSymbol asSymbol ifAbsent: [ nil ]
]

{ #category : #private }
MooseUtilities class >> metaclassTag [
	"The meta class tag used in FAMIX2."

	^'_class'
]

{ #category : #'naming conventions' }
MooseUtilities class >> moosify: aString [

	^aString
		copyReplaceAll: self smalltalkNamespaceSeparator
		with: self famixNamespaceSeparator
]

{ #category : #naming }
MooseUtilities class >> signatureFromSmalltalkSelectorOn: aName [
	"self signatureFromSmalltalkSelector: #new"

	"self signatureFromSmalltalkSelector: #new:"

	"self signatureFromSmalltalkSelector: #with:with:"

	"self signatureFromSmalltalkSelector: #with:with:with:"

	"self signatureFromSmalltalkSelector: #'+'"

	| sym ws numArgs |
	sym := aName asSymbol.
	numArgs := sym numArgs.
	ws := WriteStream on: (String new: sym size + (numArgs * 7) + 3).
	ws
		nextPutAll: sym;
		nextPut: $(.
	1
		to: numArgs
		do: [:inx | ws nextPutAll: 'Object,'].
	numArgs > 0 ifTrue: [ws skip: -1	"remove last space"].
	ws nextPut: $).
	^ws contents asSymbol
]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkClassFromFamixClassName: aFAMIXName ifAbsent: aBlock [
	"Given the FAMIX2 name for a class (for a meta class or not): return 
	that Smalltalk class."

	| stName isMeta newName res |
	stName := self smalltalkClassNameFromFamixClassName: aFAMIXName.
	isMeta := '*' , self stMetaclassTag match: stName.
	newName := isMeta 
		ifTrue: [stName copyFrom: 1 to: stName size - self stMetaclassTag size]
		ifFalse: [stName].
	res := self findClassNamedOrNilFromFullName: newName.
	^res isNil
		ifTrue: [aBlock value]
		ifFalse: [isMeta ifTrue: [res class] ifFalse: [res]]
]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkClassNameFromFamixClassName: aFAMIXName [
	"Given the FAMIX2 name for a class (for a meta class or not): return the Smalltalk name."

	| isMetaclass index |
	isMetaclass := '*' , self metaclassTag match: aFAMIXName.
	
	"we check whether there is a reference to a namespace in the famix name"
	index := aFAMIXName findString: self famixNamespaceSeparator.
	index := index isZero 
				ifTrue: [1]
				ifFalse: [(aFAMIXName findString: self famixNamespaceSeparator) + self famixNamespaceSeparator size].
	^ isMetaclass
		ifTrue: [ ((aFAMIXName copyFrom: index to: ((aFAMIXName findString: self metaclassTag) -1) ), ' class') asSymbol]
		ifFalse: [ (aFAMIXName copyFrom: index to: aFAMIXName size) asSymbol ]

]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkNamespaceSeparator [
	^'.'
]

{ #category : #private }
MooseUtilities class >> stMetaclassTag [
	"The meta class tag used in SmalltLK."

	^' class'
]
