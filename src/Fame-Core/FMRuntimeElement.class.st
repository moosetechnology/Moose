"
A FMRuntimeElement is a placeHolder to represent arbitrary class descriptions 
with arbitrary slots.

Instance Variables
	description:		<FM3Element>
	slots:		Dictionary of FM3PropertyDescription 

"
Class {
	#name : #FMRuntimeElement,
	#superclass : #Object,
	#instVars : [
		'description',
		'slots'
	],
	#category : #'Fame-Core'
}

{ #category : #'instance creation' }
FMRuntimeElement class >> with: aFM3Class [
	^self new description: aFM3Class
]

{ #category : #accessing }
FMRuntimeElement >> at: property [

	^ self at: property ifAbsent: [ Array new ]
]

{ #category : #accessing }
FMRuntimeElement >> at: property ifAbsent: aBlock [

	^slots at: property ifAbsent: aBlock 
]

{ #category : #accessing }
FMRuntimeElement >> at: property ifAbsentPut: aBlock [

	^ self at: property ifAbsent: [ self at: property put: aBlock value ]
]

{ #category : #accessing }
FMRuntimeElement >> at: property put: array [

	^slots at: property put: array
]

{ #category : #accessing }
FMRuntimeElement >> description [
	^ description
]

{ #category : #accessing }
FMRuntimeElement >> description: anObject [
	description := anObject
]

{ #category : #'initialize-release' }
FMRuntimeElement >> initialize [

	slots := IdentityDictionary new.
]

{ #category : #accessing }
FMRuntimeElement >> mmGetProperty: aFM3Property [

	^ self at: aFM3Property name
]

{ #category : #accessing }
FMRuntimeElement >> mmSetProperty: aFM3Property to: value [

	aFM3Property hasOpposite ifTrue: [ |opposite| "handle opposite setter here"
		opposite := aFM3Property opposite.
		opposite isMultivalued
		ifTrue: [  "opposite attribute is a collection, should add self to it"
			aFM3Property isMultivalued " there are many opposite values to update "
			ifTrue: [ value do: [ :v |
						(v at: opposite name ifAbsentPut: OrderedCollection new) add: self ]]
			ifFalse: [ (value at: opposite name ifAbsentPut: OrderedCollection new) add: self ]]
		ifFalse: [ "opposite attribute accept a single value"
			aFM3Property isMultivalued " there are many opposite values to update "
			ifTrue: [ value do: [ :v |
						v at: opposite name put: self ]]
			ifFalse: [ value at: opposite name put: self ]]			
		].
	^ self at: aFM3Property name put: value
]
