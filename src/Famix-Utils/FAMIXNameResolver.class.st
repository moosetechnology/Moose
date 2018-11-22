Class {
	#name : #FAMIXNameResolver,
	#superclass : #MooseUtilities,
	#category : #'Famix-Utils'
}

{ #category : #private }
FAMIXNameResolver class >> classAttributeSeparator [
	^'.'
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
