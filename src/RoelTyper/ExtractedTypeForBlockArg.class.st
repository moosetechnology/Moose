Class {
	#name : #ExtractedTypeForBlockArg,
	#superclass : #AbstractType,
	#instVars : [
		'lives',
		'compiledMethod'
	],
	#category : #'RoelTyper-Core'
}

{ #category : #'instance creation' }
ExtractedTypeForBlockArg class >> forOffset: offset ofCompiledMethod: aCompiledMethod inClass: aClass [
	^self new
		tempOffset: offset;
		ivarClass: aClass;
		compiledMethod: aCompiledMethod;
		yourself
]

{ #category : #accessing }
ExtractedTypeForBlockArg >> asBlockArgInTypeCollector: aTypeCollector [
	self newLive
]

{ #category : #accessing }
ExtractedTypeForBlockArg >> compiledMethod: aCompiledMethod [
	compiledMethod := aCompiledMethod
]

{ #category : #'system primitives' }
ExtractedTypeForBlockArg >> doesNotUnderstand: aMessage [
	^aMessage sendTo: self liveExtractType 
]

{ #category : #initialization }
ExtractedTypeForBlockArg >> initialize [
	super initialize.
	lives := OrderedCollection with: (ExtractedTypeForTmp new)
]

{ #category : #'private-accessing' }
ExtractedTypeForBlockArg >> interface [
	^(lives inject: Set new into: [:ord :et | ord addAll: (et interface); yourself ]) asOrderedCollection
]

{ #category : #private }
ExtractedTypeForBlockArg >> liveExtractType [
	^lives last
]

{ #category : #'instance creation' }
ExtractedTypeForBlockArg >> newLive [
	^lives addLast: (ExtractedTypeForTmp new)
]

{ #category : #printing }
ExtractedTypeForBlockArg >> printOn: aStream [
	aStream
		nextPutAll: 'Block arg';
		cr;
		cr.
	lives
		doWithIndex: [ :et :index | 
			aStream
				nextPutAll: 'Activation ';
				print: index;
				nextPutAll: ': '.
			et printOn: aStream.
			aStream cr ]
]

{ #category : #accessing }
ExtractedTypeForBlockArg >> tempOffset: anOffset [
	ivarName := anOffset
]

{ #category : #accessing }
ExtractedTypeForBlockArg >> types [
	|types|
	types := IdentitySet new.
	lives do: [:et | types addAll: (et mergeTypes)].
	^types asOrderedCollection
]
