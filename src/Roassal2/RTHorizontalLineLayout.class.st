"
A RTHorizontalLineLayout locates all the elements horizontally
"
Class {
	#name : #RTHorizontalLineLayout,
	#superclass : #RTAbstractLineLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTHorizontalLineLayout >> deltaFor: aNodeFigure [
	
	| delta |
	delta := 0.
	self alignment == #bottom ifTrue: [delta := aNodeFigure height].
	self alignment == #center ifTrue: [delta := aNodeFigure height / 2.0].
	^0 @ delta
]

{ #category : #hook }
RTHorizontalLineLayout >> doCenter: elements [ 

 	| midTallest step |
	midTallest := 0.
	midTallest := elements nodes 
		inject: 0
		into: [ :m :el | m max: (el bounds height )].
	midTallest := midTallest / 2.
	elements nodes do: [ :node | 
		step := 0 @ (midTallest - (node bounds height / 2)) asInteger.
		node bounds origin: (node bounds origin + step).
		node bounds corner: (node bounds corner + step).
	] 

]

{ #category : #hook }
RTHorizontalLineLayout >> doStretchHorizontal: aCollectionOfElements [ 

 	| parent parentBounds addedWidth parentBoundsWidth runningIndex newWidth |

	aCollectionOfElements isEmpty ifTrue: [ ^ self "nothing to do" ].
	parent := aCollectionOfElements anyOne parent.
	parent isView ifTrue: [ ^ self "ROView does not have bounds" ].
	parentBounds := parent bounds.

	addedWidth := aCollectionOfElements
		inject: 0
		into: [ :m :el | m + el width ].

	parentBoundsWidth := parentBounds width.
"	parentBoundsWidth := parentBoundsWidth - ((aCollectionOfElements size - 1) * horizontalGap) - (2 * horizontalOutGap)."
	
	
	runningIndex := 0.
	parentBounds width > addedWidth
		ifTrue: [ aCollectionOfElements do: [ :element | 
						newWidth := (element width * parentBoundsWidth / addedWidth) asInteger.
						element width: newWidth.
						runningIndex := runningIndex + newWidth + horizontalGap ] ]
]

{ #category : #hook }
RTHorizontalLineLayout >> doStretchVertical: aCollectionOfElements [ 

 	| parent parentBounds |
	aCollectionOfElements isEmpty ifTrue: [ ^ self "nothing to do" ].
	parent := aCollectionOfElements anyOne parent.
	parent isView ifTrue: [ ^ self "ROView does not have bounds" ].
	parentBounds := parent bounds.

	aCollectionOfElements do: [ :element | 
		element height: (parentBounds height) ]
]

{ #category : #'initialize-release' }
RTHorizontalLineLayout >> initialize [
	
	super initialize.
	self alignTop
]

{ #category : #hook }
RTHorizontalLineLayout >> movePointer: pointer accordingToFigure: element [
	
	^ (pointer x + element width + self horizontalGap) @ pointer y
]

{ #category : #hook }
RTHorizontalLineLayout >> positionOriginalPointer: elements [ 
	| maxHeight delta |
	delta := 0.
	self alignment == #bottom ifTrue: 
		[ maxHeight := elements maxValue: #height.
		delta := maxHeight ].
	self alignment == #center ifTrue: 
		[ maxHeight := elements maxValue: #height.
		delta := maxHeight / 2.0 ].
	^ (0) @ ((0) + delta)
]
