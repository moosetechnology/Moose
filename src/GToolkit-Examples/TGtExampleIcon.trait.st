"
I am atrait does it's not used now, but I am still here because of comparibility with the stable version of roassal
"
Trait {
	#name : #TGtExampleIcon,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #private }
TGtExampleIcon >> basicForm [
	^ self subclassResponsibility
]

{ #category : #private }
TGtExampleIcon >> form [
	^ self exists
		ifTrue: [ self basicForm ]
		ifFalse: [ nil ]
]

{ #category : #private }
TGtExampleIcon >> gtInspectorFormIn: composite [
	<gtInspectorPresentationOrder: 0>
	self exists ifFalse: [ ^ self ].
	
	self form gtInspectorFormIn: composite
]
