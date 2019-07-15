Class {
	#name : #MalGanterAlgorithm,
	#superclass : #Object,
	#instVars : [
		'context',
		'attributesMask',
		'objectsMask'
	],
	#category : #'Moose-Algos-FormalConceptAnalysis'
}

{ #category : #'instance creation' }
MalGanterAlgorithm class >> on: formalContext [
	
	^self basicNew on: formalContext
]

{ #category : #accessing }
MalGanterAlgorithm >> allConcepts [
	
	| intent |
	^self findExtents
		collect:
			[:extent | 
			intent := self commonAttributesOf: extent.
			MalFormalConcept on: context extent: extent intent: intent]
]

{ #category : #algorithm }
MalGanterAlgorithm >> closureFor: objectMask [
	
	^self commonObjectsOf: (self commonAttributesOf: objectMask)
]

{ #category : #algorithm }
MalGanterAlgorithm >> commonAttributesOf: objectMask [
	
	| mask |
	mask := attributesMask.
	objectMask
		bitMaskDo:
			[:index | mask := mask bitAnd: (context objects at: index) bits].
	^mask
]

{ #category : #algorithm }
MalGanterAlgorithm >> commonObjectsOf: attributeMask [
	
	| mask |
	mask := objectsMask.
	attributeMask
		bitMaskDo:
			[:index | mask := mask bitAnd: (context attributes at: index) bits].
	^mask
]

{ #category : #algorithm }
MalGanterAlgorithm >> findExtents [
	
	| extents |
	self setUp.
	extents := "ArrayList" OrderedCollection  with: 0.
	[extents last = objectsMask]
		whileFalse: [extents add: (self findNextExtent: extents last)].
	^extents
]

{ #category : #algorithm }
MalGanterAlgorithm >> findNextExtent: extent [
	
	context objects size
		to: 1
		by: -1
		do:
			[:index | 
			| nextExtent |
			nextExtent := self closureFor: (extent copyUpToPlusIndex: index).
			(nextExtent upToPlusIndex: index isLargerThan: extent)
				ifTrue: [^nextExtent]].
	self error: nil
]

{ #category : #'initialize-release' }
MalGanterAlgorithm >> on: formalContext [
	
	context := formalContext
]

{ #category : #algorithm }
MalGanterAlgorithm >> setUp [
	
	attributesMask := Integer maskTrue: context attributes size.
	objectsMask := Integer maskTrue: context objects size
]
