Class {
	#name : #GtExplicitExampleGroup,
	#superclass : #GtExampleGroup,
	#instVars : [
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #examples }
GtExplicitExampleGroup class >> gtExampleExplicitEmptyGroup [
	<gtExample>
	^ self new examples: #()
]

{ #category : #accessing }
GtExplicitExampleGroup >> examples [
	^ examples
]

{ #category : #accessing }
GtExplicitExampleGroup >> examples: aCollection [
	examples := aCollection collect: [ :each | each asExampleWithResult ]
]

{ #category : #initialization }
GtExplicitExampleGroup >> initialize [
	super initialize.
	examples := #().
]

{ #category : #accessing }
GtExplicitExampleGroup >> size [
	^ examples size
]
