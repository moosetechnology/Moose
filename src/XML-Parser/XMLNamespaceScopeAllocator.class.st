"
This class allocates namespace scopes with a stack. Sending #enterScope pushes a new scope onto the stack that inherits all mappings from the previous (enclosing) scope, and #exitScop pops it off.
"
Class {
	#name : #XMLNamespaceScopeAllocator,
	#superclass : #Object,
	#instVars : [
		'scopes'
	],
	#category : #'XML-Parser-Namespaces'
}

{ #category : #accessing }
XMLNamespaceScopeAllocator >> currentScope [
	| totalScopes |

	^ (totalScopes := scopes size) > 0
		ifTrue: [scopes at: totalScopes]
		ifFalse: [self newEmptyScope]
]

{ #category : #accessing }
XMLNamespaceScopeAllocator >> currentScope: aScope [
	scopes size > 0
		ifTrue: [
			scopes
				at: scopes size
				put: aScope]
		ifFalse: [scopes addLast: aScope]
]

{ #category : #allocating }
XMLNamespaceScopeAllocator >> enterScope [
	^ scopes addLast: self currentScope copy
]

{ #category : #allocating }
XMLNamespaceScopeAllocator >> exitScope [
	^ scopes removeLast
]

{ #category : #testing }
XMLNamespaceScopeAllocator >> hasCurentScope [
	^ scopes notEmpty
]

{ #category : #initialization }
XMLNamespaceScopeAllocator >> initialize [
	super initialize.

	scopes := OrderedCollection new: 10.
]

{ #category : #'instance creation' }
XMLNamespaceScopeAllocator >> newEmptyScope [
	^ XMLNamespaceScope new
]

{ #category : #printing }
XMLNamespaceScopeAllocator >> printOn: aStream [
	super printOn: aStream.

	self hasCurentScope
		ifTrue: [
			aStream
				nextPut: $(;
				print: self currentScope;
				nextPut: $)].
]

{ #category : #accessing }
XMLNamespaceScopeAllocator >> scopes [
	^ scopes
]
