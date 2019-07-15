"
I encapsulate an icon for an example. My subclasses should decide how the icon is constructed. I used the converters defined in ==GtExampleMethodIcon== to create the actual icon.
"
Class {
	#name : #GtExampleIcon,
	#superclass : #GtExampleAspect,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleIcon class >> isAbstract [
	^ self == GtExampleIcon
]

{ #category : #private }
GtExampleIcon >> basicForm [ 
	^ self subclassResponsibility
]

{ #category : #'accessing-dynamic' }
GtExampleIcon >> form [ 
	"I return the icon created by the associated method."
	^ self exists
		ifTrue: [ self basicForm ]
		ifFalse: [ nil ]
]

{ #category : #ui }
GtExampleIcon >> gtInspectorFormIn: composite [
	<gtInspectorPresentationOrder: 0>
	self exists ifFalse: [ ^ self ].
	
	self form gtInspectorFormIn: composite
]
