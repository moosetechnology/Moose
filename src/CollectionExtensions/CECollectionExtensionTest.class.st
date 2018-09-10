Class {
	#name : #CECollectionExtensionTest,
	#superclass : #TestCase,
	#category : #CollectionExtensions
}

{ #category : #conversion }
CECollectionExtensionTest >> testAsCollection [

	| collection |
	self assert: (Object new asCollection isKindOf: OrderedCollection).
	
	collection := Set new.
	self assert: collection asCollection equals: collection.
	self assert: (collection asCollection isKindOf: Set)
]

{ #category : #'collect as set' }
CECollectionExtensionTest >> testCollectAsSet [
	"self debug: #testCollectAsSet"
	
	self assert: ((#() collectAsSet: [:each | each odd]) = Set new).
	self assert: (#(1 2 3 4 5 6) collectAsSet: [:each | each odd])
					 = (Set with: true with: false).
	self assert: (#(1 3 5 7 9 11) collectAsSet: [:each | each odd]) 
					= (Set with: true).
					
	self assert: (#(1 2 3 4 5 4 3 2 1) collectAsSet: [:each | each]) = (1 to: 5) asSet.
	
	
]

{ #category : #'collect as set' }
CECollectionExtensionTest >> testCollectAsSetUsingSymbol [
	"self debug: #testCollectAsSetUsingSymbol"
	
	self assert: ((#() collectAsSet: #odd) = Set new).
	self assert: (#(1 2 3 4 5 6) collectAsSet: #odd)
					 = (Set with: true with: false).
	self assert: (#(1 3 5 7 9 11) collectAsSet: #odd) 
					= (Set with: true).
]

{ #category : #flatten }
CECollectionExtensionTest >> testDeepFlatten [

	self assert: #(1 2 3)
		equals: #((1) (2) (3)) deepFlatten.
	self assert: #(1 2 3 1 2)
		equals: #((1 2) (3 1 2)) deepFlatten.

]

{ #category : #flatten }
CECollectionExtensionTest >> testDeepFlattenIsRecursive [

	self assert: #(1 2 4 5 3)
		equals: #((1 2) ((4 5) 3)) deepFlatten.
]

{ #category : #flatten }
CECollectionExtensionTest >> testDeepFlattenOnFlatCollection [

	self assert: #(1 2 4)
		equals: #(1 2 4) deepFlatten.
	self assert: #(5 3)
		equals: #(5 ((3))) deepFlatten.
]

{ #category : #flatten }
CECollectionExtensionTest >> testDeepFlattenOnString [
	"don't flatten strings"

	self assert: #(a b c d e)
		equals: #((a b) ((c d) e)) deepFlatten.
	self assert: #('foo' 'bar' 'zorg')
		equals: #(('foo' ('bar')) 'zorg') deepFlatten
]

{ #category : #detect }
CECollectionExtensionTest >> testDetectIfOne [
	| element result |
	result := #(1 2 3) detect: [:each | each = 2] ifOne: [:theOne | element := theOne ].
	self assert: element = 2.
	self assert: result = 2.

	element := 42.
	result := #(1 2 3) detect: [:each | each = 4] ifOne: [:theOne | element := theOne ].
	self assert: element equals: 42.
	self assert: result isNil.
]

{ #category : #detect }
CECollectionExtensionTest >> testDetectIfOneIfNone [
	| element |
	#(1 2 3) detect: [:each | each = 2] ifOne: [:theOne | element := theOne ] ifNone: [element := nil].
	self assert: element = 2.

	#(1 2 3) detect: [:each | each = 4] ifOne: [:theOne | element := theOne ] ifNone: [element := nil].
	self assert: element isNil.

]

{ #category : #'flat collect' }
CECollectionExtensionTest >> testFlatCollect [
	"self debug: #testFlatCollect"
	
	
]

{ #category : #'flat collect' }
CECollectionExtensionTest >> testFlatCollectArray [
	"self debug: #testFlatCollectArray"
	
	self assert: ((#((1 2) (3 4) (5 3)) flatCollect: [ :each | each ]) = #(1 2 3 4 5 3)).
	self assert: ((#((1 2) (2 3) (1 3 4)) flatCollect: [:each | each]) = #(1 2 2 3 1 3 4)). 	
		
	self assert: ((#((1 2) (2 3) () ()) flatCollect: [:each | each]) = #(1 2 2 3)). 

	self assert: ((#((1 2) (2 3) (1 3 4)) flatCollect: [:each| Array with: each])
					=  #(#(1 2) #(2 3) #(1 3 4))).
					
	self assert: ((#((1 2) (2 3) (1 3 4)) flatCollect: [:each| Set with: each])
					=  #(#(1 2) #(2 3) #(1 3 4))).	
	

]

{ #category : #'flat collect' }
CECollectionExtensionTest >> testFlatCollectSet [
	"self debug: #testFlatCollectSet"
	
	self assert: ((#((1 2) (1 2) (1 3 4)) asSet  flatCollect: [:each | each]) = #(1 1 2 3 4) asSet).
	self assert: ((#() asSet flatCollect: [:each]) = #() asSet).

	self assert:  ((#((1 2) () (1 3 4)) asSet  flatCollect: [:each | each]) = #(1 1 2 3 4) asSet).
	self assert:  ((#((1 2) #((99)) (1 3 4)) asSet  flatCollect: [:each | each]) 
					= #(1 1 2 3 4 (99)) asSet).
	self assert:  ((#((1 2) #(()) (1 3 4)) asSet  flatCollect: [:each | each]) 
					= #(1 1 2 3 4 ()) asSet).
]

{ #category : #flatten }
CECollectionExtensionTest >> testFlatten [

	self assert: #(1 2 3)
		equals: #((1) (2) (3)) flatten.
	self assert: #(1 2 3 1 2)
		equals: #((1 2) (3 1 2)) flatten.
	self assert: #(a b (c d))
		equals: #((a b) ((c d))) flatten.
	self should: [ #((1 2) 3) flatten ] raise: Error.
]

{ #category : #groupedBy }
CECollectionExtensionTest >> testGroupedBy [
	"self debug: #testGroupedBy"
	
	| res |
	res := #(1 2 3 4 5) asOrderedCollection 
				groupedBy: [:each | each odd].
	self assert:   (res at: true) = #(1 3 5) asOrderedCollection.
	self assert: (res at: false) = #(2 4) asOrderedCollection
]

{ #category : #groupedBy }
CECollectionExtensionTest >> testGroupedByArray [
	"self debug: #testGroupedByArray"
	
	| res |
	res := #(1 2 3 4 5) groupedBy: [:each | each odd].
	self assert:   (res at: true) = #(1 3 5).
	self assert: (res at: false) = #(2 4)
]

{ #category : #groupedBy }
CECollectionExtensionTest >> testGroupedBySet [
	"self debug: #testGroupedBySet"
	
	| res |
	res := #(1 2 3 4 5 3 4 5) asSet groupedBy: [:each | each odd].
	self assert: (res at: true) = #(1 3 5) asSet.
	self assert: (res at: false) = #(2 4) asSet
]

{ #category : #'symbol - value' }
CECollectionExtensionTest >> testSymbolInPlaceOfBlock [
	"self debug: #testSymbolInPlaceOfBlock"
	
	self assert: (#(1 2 3 4) collect: #odd) =  #(true false true false).
	self assert: (#(1 2 3 4) select: #odd) =  #(1 3).
]

{ #category : #'instance creation' }
CECollectionExtensionTest >> testWithWithAll [
	| array |
	array := Array with: '42' withAll: #(4 2).
	self assert: array equals: #('42' 4 2)
]
