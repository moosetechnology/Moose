Class {
	#name : #DudeBooleanVector,
	#superclass : #MalVector,
	#type : #bytes,
	#category : #'SmallDude-Utils'
}

{ #category : #'initialize-release' }
DudeBooleanVector class >> new: size [ 
	 
	^(self basicNew: size) 
		clearAll; 
		yourself
]

{ #category : #accessing }
DudeBooleanVector >> at: index [ 
	 
	^self isTrueAt: index
]

{ #category : #accessing }
DudeBooleanVector >> at: index put: aBoolean [ 
	 
	aBoolean 
		ifTrue: [self putTrueAt: index] 
		ifFalse: [self putFalseAt: index]
]

{ #category : #accessing }
DudeBooleanVector >> clearAll [ 
	 
	1 
		to: self basicSize 
		do: [:index | self basicAt: index put: 0]
]

{ #category : #accessing }
DudeBooleanVector >> isTrueAt: index [ 
	 
	^(self basicAt: index) == 1
]

{ #category : #accessing }
DudeBooleanVector >> putFalseAt: index [ 
	 
	self basicAt: index put: 0
]

{ #category : #accessing }
DudeBooleanVector >> putTrueAt: index [ 
	 
	self basicAt: index put: 1
]

{ #category : #accessing }
DudeBooleanVector >> size [ 
	 
	^self basicSize
]

{ #category : #accessing }
DudeBooleanVector >> withContinuos: fragmentKind fragmentsOfMinSize: minSize do: aBlock [ 
	 
	| index size | 
	index := minSize. 
	size := self size. 
	[index <= size] 
		whileTrue: 
			[(self isTrueAt: index) = fragmentKind 
				ifTrue: 
					[| currentSize last start end | 
					currentSize := 1. 
					last := fragmentKind.	"backword search" 
					[currentSize < minSize and: [last = fragmentKind]] 
						whileTrue: 
							[last := self isTrueAt: index - currentSize. 
							currentSize := currentSize + 1]. 
					start := index - currentSize 
						+ 
							(last = fragmentKind 
								ifTrue: [1] 
								ifFalse: [2]). 
					last := fragmentKind.	"forward search" 
					[index < size and: [last = fragmentKind]] 
						whileTrue: 
							[index := index + 1. 
							last := self isTrueAt: index]. 
					end := index 
						- 
							(last = fragmentKind 
								ifTrue: [0] 
								ifFalse: [1]). 
					currentSize := end - start + 1. 
					currentSize >= minSize ifTrue: [aBlock value: start value: end]]. 
			index := index + minSize]
]
