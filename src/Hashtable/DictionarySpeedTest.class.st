Class {
	#name : #DictionarySpeedTest,
	#superclass : #Object,
	#instVars : [
		'stepsize',
		'testsize'
	],
	#category : #'Hashtable-Test'
}

{ #category : #finding }
DictionarySpeedTest class >> findBigOnes [
	"self findBigOnes"
	^(Set allSubclasses
		add: Set;
		yourself) in: [ :classes |
			(classes gather: [ :each | each allInstances])
				select: [ :each | each size > 4000 ] ]
]

{ #category : #replacing }
DictionarySpeedTest class >> replaceBigs: aClass with: anOtherClass [
	"self replaceBigs: WeakSet with: WeakHashSet"
	| new |
	(aClass allInstances select: [ :each | each size > 4000 ]) do: [ :each |
		new := anOtherClass new.
		new addAll: each.
		new become: each ].
]

{ #category : #finding }
DictionarySpeedTest class >> replaceMCInstances [
	"self replaceMCInstances"
	| oldSet newSet newSize oldSize |
	oldSet := MCDefinition classPool at: #Instances.
	newSet := HashSet new.
	oldSize := oldSet size.
	newSize := oldSet inject: 0 into: [ :s :each | s + 1].
	self inform: ' old size: ' , oldSize asString , ' new size: ' , newSize asString , ' '.
	"oldSet do: [ :each | newSet add: each ] displayingProgress: 'copying MCDefinition Instances'.
	 MCDefinition classPool at: #Instances put: newSet."
]

{ #category : #testing }
DictionarySpeedTest class >> testClass: aClass [
	| step test ord |
	step := 100.
	test := aClass new.

	[ test size >= 100000 ] whileFalse: [ 
		ord := OrderedCollection new: step.
		step timesRepeat: [
			test at: (ord add: Object new) put: nil ].
		Transcript show: test size; tab.
		Transcript show: [ 
			10 timesRepeat: [
				ord do: [ :each |
					test at: each ] ] ]
			timeToRun.
		Transcript cr ].
]

{ #category : #testing }
DictionarySpeedTest class >> testClasses [
	"DictionarySpeedTest testClasses"
	self new testClasses
]

{ #category : #testing }
DictionarySpeedTest class >> testDictonary [
	| step test ord |
	step := 100.
	test := Dictionary new.

	[ test size >= 100000 ] whileFalse: [ 
		ord := OrderedCollection new: step.
		step timesRepeat: [
			test at: (ord add: Object new) put: nil ].
		Transcript show: test size; tab.
		Transcript show: [ 
			10 timesRepeat: [
				ord do: [ :each |
					test at: each ] ] ]
			timeToRun.
		Transcript cr ].
]

{ #category : #testing }
DictionarySpeedTest class >> testObjects [
	"DictionarySpeedTest testObjects"
	self new testObjects
]

{ #category : #finding }
DictionarySpeedTest class >> testSizes: oldSet [
	"self testSizes: (MCDefinition classPool at: #Instances)"
	"self testSizes: (Symbol classPool at: #SymbolTable)"
	| newSize oldSize |
	oldSize := oldSet size.
	newSize := oldSet inject: 0 into: [ :s :each | s + 1].
	self inform: ' old size: ' , oldSize asString , ' new size: ' , newSize asString , ' '.
]

{ #category : #utility }
DictionarySpeedTest >> asSelector: aClass [
	^ ( 'test' , aClass name, '0n:' ) asSymbol
]

{ #category : #'initialize-release' }
DictionarySpeedTest >> initialize [
	super initialize.
	self stepsize: 100.
	self testsize: 10000.
]

{ #category : #accessing }
DictionarySpeedTest >> stepsize [
	^stepsize
]

{ #category : #accessing }
DictionarySpeedTest >> stepsize: anObject [
	stepsize := anObject
]

{ #category : #testing }
DictionarySpeedTest >> testClasses [
	| stream |
	self testDictionaryClasses do: [ :each |
		Transcript show: 'Testing: ' , each name asString ; cr.
		stream := FileStream fileNamed: each name , '.classdata' .
		self perform: #testDictionary:of:on:  withArguments: (Array with: each with: Object with: stream).
		stream close ].
	Transcript show: 'done' ; cr.
]

{ #category : #testing }
DictionarySpeedTest >> testDictionary: aDictionaryClass of: anObjectClass on: aStream [ 
	| test ord |
	test := aDictionaryClass new.
	[ test size >= self testsize] whileFalse: [
			ord := OrderedCollection new: self stepsize.
			self stepsize timesRepeat: [ 
				test at: ( ord add: anObjectClass new ) put: nil ].
			aStream
				nextPutAll: test size asString;
				tab.
			aStream nextPutAll:
				[
					10 timesRepeat: [ 
						ord do: [ :each | test at: each ] ]
				] timeToRun asString.
		aStream cr ]
]

{ #category : #accessing }
DictionarySpeedTest >> testDictionaryClasses [
	^Array
		with: Dictionary
		with: IdentityDictionary
		with: HashTable
		with: IdentityHashTable
]

{ #category : #accessing }
DictionarySpeedTest >> testObjectClasses [
	^Array
		with: Object
		with: PrimeObject
		"with: CVAutoincrementObject
		with: CIVAutoincrementObject
		with: RandomObject"
]

{ #category : #testing }
DictionarySpeedTest >> testObjects [
	| stream |
	self testObjectClasses do: [ :each |
		Transcript show: 'Testing: ' , each name asString ; cr.
		stream := FileStream fileNamed: each name , '.objectdata' .
		self perform: #testDictionary:of:on:  withArguments: (Array with: Dictionary with: each with: stream).
		stream close ].
	Transcript show: 'done' ; cr.
]

{ #category : #accessing }
DictionarySpeedTest >> testsize [
	^testsize
]

{ #category : #accessing }
DictionarySpeedTest >> testsize: anObject [
	testsize := anObject
]
