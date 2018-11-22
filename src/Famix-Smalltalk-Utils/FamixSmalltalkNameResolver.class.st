Class {
	#name : #FamixSmalltalkNameResolver,
	#superclass : #Object,
	#category : #'Famix-Smalltalk-Utils'
}

{ #category : #private }
FamixSmalltalkNameResolver class >> classAttributeSeparator [
	^'.'
]

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> famixNamespaceSeparator [
	^'::'
]

{ #category : #'getting classes' }
FamixSmalltalkNameResolver class >> findClassNamedOrNilFromFullName: stClassFullNameSymbol [
	"returns the class whose name is aClassFullNameSymbol. 
	aClassFullNameSymbol should smalltalk and not moose related.and should not represent a metaclass"

	^ self class environment at: stClassFullNameSymbol asSymbol ifAbsent: [ nil ]
]

{ #category : #private }
FamixSmalltalkNameResolver class >> metaclassTag [
	"The meta class tag used in FAMIX2."

	^'_class'
]

{ #category : #private }
FamixSmalltalkNameResolver class >> methodAndVariableSeparator [
	^'.'
]

{ #category : #'new naming conventions' }
FamixSmalltalkNameResolver class >> mooseNameForAttributeNamed: anAttributeName class: aClassName classSide: aBoolean [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	 aBoolean 
		ifTrue: [^(aClassName, self metaclassTag , self classAttributeSeparator , anAttributeName) asSymbol]
		ifFalse: [^(aClassName , self classAttributeSeparator , anAttributeName) asSymbol]
]

{ #category : #'new naming conventions' }
FamixSmalltalkNameResolver class >> mooseNameForSharedAttributeNamed: anAttributeName class: aClassName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	  ^(aClassName, self classAttributeSeparator , anAttributeName) asSymbol
		
]

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> moosify: aString [

	^aString
		copyReplaceAll: self smalltalkNamespaceSeparator
		with: self famixNamespaceSeparator
]

{ #category : #naming }
FamixSmalltalkNameResolver class >> signatureFromSmalltalkSelectorOn: aName [
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
FamixSmalltalkNameResolver class >> smalltalkClassFromFamixClassName: aFAMIXName ifAbsent: aBlock [
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
FamixSmalltalkNameResolver class >> smalltalkClassNameFromFamixClassName: aFAMIXName [
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
FamixSmalltalkNameResolver class >> smalltalkNamespaceSeparator [
	^'.'
]

{ #category : #private }
FamixSmalltalkNameResolver class >> stMetaclassTag [
	"The meta class tag used in SmalltLK."

	^' class'
]

{ #category : #'language independent unique naming' }
FamixSmalltalkNameResolver class >> uniqueNameForClassNamed: aClassName scope: uniqueParentNamespaceOrNil [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^uniqueParentNamespaceOrNil isNil
		ifTrue: [aClassName asSymbol]
		ifFalse:
			[(uniqueParentNamespaceOrNil asString , self famixNamespaceSeparator
				, aClassName) asSymbol]
]

{ #category : #'language independent unique naming' }
FamixSmalltalkNameResolver class >> uniqueNameForImplicitVariableNamed: aVarName scope: scopeQualifierOrNil [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(scopeQualifierOrNil isNil or: [scopeQualifierOrNil isEmpty])
		ifTrue: [aVarName asSymbol]
		ifFalse:
			[(scopeQualifierOrNil , self methodAndVariableSeparator , aVarName)
				asSymbol]
]

{ #category : #'language independent unique naming' }
FamixSmalltalkNameResolver class >> uniqueNameForLocalVariableNamed: aVariableName belongsTo: aBehaviourName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(aBehaviourName , self methodAndVariableSeparator , aVariableName)
		asSymbol
]

{ #category : #'language independent unique naming' }
FamixSmalltalkNameResolver class >> uniqueNameForMethodSignature: aMethodSignature hasClassScope: aBooleanOrNil class: aClassName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(aClassName , self methodAndVariableSeparator , aMethodSignature)
		asSymbol
]

{ #category : #'language independent unique naming' }
FamixSmalltalkNameResolver class >> uniqueNameForMethodWithSmalltalkSelector: aSymbol hasClassScope: aBooleanOrNil class: aClassName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^self
		uniqueNameForMethodSignature:
			(self signatureFromSmalltalkSelectorOn: aSymbol)
		hasClassScope: aBooleanOrNil
		class: aClassName
]

{ #category : #'language independent unique naming' }
FamixSmalltalkNameResolver class >> uniqueNameForNamespaceNamed: aNamespaceName scope: uniqueParentNamespaceName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(uniqueParentNamespaceName isNil or: [uniqueParentNamespaceName isEmpty])
		ifTrue: [aNamespaceName asSymbol]
		ifFalse:
			[(uniqueParentNamespaceName asString , self famixNamespaceSeparator
				, aNamespaceName) asSymbol]
]
