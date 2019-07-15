"
I provide support for locationg aspects used by an example. 
"
Class {
	#name : #GtExampleAspectResolver,
	#superclass : #Object,
	#instVars : [
		'example',
		'meta',
		'aspectClass'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #accessing }
GtExampleAspectResolver >> aspectClass [
	^ aspectClass
]

{ #category : #accessing }
GtExampleAspectResolver >> aspectClass: anObject [
	aspectClass := anObject
]

{ #category : #private }
GtExampleAspectResolver >> ensureClass: aClass [
	(aClass isMeta not and: [ self meta ]) 
		ifTrue: [ ^ aClass class " be nice " ].
	(aClass isMeta and: [ self meta not ]) 
		ifTrue: [ ^ aClass "backward compatibility " ].
	" default case "
	^ aClass
]

{ #category : #accessing }
GtExampleAspectResolver >> example [
	^ example
]

{ #category : #accessing }
GtExampleAspectResolver >> example: anObject [
	example := anObject
]

{ #category : #accessing }
GtExampleAspectResolver >> meta [
	^ meta
]

{ #category : #accessing }
GtExampleAspectResolver >> meta: anObject [
	meta := anObject
]
