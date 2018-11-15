Class {
	#name : #GtClassExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'exampleClass',
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtClassExampleGroup >> exampleClass [
	^ exampleClass
]

{ #category : #accessing }
GtClassExampleGroup >> exampleClass: aClass [
	exampleClass := aClass.
	examples := exampleClass gtExamplesContained collect: [ :each | each asExampleWithResult ]
]

{ #category : #accessing }
GtClassExampleGroup >> examples [
	^ examples
]

{ #category : #subscription }
GtClassExampleGroup >> methodAdded: aMethodAnnouncement [
	aMethodAnnouncement methodAdded methodClass = self exampleClass
		ifTrue: [ 
			examples add: aMethodAnnouncement methodAdded gtExample asExampleWithResult.
			self announcer announce: GtExamplesUpdatedAnnouncement new ]
]

{ #category : #subscription }
GtClassExampleGroup >> methodRemoved: aMethodAnnouncement [
	aMethodAnnouncement methodRemoved methodClass = self exampleClass
		ifTrue: [ 
			examples 
				detect: [:each | each example selector = aMethodAnnouncement methodRemoved selector]
				ifFound: [ :exampleToRemove |
					examples remove: exampleToRemove.
					self announcer announce: GtExamplesUpdatedAnnouncement new ] ]
]

{ #category : #subscription }
GtClassExampleGroup >> subscribe [
	SystemAnnouncer uniqueInstance weak
		when: MethodAdded send: #methodAdded: to: self;
		when: MethodRemoved send: #methodRemoved: to: self
]
