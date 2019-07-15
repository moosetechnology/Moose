"
I am triggered when the extent (size) of aShape has been changed.

==aShape addCallback: (TRExtentCallback block: [ :shape :ratio | ""do sth"" ])==
"
Class {
	#name : #TRExtentCallback,
	#superclass : #TRCallback,
	#category : #'Trachel-Callbacks'
}

{ #category : #testing }
TRExtentCallback >> isExtentCallback [
	^ true
]

{ #category : #actions }
TRExtentCallback >> shape: aTRShape newExtent: newExtent oldExtent: oldExtent [
	^ (oldExtent x = 0 or: [ oldExtent y = 0 ]) 
		ifTrue: [ self
						shape: aTRShape
						ratio: 0  ]
		ifFalse: [ self
						shape: aTRShape
						ratio: newExtent / oldExtent ]
					
]

{ #category : #actions }
TRExtentCallback >> shape: aTRShape ratio: aRatio [
	^ block cull: aTRShape cull: aRatio
]
