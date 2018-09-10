"
An order-preserving dictionary for strings that returns empty strings instead of raising errors when absent keys/values are accessed.
"
Class {
	#name : #OrderPreservingStringDictionary,
	#superclass : #StandardOrderedDictionary,
	#category : #'Collections-OrderPreservingDictionary'
}

{ #category : #accessing }
OrderPreservingStringDictionary >> associationAt: aKey [
	^ self
		associationAt: aKey
		ifAbsent: [nil]
]

{ #category : #accessing }
OrderPreservingStringDictionary >> at: aKey [
	^ self
		at: aKey
		ifAbsent: ['']
]

{ #category : #accessing }
OrderPreservingStringDictionary >> keyAtIdentityValue: aValue [
	^ self
		keyAtIdentityValue: aValue
		ifAbsent: ['']
]

{ #category : #accessing }
OrderPreservingStringDictionary >> keyAtIndex: anIndex [
	^ self
		keyAtIndex: anIndex
		ifAbsent: ['']
]

{ #category : #accessing }
OrderPreservingStringDictionary >> keyAtValue: aValue [
	^ self
		keyAtValue: aValue
		ifAbsent: ['']
]

{ #category : #removing }
OrderPreservingStringDictionary >> removeKey: aKey [
	^ self
		removeKey: aKey
		ifAbsent: ['']
]
