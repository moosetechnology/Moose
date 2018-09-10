Class {
	#name : #FAMIXNameResolver,
	#superclass : #MooseUtilities,
	#category : #'Famix-Support'
}

{ #category : #private }
FAMIXNameResolver class >> classAttributeSeparator [
	^'.'
]

{ #category : #'naming conventions' }
FAMIXNameResolver class >> demoosifyGlobal: aString [
	^aString copyUpTo: $-
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> isCorrectFullClassName: aClassName [
	^(aClassName reverse
		indexOfSubCollection: self FAMIX2NamespaceSeparator
		startingAt: 1) > 0
]

{ #category : #private }
FAMIXNameResolver class >> methodAndVariableSeparator [
	^'.'
]

{ #category : #'new naming conventions' }
FAMIXNameResolver class >> mooseNameForAttributeNamed: anAttributeName class: aClassName classSide: aBoolean [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	 aBoolean 
		ifTrue: [^(aClassName, self metaclassTag , self classAttributeSeparator , anAttributeName) asSymbol]
		ifFalse: [^(aClassName , self classAttributeSeparator , anAttributeName) asSymbol]
]

{ #category : #'new naming conventions' }
FAMIXNameResolver class >> mooseNameForSharedAttributeNamed: anAttributeName class: aClassName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	  ^(aClassName, self classAttributeSeparator , anAttributeName) asSymbol
		
]

{ #category : #'naming conventions' }
FAMIXNameResolver class >> moosifyGlobal: aString [
	^aString , self prefixForGlobalVariable
]

{ #category : #private }
FAMIXNameResolver class >> prefixForGlobalVariable [
	^'-Global'
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForClassNamed: aClassName scope: uniqueParentNamespaceOrNil [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^uniqueParentNamespaceOrNil isNil
		ifTrue: [aClassName asSymbol]
		ifFalse:
			[(uniqueParentNamespaceOrNil asString , self famixNamespaceSeparator
				, aClassName) asSymbol]
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForFunctionSignature: aFuncSignature scope: scopeQualifierOrNil [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(scopeQualifierOrNil isNil or: [scopeQualifierOrNil isEmpty])
		ifTrue: [aFuncSignature asSymbol]
		ifFalse:
			[(scopeQualifierOrNil name asString , self famixNamespaceSeparator
				, aFuncSignature) asSymbol]
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForGlobalVariableNamed: aVarName scope: scopeQualifierOrNil [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	"Note that the problem in VW is that global variable and namespace can have the same name"

	^scopeQualifierOrNil isNil
		ifTrue: [(self moosifyGlobal: aVarName) asSymbol]
		ifFalse:
			[(scopeQualifierOrNil asString , self famixNamespaceSeparator , self
				moosifyGlobal: aVarName) asSymbol]
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForImplicitVariableNamed: aVarName scope: scopeQualifierOrNil [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(scopeQualifierOrNil isNil or: [scopeQualifierOrNil isEmpty])
		ifTrue: [aVarName asSymbol]
		ifFalse:
			[(scopeQualifierOrNil , self methodAndVariableSeparator , aVarName)
				asSymbol]
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForLocalVariableNamed: aVariableName belongsTo: aBehaviourName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(aBehaviourName , self methodAndVariableSeparator , aVariableName)
		asSymbol
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForMethodSignature: aMethodSignature hasClassScope: aBooleanOrNil class: aClassName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(aClassName , self methodAndVariableSeparator , aMethodSignature)
		asSymbol
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForMethodWithSmalltalkSelector: aSymbol hasClassScope: aBooleanOrNil class: aClassName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^self
		uniqueNameForMethodSignature:
			(self signatureFromSmalltalkSelectorOn: aSymbol)
		hasClassScope: aBooleanOrNil
		class: aClassName
]

{ #category : #'language independent unique naming' }
FAMIXNameResolver class >> uniqueNameForNamespaceNamed: aNamespaceName scope: uniqueParentNamespaceName [
	"Given ***FAMIX2 compliant**** names for the elements return a FAMIX2 Compliant uniqueName a SYMBOL"

	^(uniqueParentNamespaceName isNil or: [uniqueParentNamespaceName isEmpty])
		ifTrue: [aNamespaceName asSymbol]
		ifFalse:
			[(uniqueParentNamespaceName asString , self famixNamespaceSeparator
				, aNamespaceName) asSymbol]
]
