Class {
	#name : #SmaCCIntegerSet,
	#superclass : #Collection,
	#instVars : [
		'start',
		'run',
		'data',
		'normalized'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCIntegerSet class >> new: aSize [
	^ self new
]

{ #category : #'instance creation' }
SmaCCIntegerSet class >> withAll: aCollection [
	self == aCollection class
		ifTrue: [ ^ aCollection copy ].
	^ super withAll: aCollection
]

{ #category : #comparing }
SmaCCIntegerSet >> < aSmaCCIntegerCollection [
	| otherData otherRun myData myRun compare |
	self isEmpty
		ifTrue: [ ^ aSmaCCIntegerCollection isEmpty not ].
	aSmaCCIntegerCollection isEmpty
		ifTrue: [ ^ false ].
	self normalize.
	aSmaCCIntegerCollection normalize.
	otherData := aSmaCCIntegerCollection data.
	otherRun := aSmaCCIntegerCollection run.
	myData := data.
	myRun := run.
	[ myRun < otherRun ]
		whileTrue: [ otherRun := self nextRunFrom: otherRun.
			otherData := self reduceData: otherData ].
	[ otherRun < myRun ]
		whileTrue: [ myRun := self nextRunFrom: myRun.
			myData := self reduceData: myData ].
	compare := self
		compareData: myData
		to: otherData
		hasMore: [ :isMine | 
			isMine
				ifTrue: [ run > aSmaCCIntegerCollection run ]
				ifFalse: [ run < aSmaCCIntegerCollection run ] ].
	compare = 0
		ifTrue: [ ^ run < aSmaCCIntegerCollection run ].
	compare < 0
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #comparing }
SmaCCIntegerSet >> <= aSmaCCIntegerCollection [
	^ (aSmaCCIntegerCollection < self) not
]

{ #category : #comparing }
SmaCCIntegerSet >> = anObject [
	self class = anObject class
		ifFalse: [ ^ false ].
	self normalize.
	anObject normalize.
	^ self start = anObject start and: [ self run = anObject run and: [ self data = anObject data ] ]
]

{ #category : #comparing }
SmaCCIntegerSet >> > aSmaCCIntegerCollection [
	^ aSmaCCIntegerCollection < self
]

{ #category : #comparing }
SmaCCIntegerSet >> >= aSmaCCIntegerCollection [
	^ (self < aSmaCCIntegerCollection) not
]

{ #category : #adding }
SmaCCIntegerSet >> add: anInteger [
	| newData |
	[ anInteger < start ]
		whileTrue:
			[ run := run * self defaultRunSize.
			start := start - run.
			data == 0
				ifFalse:
					[ newData := Array new: self defaultRunSize withAll: 0.
					newData at: 2 put: data.
					data := newData ] ].
	[ self defaultRunSize * run + start <= anInteger ]
		whileTrue:
			[ run := run * self defaultRunSize.
			data == 0
				ifFalse:
					[ newData := Array new: self defaultRunSize withAll: 0.
					newData at: 1 put: data.
					data := newData ] ].
	data := self
		add: anInteger
		to: data
		startingAt: start
		withRun: run.
	normalized := false.
	^ anInteger
]

{ #category : #private }
SmaCCIntegerSet >> add: anInteger to: currentData startingAt: currentStart withRun: currentRun [
	| newData isBits offset value |
	currentData == 1
		ifTrue: [ ^ 1 ].
	isBits := currentRun = self byteSize.
	newData := currentData == 0
		ifTrue: [ (isBits
				ifTrue: [ ByteArray ]
				ifFalse: [ Array ]) new: self defaultRunSize withAll: 0 ]
		ifFalse: [ currentData ].
	offset := (anInteger - currentStart) // currentRun + 1.
	^ isBits
		ifTrue: [ newData at: offset put: (value := (newData at: offset) bitOr: (1 bitShift: (anInteger - currentStart) \\ currentRun)).
			(value == 16rFF and: [ newData allSatisfy: [ :each | each == 16rFF ] ])
				ifTrue: [ 1 ]
				ifFalse: [ newData ] ]
		ifFalse: [ newData
				at: offset
				put:
					(value := self
						add: anInteger
						to: (newData at: offset)
						startingAt: currentStart + ((offset - 1) * currentRun)
						withRun: (self nextRunFrom: currentRun)).
			(value == 1 and: [ newData allSatisfy: [ :each | each == 1 ] ])
				ifTrue: [ 1 ]
				ifFalse: [ newData ] ]
]

{ #category : #adding }
SmaCCIntegerSet >> addAll: aCollection [
	| otherData otherRun tempData |
	(self class == aCollection class and: [ start = aCollection start ])
		ifFalse: [ ^ super addAll: aCollection ].
	data == 0
		ifTrue: [ data := self copyData: aCollection data.
			run := aCollection run ]
		ifFalse: [ otherRun := aCollection run.
			otherData := aCollection data.
			[ run < otherRun ]
				whileTrue: [ run := run * self defaultRunSize.
					tempData := Array new: self defaultRunSize withAll: 0.
					tempData at: 1 put: data.
					data := tempData ].
			[ run > otherRun ]
				whileTrue: [ otherRun := otherRun * self defaultRunSize.
					tempData := Array new: self defaultRunSize withAll: 0.
					tempData at: 1 put: otherData.
					otherData := tempData ].
			data := self merge: data with: otherData ].
	normalized := false.
	^ aCollection
]

{ #category : #private }
SmaCCIntegerSet >> byteSize [
	^ 8
]

{ #category : #private }
SmaCCIntegerSet >> compareByte: myByte to: otherByte hasMore: aBlock [
	| mine other |
	myByte == otherByte
		ifTrue: [ ^ 0 ].
	myByte == 0
		ifTrue: [ ^ (aBlock value: true)
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	otherByte == 0
		ifTrue: [ ^ (aBlock value: false)
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ].
	mine := myByte.
	other := otherByte.
	[ mine odd = other odd ]
		whileTrue: [ mine := mine bitShift: -1.
			other := other bitShift: -1 ].
	^ mine odd
		ifTrue: [ (other ~~ 0 or: [ aBlock value: false ])
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ]
		ifFalse: [ (mine ~~ 0 or: [ aBlock value: true ])
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ]
]

{ #category : #private }
SmaCCIntegerSet >> compareData: myData to: otherData hasMore: aBlock [
	| value |
	myData == 0
		ifTrue: [ otherData == 0
				ifTrue: [ ^ 0 ].
			^ (aBlock value: true)
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	myData == 1
		ifTrue: [ otherData == 1
				ifTrue: [ ^ 0 ].
			otherData == 0
				ifTrue: [ ^ (aBlock value: false)
						ifTrue: [ -1 ]
						ifFalse: [ 1 ] ].
			^ ((self endsWithZeros: otherData) and: [ (aBlock value: false) not ])
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	otherData == 0
		ifTrue: [ ^ (aBlock value: false)
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ].
	otherData == 1
		ifTrue: [ ^ ((self endsWithZeros: myData) and: [ (aBlock value: true) not ])
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ].
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				value := self
					compareByte: (myData at: i)
					to: (otherData at: i)
					hasMore: [ :isMine | 
						(self
							hasMore:
								(isMine
									ifTrue: [ myData ]
									ifFalse: [ otherData ])
							after: i) or: [ aBlock value: isMine ] ].
				value ~~ 0
					ifTrue: [ ^ value ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				value := self
					compareData: (myData at: i)
					to: (otherData at: i)
					hasMore: [ :isMine | 
						(self
							hasMore:
								(isMine
									ifTrue: [ myData ]
									ifFalse: [ otherData ])
							after: i) or: [ aBlock value: isMine ] ].
				value ~~ 0
					ifTrue: [ ^ value ] ] ].
	^ 0
]

{ #category : #private }
SmaCCIntegerSet >> copyData: anObject [
	| copy |
	^ (anObject isKindOf: Collection)
		ifTrue:
			[ copy := anObject copy.
			1 to: copy size do: [ :i | copy at: i put: (self copyData: (copy at: i)) ].
			copy ]
		ifFalse: [ anObject ]
]

{ #category : #private }
SmaCCIntegerSet >> countBits: anInteger [
	| count current |
	count := 0.
	current := anInteger.
	[ current = 0 ]
		whileFalse: [ (current bitAnd: 1) == 1
				ifTrue: [ count := count + 1 ].
			current := current bitShift: -1 ].
	^ count
]

{ #category : #private }
SmaCCIntegerSet >> data [
	^ data
]

{ #category : #private }
SmaCCIntegerSet >> defaultRunSize [
	^ 32
]

{ #category : #enumerating }
SmaCCIntegerSet >> do: aBlock [
	self
		do: aBlock
		over: data
		startingAt: start
		withRun: run
]

{ #category : #private }
SmaCCIntegerSet >> do: aBlock over: currentData startingAt: currentStart withRun: currentRun [
	| index offset nextRun |
	currentData == 0
		ifTrue: [ ^ self ].
	currentData == 1
		ifTrue:
			[ ^ currentStart to: currentStart + (currentRun * self defaultRunSize) - 1
			do: [ :i | aBlock value: i ] ].
	index := currentStart.
	currentRun = self byteSize
		ifTrue:
			[ currentData
				do:
					[ :each | 
					| bits |
					bits := each.
					offset := 0.
					[ bits = 0 ]
						whileFalse:
							[ bits odd
								ifTrue: [ aBlock value: offset + index ].
							offset := offset + 1.
							bits := bits bitShift: -1 ].
					index := index + currentRun ].
			^ self ].
	nextRun := self nextRunFrom: currentRun.
	currentData
		do:
			[ :each | 
			self
				do: aBlock
				over: each
				startingAt: index
				withRun: nextRun.
			index := index + currentRun ]
]

{ #category : #private }
SmaCCIntegerSet >> endsWithZeros: aCollection [
	| index isBytes all value |
	isBytes := aCollection isKindOf: ByteArray.
	index := 1.
	all := isBytes
		ifTrue: [ 255 ]
		ifFalse: [ 1 ].
	[ index <= aCollection size and: [ (aCollection at: index) = all ] ] whileTrue: [ index := index + 1 ].
	index > aCollection size
		ifTrue: [ ^ true ].
	index + 1 to: aCollection size do: [ :i | 
		(aCollection at: i) ~~ 0
			ifTrue: [ ^ false ] ].
	value := aCollection at: index.
	value == 0
		ifTrue: [ ^ true ].
	^ isBytes
		ifTrue: [ #[2r1 2r11 2r111 2r1111 2r11111 2r111111 2r1111111] includes: value ]
		ifFalse: [ self endsWithZeros: value ]
]

{ #category : #accessing }
SmaCCIntegerSet >> first [
	self do: [ :each | ^ each ].
	self error: 'Collection is empty'
]

{ #category : #private }
SmaCCIntegerSet >> hasMore: aCollection after: index [
	^ ((index + 1 to: aCollection size) allSatisfy: [ :i | (aCollection at: i) == 0 ]) not
]

{ #category : #comparing }
SmaCCIntegerSet >> hash [
	self normalize.
	^ data hash bitXor: self size hash
]

{ #category : #testing }
SmaCCIntegerSet >> includes: anInteger [
	anInteger < start
		ifTrue: [ ^ false ].
	self defaultRunSize * run + start <= anInteger
		ifTrue: [ ^ false ].
	^ self
		includes: anInteger
		in: data
		startingAt: start
		withRun: run
]

{ #category : #private }
SmaCCIntegerSet >> includes: anInteger in: currentData startingAt: currentStart withRun: currentRun [
	| isBits offset |
	currentData == 1
		ifTrue: [ ^ true ].
	currentData == 0
		ifTrue: [ ^ false ].
	isBits := currentRun = self byteSize.
	offset := (anInteger - currentStart) // currentRun + 1.
	^ isBits
		ifTrue: [ ((currentData at: offset) bitAnd: (1 bitShift: (anInteger - currentStart) \\ currentRun)) ~~ 0 ]
		ifFalse: [ self
				includes: anInteger
				in: (currentData at: offset)
				startingAt: currentStart + ((offset - 1) * currentRun)
				withRun: (self nextRunFrom: currentRun) ]
]

{ #category : #'initialize-release' }
SmaCCIntegerSet >> initialize [
	start := 0.
	run := self byteSize.
	data := 0.
	normalized := true
]

{ #category : #private }
SmaCCIntegerSet >> intersect: myData with: otherData [
	| value includeNone |
	(myData == 0 or: [ otherData == 1 ])
		ifTrue: [ ^ myData ].
	(myData == 1 or: [ otherData == 0 ])
		ifTrue: [ ^ self copyData: otherData ].
	includeNone := true.
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := (myData at: i) bitAnd: (otherData at: i)).
				includeNone := includeNone and: [ value == 0 ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := self intersect: (myData at: i) with: (otherData at: i)).
				includeNone := includeNone and: [ value == 0 ] ] ].
	includeNone
		ifTrue: [ ^ 0 ].
	^ myData
]

{ #category : #private }
SmaCCIntegerSet >> invertData: otherData [
	otherData == 0
		ifTrue: [ ^ 1 ].
	otherData == 1
		ifTrue: [ ^ 0 ].
	^ (otherData isKindOf: ByteArray)
		ifTrue: [ otherData collect: [ :each | each bitInvert bitAnd: 16rFF ] ]
		ifFalse: [ otherData collect: [ :each | self invertData: each ] ]
]

{ #category : #testing }
SmaCCIntegerSet >> isEmpty [
	self normalize.
	^ data == 0
]

{ #category : #private }
SmaCCIntegerSet >> merge: myData with: otherData [
	| value includeAll |
	(myData == 0 or: [ otherData == 1 ])
		ifTrue: [ ^ self copyData: otherData ].
	(myData == 1 or: [ otherData == 0 ])
		ifTrue: [ ^ myData ].
	includeAll := true.
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := (myData at: i) bitOr: (otherData at: i)).
				includeAll := includeAll and: [ value == 255 ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := self merge: (myData at: i) with: (otherData at: i)).
				includeAll := includeAll and: [ value == 1 ] ] ].
	includeAll
		ifTrue: [ ^ 1 ].
	^ myData
]

{ #category : #private }
SmaCCIntegerSet >> nextRunFrom: currentRun [
	^ currentRun // self defaultRunSize
]

{ #category : #converting }
SmaCCIntegerSet >> normalize [
	normalized
		ifTrue: [ ^ self ].
	normalized := true.
	data := self normalizeData: data.
	[ data = 0
		ifTrue: [ ^ run := self defaultRunSize ].
	data = 1
		ifTrue: [ ^ self ].
	run > self defaultRunSize
		ifFalse: [ ^ self ].
	2 to: data size do: [ :i | 
		(data at: i) = 0
			ifFalse: [ ^ self ] ].
	data := data first.
	run := self nextRunFrom: run ] repeat
]

{ #category : #private }
SmaCCIntegerSet >> normalizeData: oldData [
	| value allAreIntegers |
	(oldData isKindOf: ByteArray)
		ifTrue: [ value := oldData first.
			(value == 0 or: [ value == 255 ])
				ifFalse: [ ^ oldData ].
			2 to: oldData size do: [ :i | 
				(oldData at: i) = value
					ifFalse: [ ^ oldData ] ].
			^ value == 255
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ].
	(oldData isKindOf: Array)
		ifTrue: [ allAreIntegers := true.
			1 to: oldData size do: [ :i | 
				oldData at: i put: (value := self normalizeData: (oldData at: i)).
				allAreIntegers := allAreIntegers and: [ value isInteger ] ].
			allAreIntegers
				ifTrue: [ (oldData allSatisfy: [ :each | each = value ])
						ifTrue: [ ^ value ] ] ].
	^ oldData
]

{ #category : #copying }
SmaCCIntegerSet >> postCopy [
	super postCopy.
	data := self copyData: data
]

{ #category : #private }
SmaCCIntegerSet >> privateIntersect: aCollection [
	| otherRun otherData |
	otherRun := aCollection run.
	otherData := aCollection data.
	[ run > otherRun ]
		whileTrue: [ run := self nextRunFrom: run.
			data := self reduceData: data ].
	[ otherRun > run ]
		whileTrue: [ otherRun := self nextRunFrom: otherRun.
			otherData := self reduceData: otherData ].
	data := self intersect: data with: otherData.
	normalized := false.
	^ self
]

{ #category : #private }
SmaCCIntegerSet >> reduceData: myData [
	^ myData isInteger
		ifTrue: [ myData ]
		ifFalse: [ myData first ]
]

{ #category : #private }
SmaCCIntegerSet >> remove: anInteger from: currentData startingAt: currentStart withRun: currentRun [
	| newData isBits offset value |
	currentData == 0
		ifTrue: [ ^ 0 ].
	isBits := currentRun = self byteSize.
	newData := currentData == 1
		ifTrue: [ isBits
				ifTrue: [ ByteArray new: self defaultRunSize withAll: 16rFF ]
				ifFalse: [ Array new: self defaultRunSize withAll: 1 ] ]
		ifFalse: [ currentData ].
	offset := (anInteger - currentStart) // currentRun + 1.
	isBits
		ifTrue: [ newData at: offset put: (value := (newData at: offset) bitAt: (anInteger - currentStart) \\ currentRun + 1 put: 0) ]
		ifFalse: [ newData
				at: offset
				put:
					(value := self
						remove: anInteger
						from: (newData at: offset)
						startingAt: currentStart + ((offset - 1) * currentRun)
						withRun: (self nextRunFrom: currentRun)) ].
	^ (value = 0 and: [ newData allSatisfy: [ :each | each == 0 ] ])
		ifTrue: [ 0 ]
		ifFalse: [ newData ]
]

{ #category : #removing }
SmaCCIntegerSet >> remove: anInteger ifAbsent: aBlock [
	(self includes: anInteger)
		ifFalse: [ ^ aBlock value ].
	data := self
		remove: anInteger
		from: data
		startingAt: start
		withRun: run.
	normalized := false.
	^ anInteger
]

{ #category : #private }
SmaCCIntegerSet >> removeData: otherData from: myData [
	| includeNone value |
	(myData == 0 or: [ otherData == 1 ])
		ifTrue: [ ^ 0 ].
	otherData == 0
		ifTrue: [ ^ myData ].
	myData = 1
		ifTrue: [ ^ self invertData: otherData ].
	includeNone := true.
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := (myData at: i) bitAnd: (otherData at: i) bitInvert).
				includeNone := includeNone and: [ value == 0 ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := self removeData: (otherData at: i) from: (myData at: i)).
				includeNone := includeNone and: [ value == 0 ] ] ].
	includeNone
		ifTrue: [ ^ 0 ].
	^ myData
]

{ #category : #private }
SmaCCIntegerSet >> run [
	^ run
]

{ #category : #enumerating }
SmaCCIntegerSet >> select: aBlock [
	| selected |
	selected := self copy.
	self
		do: [ :each | 
			(aBlock value: each)
				ifFalse: [ selected remove: each ] ].
	selected normalize.
	^ selected
]

{ #category : #accessing }
SmaCCIntegerSet >> size [
	^ self sizeOf: data withRun: run
]

{ #category : #private }
SmaCCIntegerSet >> sizeOf: currentData withRun: currentRun [
	| nextRun |
	currentData == 0
		ifTrue: [ ^ 0 ].
	currentData == 1
		ifTrue: [ ^ currentRun * self defaultRunSize ].
	currentRun == self byteSize
		ifTrue: [ ^ currentData inject: 0 into: [ :sum :each | sum + (self countBits: each) ] ]
		ifFalse: [ nextRun := self nextRunFrom: currentRun.
			^ currentData inject: 0 into: [ :sum :each | sum + (self sizeOf: each withRun: nextRun) ] ]
]

{ #category : #enumerating }
SmaCCIntegerSet >> smaccIntersect: aCollection [
	aCollection class == self class
		ifFalse: [ ^ super smaccIntersect: aCollection ].
	self normalize.
	aCollection normalize.
	(self == aCollection or: [ data == 0 or: [ aCollection data = 1 and: [ aCollection run >= run ] ] ])
		ifTrue: [ ^ self copy ].
	(aCollection data == 0 or: [ data = 1 and: [ run >= aCollection run ] ])
		ifTrue: [ ^ aCollection copy ].
	^ self copy privateIntersect: aCollection
]

{ #category : #removing }
SmaCCIntegerSet >> smaccRemoveAll: aCollection [
	| otherRun otherData tempData |
	self class == aCollection class
		ifFalse: [ ^ super smaccRemoveAll: aCollection ].
	data == 0
		ifTrue: [ ^ self ].
	otherRun := aCollection run.
	otherData := aCollection data.
	[ run < otherRun ]
		whileTrue: [ otherRun := self nextRunFrom: otherRun.
			otherData := self reduceData: otherData ].
	[ run > otherRun ]
		whileTrue: [ otherRun := otherRun * self defaultRunSize.
			tempData := Array new: self defaultRunSize withAll: 0.
			tempData at: 1 put: otherData.
			otherData := tempData ].
	data := self removeData: otherData from: data.
	normalized := false.
	^ aCollection
]

{ #category : #private }
SmaCCIntegerSet >> start [
	^ start
]
