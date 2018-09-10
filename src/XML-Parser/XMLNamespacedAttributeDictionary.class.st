"
This subclass is used when namespaces are enabled. It has an extra inst var for namespace scopes.
"
Class {
	#name : #XMLNamespacedAttributeDictionary,
	#superclass : #XMLAttributeDictionary,
	#instVars : [
		'namespaceScope'
	],
	#category : #'XML-Parser'
}

{ #category : #private }
XMLNamespacedAttributeDictionary >> namespaceScope [
	^ namespaceScope ifNil: [namespaceScope := XMLNamespaceScope new]
]

{ #category : #private }
XMLNamespacedAttributeDictionary >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	^ self namespaceScope
		resolvePrefix: aPrefix
		ifUnresolvable: aBlock
]

{ #category : #initialization }
XMLNamespacedAttributeDictionary >> setNamespaceScope: aNamespaceScope [
	namespaceScope := aNamespaceScope
]

{ #category : #testing }
XMLNamespacedAttributeDictionary >> usesNamespaces [
	^ true
]
