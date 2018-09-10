"
I am triggered when aShape has been removed from a canvas.
The opposite of me is TRAddedCallback.

==aShape addCallback: (TRRemoveCallback block: [ :shape | ""do sth"" ])==
"
Class {
	#name : #TRRemoveCallback,
	#superclass : #TRCallback,
	#category : #'Trachel-Callbacks'
}

{ #category : #testing }
TRRemoveCallback >> isRemoveCallback [
	^ true
]

{ #category : #linking }
TRRemoveCallback >> removeShape: aTRShape [ 
	^ block cull: aTRShape 
]
