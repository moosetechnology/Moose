"
An order-preserving dictionary that returns a configurable default value (nil by default) when an absent key or value is requested from it rather than raising an exception.
"
Class {
	#name : #OrderPreservingDictionary,
	#superclass : #StandardOrderedDictionary,
	#instVars : [
		'defaultValue'
	],
	#category : #'Collections-OrderPreservingDictionary'
}

{ #category : #'instance creation' }
OrderPreservingDictionary class >> defaultValue: aDefaultValue [
	^ self new defaultValue: aDefaultValue
]

{ #category : #'instance creation' }
OrderPreservingDictionary class >> new: aCapacity withDefaultValue: aDefaultValue [
	^ self basicNew
		initialize: aCapacity
		withDefaultValue: aDefaultValue
]

{ #category : #'instance creation' }
OrderPreservingDictionary class >> newFrom: anAssociationCollection [
	| newDictionary |

	newDictionary := super newFrom: anAssociationCollection.
	(anAssociationCollection respondsTo: #defaultValue)
		ifTrue: [newDictionary defaultValue: anAssociationCollection defaultValue].
	^ newDictionary.
]

{ #category : #accessing }
OrderPreservingDictionary >> associationAt: aKey [
	^ self
		associationAt: aKey
		ifAbsent: [nil]
]

{ #category : #accessing }
OrderPreservingDictionary >> at: aKey [
	^ self
		at: aKey
		ifAbsent: [defaultValue]
]

{ #category : #copying }
OrderPreservingDictionary >> copyEmpty [
	^ self species defaultValue: defaultValue
]

{ #category : #accessing }
OrderPreservingDictionary >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
OrderPreservingDictionary >> defaultValue: aDefaultValue [
	defaultValue := aDefaultValue
]

{ #category : #initialization }
OrderPreservingDictionary >> initialize: aCapacity withDefaultValue: aDefaultValue [
	self initialize: aCapacity.
	defaultValue := aDefaultValue.
]

{ #category : #accessing }
OrderPreservingDictionary >> keyAtIdentityValue: aValue [
	^ self
		keyAtIdentityValue: aValue
		ifAbsent: [defaultValue]
]

{ #category : #accessing }
OrderPreservingDictionary >> keyAtIndex: anIndex [
	^ self
		keyAtIndex: anIndex
		ifAbsent: [defaultValue]
]

{ #category : #accessing }
OrderPreservingDictionary >> keyAtValue: aValue [
	^ self
		keyAtValue: aValue
		ifAbsent: [defaultValue]
]

{ #category : #removing }
OrderPreservingDictionary >> removeKey: aKey [
	^ self
		removeKey: aKey
		ifAbsent: [defaultValue]
]

{ #category : #private }
OrderPreservingDictionary >> speciesNewFrom: anAssociationCollection [
	^ (self species newFrom: anAssociationCollection)
		defaultValue: defaultValue
]
