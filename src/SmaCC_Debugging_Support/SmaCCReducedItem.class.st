Class {
	#name : #SmaCCReducedItem,
	#superclass : #Object,
	#instVars : [
		'rhs',
		'items'
	],
	#category : #'SmaCC_Debugging_Support-Simulation'
}

{ #category : #'instance creation' }
SmaCCReducedItem class >> reduced: aRhs with: aCollection [
	^ self new
		rhs: aRhs;
		items: aCollection;
		yourself
]

{ #category : #accessing }
SmaCCReducedItem >> items [
	^ items
]

{ #category : #accessing }
SmaCCReducedItem >> items: anObject [
	items := anObject
]

{ #category : #printing }
SmaCCReducedItem >> printOn: aStream [
	| first |
	first := true.
	aStream nextPut: $(.
	aStream
		nextPutAll: rhs productionSymbol name;
		nextPutAll: ' : '.
	rhs collection
		with: items
		do: [ :symbol :value | 
			first
				ifFalse: [ aStream space ].
			first := false.
			aStream
				nextPutAll: symbol name;
				nextPutAll: ' = ';
				print: value ].
	aStream nextPut: $)
]

{ #category : #accessing }
SmaCCReducedItem >> rhs [
	^ rhs
]

{ #category : #accessing }
SmaCCReducedItem >> rhs: anObject [
	rhs := anObject
]

{ #category : #accessing }
SmaCCReducedItem >> sourceInterval [
	^ self startPosition
		ifNil: [ nil ]
		ifNotNil: [ :pos | pos to: self stopPosition ]
]

{ #category : #accessing }
SmaCCReducedItem >> startPosition [
	items do: [ :each | each startPosition ifNotNil: [ :int | ^ int ] ].
	^ nil
]

{ #category : #accessing }
SmaCCReducedItem >> stopPosition [
	items
		reverseDo: [ :each | each stopPosition ifNotNil: [ :int | ^ int ] ].
	^ nil
]
