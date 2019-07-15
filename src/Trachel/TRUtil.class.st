Class {
	#name : #TRUtil,
	#superclass : #TRObject,
	#classInstVars : [
		'instance'
	],
	#category : #'Trachel-Core'
}

{ #category : #accessing }
TRUtil class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #factory }
TRUtil >> widgetFactory [
	^ TRMorphWidgetFactory
]
