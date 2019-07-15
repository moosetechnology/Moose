"
Adjust the size of the Elements.

[ [ [ 
	values := #(35 26 5 18 17 60 36 13 16 28 29 3 8 0 3 2 14 12 13 17 1 9 3 3 4 1 1 1 2 1 1 61).
	v := RTView new.
	n := RTMultiLinearColorForIdentity new objects: values.
	shape := RTBox new color: n; size: #yourself.
	es := shape elementsOn: values.
	v addAll: es.
	RTResize new elements: es; sameSize.
	RTHorizontalLineLayout new gapSize: 0; on: es.
	
	v
 ] ] ]
"
Class {
	#name : #RTResize,
	#superclass : #RTAbstractElementHandling,
	#category : #'Roassal2-Core'
}

{ #category : #'accessing - computed' }
RTResize >> biggestElement [
	^ elements inject: elements anyOne into: [ :biggestElement :e | 
			biggestElement extent < e extent
				ifTrue: [ e ] ifFalse: [ biggestElement ] ] 
]

{ #category : #'accessing - computed' }
RTResize >> biggestExtent [
	fixedElement ifNotNil: [ ^ fixedElement extent ].
	^ elements inject: 0 @ 0 into: [ :maxExtent :e | 
			maxExtent max: e extent ] 
]

{ #category : #'accessing - computed' }
RTResize >> highestElement [
	^ elements inject: elements anyOne into: [ :highestElement :e | 
			highestElement extent y < e extent y
				ifTrue: [ e ] ifFalse: [ highestElement ] ] 
]

{ #category : #public }
RTResize >> sameHeight [
	self ifNoFixedElementThen: [ self useHighestElement ].
	elements do: [ :e | e height: self fixedElement height ]
]

{ #category : #public }
RTResize >> sameSize [
	self ifNoFixedElementThen: [ self useBiggestElement ].
	elements do: [ :e | e extent: self fixedElement extent ]
]

{ #category : #public }
RTResize >> sameWidth [
	self ifNoFixedElementThen: [ self useWidestElement ].
	elements do: [ :e | e width: self fixedElement width ]
]

{ #category : #'public - configuration' }
RTResize >> useBiggestElement [
	self fixedElement: self biggestElement
]

{ #category : #'public - configuration' }
RTResize >> useHighestElement [
	self fixedElement: self highestElement 
]

{ #category : #'public - configuration' }
RTResize >> useWidestElement [
	self fixedElement: self widestElement
]

{ #category : #'accessing - computed' }
RTResize >> widestElement [
	^ elements inject: elements anyOne into: [ :widestElement :e | 
			widestElement extent x < e extent x
				ifTrue: [ e ] ifFalse: [ widestElement ] ] 
]
