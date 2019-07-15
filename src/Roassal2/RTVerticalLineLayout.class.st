"
A RTVerticalLineLayout locates all the elements vertically
"
Class {
	#name : #RTVerticalLineLayout,
	#superclass : #RTAbstractLineLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTVerticalLineLayout >> deltaFor: aNodeFigure [
	
	| delta |
	delta := 0.
	self alignment == #right ifTrue: [delta := aNodeFigure width].
	self alignment == #center ifTrue: [delta := aNodeFigure width / 2.0].
	^delta @ 0
]

{ #category : #hook }
RTVerticalLineLayout >> doCenter: aGraph [ 

 	| midWidest step |
	midWidest := aGraph nodes 
		inject: 0
		into: [ :m :el | m max: (el bounds width )].
	midWidest := midWidest / 2.
	aGraph nodes do: [ :node | 
		step := (midWidest - (node bounds width /2)) asInteger @ 0.
		node bounds origin: (node bounds origin + step).
		node bounds corner: (node bounds corner + step).
	] 

]

{ #category : #hook }
RTVerticalLineLayout >> doStretchHorizontal: aCollectionOfElements [ 
	
 	| parent parentBounds |
	aCollectionOfElements isNil ifTrue: [ ^ self "nothing to do" ].
	parent := aCollectionOfElements anyOne parent.
	parent isView ifTrue: [ ^ self "ROView does not have bounds" ].
	parentBounds := parent bounds.

	aCollectionOfElements do: [ :element | 
		element width: parentBounds width ]
]

{ #category : #hook }
RTVerticalLineLayout >> doStretchVertical: aCollectionOfElements [ 

 	| parent parentBounds addedHeight parentBoundsHeight runningIndex newHeight |

	aCollectionOfElements isEmpty ifTrue: [ ^ self "nothing to do" ].
	parent := aCollectionOfElements anyOne parent.
	parent isView ifTrue: [ ^ self "ROView does not have bounds" ].
	parentBounds := parent bounds.

	addedHeight := aCollectionOfElements 
		inject: 0
		into: [ :m :el | m + el height ].

	parentBoundsHeight := parentBounds height.
	"parentBoundsHeight := parentBoundsHeight - ((aCollectionOfElements size - 1) * verticalGap) - (2 * verticalOutGap)."
	
	runningIndex := 0.
	parentBounds height > addedHeight
		ifTrue: [ aCollectionOfElements do: [ :element | 
						newHeight := (element height * parentBoundsHeight / addedHeight) asInteger.
						element height: newHeight.
						runningIndex := runningIndex + newHeight + verticalGap ] ]

]

{ #category : #'initialize-release' }
RTVerticalLineLayout >> initialize [
	
	super initialize.
	self alignLeft
]

{ #category : #hook }
RTVerticalLineLayout >> movePointer: pointer accordingToFigure: aNodeFigure [
	
	^ pointer x @ (pointer y + aNodeFigure height + self verticalGap)
]

{ #category : #hook }
RTVerticalLineLayout >> positionOriginalPointer: elements [ 
	| maxWidth delta |
	delta := 0.
	self alignment == #right ifTrue: 
		[ maxWidth := elements maxValue: #width.
		delta := maxWidth ].
	self alignment == #center ifTrue: 
		[ maxWidth := elements maxValue: #width.
		delta := maxWidth / 2.0 ].
	^ ((0) + delta) @ (0)

]
