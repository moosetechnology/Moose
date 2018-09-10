Class {
	#name : #DeepTreeGraphTraverserTest,
	#superclass : #DeepTraverserGraphTest,
	#instVars : [
		'tree'
	],
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #private }
DeepTreeGraphTraverserTest >> assert: aResult graph: aDictionary iterator: aClass start: start [
	| result iterator |
	self shouldnt: [ 
		result := OrderedCollection new.
		iterator := aClass new 
			on: aDictionary startWith: start;
			onNodeTraverse: [ :e | aDictionary at: e ifAbsent: [ #() ] ];
			onNodeAction: [ :e | result add: e ];
			yourself.
		iterator run ] raise: Error.
	self assert: result asArray = aResult asArray
]

{ #category : #private }
DeepTreeGraphTraverserTest >> nextTreeElementsFrom: each [
	^ tree at: each ifAbsent: [ #() ]
]

{ #category : #running }
DeepTreeGraphTraverserTest >> setUp [
	super setUp.
	
	graph := Dictionary new
		at: $a put: #( $b $c $d );
		at: $b put: #( $e $f );
		at: $c put: #( $g $f );
		at: $g put: #( $f );
		at: $d put: #( $h $i );
		at: $f put: #( $j $k );
		at: $k put: #( $b $c );
		yourself.
		
	tree := Dictionary new
		at: $a put: #( $b $c $d );
		at: $b put: #( $e $f );
		at: $c put: #( $g );
		at: $d put: #( $h $i );
		at: $f put: #( $j $k );
		yourself
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testAllMethods [
	| raw stream |
	self shouldnt: [ 
		raw := Object allSubclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self shouldnt: [ 
		stream := Object
			deep: #subclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self assert: raw asSet = stream asSet.
	
	self shouldnt: [ 
		raw := Array allSubclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self shouldnt: [ 
		stream := Array
			deep: #subclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self assert: raw asSet = stream asSet
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testAllSubclasses [
	| raw stream |
	self shouldnt: [ raw := Object allSubclasses ] raise: Error.
	self shouldnt: [ stream := Object deepCollect: #subclasses ] raise: Error.
	self assert: raw asSet = stream asSet.
	
	self shouldnt: [ raw := Number allSubclasses ] raise: Error.
	self shouldnt: [ stream := Number deepCollect: #subclasses ] raise: Error.
	self assert: raw asSet = stream asSet
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testBreadthFirstGraphIterator [
	self assert: #( $a $b $c $d $e $f $g $h $i $j $k ) 
		graph: graph 
		iterator: DeepTraverserWithoutEdges
		start: $a.
	
	self assert: #( $a $b $c $d $e $f $g $h $i $j $k ) = ($a
		withDeep: [ :item | self nextGraphElementsFrom: item ]
		collect: [ :item | item ]) asArray.
		
	self assert: #( $a $b $c $d $e $f $g $h $i $j $k ) 
		graph: tree 
		iterator: DeepTraverserWithoutEdges
		start: $a.
	
	self assert: #( $a $b $c $d $e $f $g $h $i $j $k ) = ($a
		withDeep: [ :item | self nextTreeElementsFrom: item ]
		collect: [ :item | item ]) asArray.
	
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testCollectionStart [
	| stream1 stream2 diff21 diff12 |
	self timeLimit: 60 seconds.
	self shouldnt: [ 
		stream1 := { Object }
			deep: #subclasses 
			flatCollect: [ :each | each methods ]  ] raise: Error.
	self shouldnt: [ 
		stream2 := Object
			withDeep: #subclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	
	self deny: stream2 asSet = stream1 asSet.
	self deny: (diff21 := stream2 asSet difference: stream1 asSet) isEmpty.
	self assert: (diff12 := stream1 asSet difference: stream2 asSet) isEmpty.
	self assert: (diff21 allSatisfy: [ :cm | cm methodClass = Object ]).
	self assert: diff21 asSet = Object methods asSet
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testStreaming [
	| iterator performed |
	iterator := DeepTraverserWithoutEdges new 
		on: graph startWith: $a;
		onNodeTraverse: [ :item | self nextGraphElementsFrom: item ];
		onNodeAction: [ :item | performed := item ];
		yourself.
 
	self assert: iterator next = $a.
	self assert: iterator next = $b.	
		
	self assert: (iterator next: 4) = { $c. $d. $e. $f }.
	self assert: (iterator next: 4) = { $g. $h. $i. $j }.
	
	self shouldnt: [ iterator upToEnd ] raise: Error.
	self shouldnt: [ iterator upToEnd ] raise: Error.
	
	self should: [ iterator next ] raise: Error.
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testStreamingNext [
	| iterator performed |
	iterator := DeepTraverserWithoutEdges new 
		on: graph startWith: $a;
		onNodeTraverse: [ :item | self nextGraphElementsFrom: item ];
		onNodeAction: [ :item | performed := item ];
		yourself.

	self assert: iterator current isNil.
	self assert: iterator next = $a.
	self assert: iterator next = $b.	
	self assert: iterator next = $c.
	self assert: iterator next = $d.
	self assert: iterator next = $e.
	self assert: iterator next = $f.
	self assert: iterator next = $g.
	self assert: iterator next = $h.
	self assert: iterator next = $i.
	self assert: iterator next = $j.
	self assert: iterator next = $k.
	
	self assert: performed = $k.
	self should: [ iterator next ] raise: Error
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testStreamingNextProcessed [
	| iterator performed |
	iterator := DeepTraverserWithoutEdges new 
		on: graph startWith: $a;
		onNodeTraverse: [ :item | self nextGraphElementsFrom: item ];
		onNodeAction: [ :item | performed := item ];
		yourself.

	#( $a $b $c $d $e $f $g $h $i $j $k ) do: [ :each |
		self assert: iterator next = each ]
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testSuperclass [
	| raw stream |
	self shouldnt: [ raw := Object allSuperclasses ] raise: Error.
	self shouldnt: [ stream := Object deepCollect: #superclass ] raise: Error.
	self assert: raw asSet = stream asSet.
	
	self shouldnt: [ raw := Number allSuperclasses ] raise: Error.
	self shouldnt: [ stream := Number deepCollect: #superclass ] raise: Error.
	self assert: raw asSet = stream asSet
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testWithAllMethods [
	| raw stream |
	self shouldnt: [ 
		raw := Object withAllSubclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self shouldnt: [ 
		stream := Object
			withDeep: #subclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self assert: raw asSet = stream asSet.
	
	self shouldnt: [ 
		raw := Array withAllSubclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self shouldnt: [ 
		stream := Array
			withDeep: #subclasses 
			flatCollect: [ :each | each methods ] ] raise: Error.
	self assert: raw asSet = stream asSet
]

{ #category : #tests }
DeepTreeGraphTraverserTest >> testWithAllSubclasses [
	| raw stream |
	self shouldnt: [ raw := Object withAllSubclasses ] raise: Error.
	self shouldnt: [ stream := Object withDeepCollect: #subclasses ] raise: Error.
	self assert: raw asSet = stream asSet.
	
	self shouldnt: [ raw := Number withAllSubclasses ] raise: Error.
	self shouldnt: [ stream := Number withDeepCollect: #subclasses ] raise: Error.
	self assert: raw asSet = stream asSet
]
