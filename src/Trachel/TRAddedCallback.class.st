"
I am triggered when aShape is added to the canvas.
The opposite of me is TRRemoveCallback.

==aShape addCallback: (TRAddedCallback block: [ :shape | ""do sth"" ])==
"
Class {
	#name : #TRAddedCallback,
	#superclass : #TRCallback,
	#category : #'Trachel-Callbacks'
}

{ #category : #adding }
TRAddedCallback >> addShape: aTRShape [ 
	^ block cull: aTRShape 
]

{ #category : #testing }
TRAddedCallback >> isAddedCallback [
	^ true
]
