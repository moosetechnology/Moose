"
This is an abstract class for tag writers that are ""unsafe"" because they can make non-wellformed XML if they aren't used correctly.
"
Class {
	#name : #XMLUnsafeTagWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'name'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #testing }
XMLUnsafeTagWriter >> isTagWriter [
	^ true
]

{ #category : #testing }
XMLUnsafeTagWriter >> isUnsafeTagWriter [
	^ true
]

{ #category : #accessing }
XMLUnsafeTagWriter >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XMLUnsafeTagWriter >> name: aString [
	name := aString
]
