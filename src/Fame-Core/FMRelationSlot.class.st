Class {
	#name : #FMRelationSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'targetClass',
		'inverseName',
		'inverseSlot',
		'moosePropertyDictionary'
	],
	#category : #'Fame-Core-Slots'
}

{ #category : #'instance creation' }
FMRelationSlot class >> named: aSymbol inverse: anInverseSymbol inClass: aTargetClassOrSymbol [ 

	^(super named: aSymbol) inverse: anInverseSymbol inClass: aTargetClassOrSymbol 
]

{ #category : #comparing }
FMRelationSlot >> = anObject [ 

	^super = anObject and: [ 
		self targetClassName = anObject targetClassName and: [ 
			inverseName = anObject inverseName ] ]

	
]

{ #category : #internal }
FMRelationSlot >> addAssociationFrom: ownerObject to: otherObject [
	"A new reference from <ownerObject> to <otherObject> is created. Here we update the other 
	side of the association. If the other side is a ToOne association this means that an other
	association may have to be removed first."

	| realInverseSlot |
	realInverseSlot := self realInverseSlotFor: otherObject.

	realInverseSlot isToOneSlot
		ifTrue: [ (realInverseSlot read: otherObject) ifNotNil: [ :oldObject | realInverseSlot removeAssociationFrom: otherObject to: oldObject ].
			realInverseSlot writeInverse: ownerObject to: otherObject ]
		ifFalse: [ (realInverseSlot read: otherObject) inverseAdd: ownerObject ]
]

{ #category : #accessing }
FMRelationSlot >> argumentAt: n [
	"only for compatibility with Fame pragmas"

	self assert: n = 1.
	^ self name asSymbol
]

{ #category : #internal }
FMRelationSlot >> checkValue: aValue [

	"(aValue isKindOf: self targetClass)
		ifFalse: [ self error: 'Invalid value' ]."
]

{ #category : #'code generation' }
FMRelationSlot >> emitStore: aMethodBuilder [
	| tempName |
	tempName := Object new.
	aMethodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushReceiver;
		pushLiteralVariable: #slot -> self;
		pushTemp: tempName;
		send: #writeSlot:value:
]

{ #category : #'code generation' }
FMRelationSlot >> emitValue: aMethodBuilder [
	aMethodBuilder
		pushLiteralVariable: #slot -> self;
		pushReceiver;
		send: #read:
]

{ #category : #testing }
FMRelationSlot >> hasInverse [

	^inverseName notNil
]

{ #category : #comparing }
FMRelationSlot >> hasSameDefinitionAs: otherSlot [

	^ (super hasSameDefinitionAs: otherSlot) 
		and: [ self targetClassName = otherSlot targetClassName 
		and: [ inverseName = otherSlot inverseName ] ]
]

{ #category : #comparing }
FMRelationSlot >> hash [
	^ ((self species hash bitXor: self name hash) 
			bitXor: (self index ifNil: [ 0 ])) 
				bitXor: self targetClassName hash
]

{ #category : #initialization }
FMRelationSlot >> inClass: aTargetClassOrSymbol [

	targetClass := aTargetClassOrSymbol
]

{ #category : #initialization }
FMRelationSlot >> inverse: anInverseSymbol inClass: aTargetClassOrSymbol [

	self inClass: aTargetClassOrSymbol.
	inverseName := anInverseSymbol.
]

{ #category : #accessing }
FMRelationSlot >> inverseName [

	^inverseName
]

{ #category : #accessing }
FMRelationSlot >> inverseSlot [

	^inverseSlot ifNil: [ self linkUp. inverseSlot ]
]

{ #category : #testing }
FMRelationSlot >> isAccessedIn: aMethod [ 

	^ aMethod allLiterals includes: self
]

{ #category : #testing }
FMRelationSlot >> isFMRelationSlot [

	^ true
]

{ #category : #testing }
FMRelationSlot >> isFameSlot [
	^ true
]

{ #category : #testing }
FMRelationSlot >> isReadIn: aMethod [ 

	^ aMethod allLiterals includes: self
]

{ #category : #testing }
FMRelationSlot >> isToOneSlot [

	^false
]

{ #category : #testing }
FMRelationSlot >> isWrittenIn: aMethod [ 

	^ aMethod allLiterals includes: self
]

{ #category : #initialization }
FMRelationSlot >> lazyInitializationFor: anObject slotValue: aSlotValue [

	^ aSlotValue
]

{ #category : #initialization }
FMRelationSlot >> linkUp [

	inverseSlot := self targetClass slotNamed: inverseName.
	(self inverseSlot isFMRelationSlot)
		ifFalse: [ self error: 'Invalid association: ... ' ].
		
	self inverseSlot inverseName = self name
		ifFalse: [ self error: 'Invalid association: inverse names do not match' ].
]

{ #category : #internal }
FMRelationSlot >> moosePropertyDictionary [

	^ moosePropertyDictionary ifNil: [ moosePropertyDictionary := Dictionary new ].
]

{ #category : #internal }
FMRelationSlot >> moosePropertyFor: anOwningClassName multivalued: aBoolean [

	| mooseProperty needsToBeSet |
	
	needsToBeSet := false.
	
	mooseProperty := self moosePropertyDictionary at: anOwningClassName ifAbsentPut: [
		needsToBeSet := true.
		FM3PropertyDescription new ].
	
	needsToBeSet ifTrue: [ 
		mooseProperty name: self name asString.
		mooseProperty setImplementingSelector: self name. "should be a link to slot"

		mooseProperty isMultivalued: aBoolean.
		mooseProperty isDerived: true.
		
		mooseProperty privOpposite: self inverseSlot mooseProperty ].
	
	^ mooseProperty.

		
]

{ #category : #printing }
FMRelationSlot >> printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name.
	aStream
		nextPutAll: ' type: ';
		store: self targetClassName.
	self hasInverse 
		ifTrue: [ 
			aStream
				nextPutAll: ' opposite: ';
				store: inverseName ].

]

{ #category : #internal }
FMRelationSlot >> read: anObject [

	| slotValue | 
	
	slotValue := thisContext object: anObject instVarAt: index.
	^ slotValue
	"^ self lazyInitializationFor: anObject slotValue: slotValue".
	

]

{ #category : #accessing }
FMRelationSlot >> realInverseSlotFor: anObject [
	^ anObject class slotNamed: self inverseName
]

{ #category : #internal }
FMRelationSlot >> removeAssociationFrom: ownerObject to: otherObject [
	"A reference from <ownerObject> to <otherObject> is removed. Here we update the other 
	side of the association. If the other side is a ToOne association set the value to nil,
	for ToMany associations remove <ownerObject> from the collection." 

	| realInverseSlot |
	
	realInverseSlot := (self realInverseSlotFor: otherObject).

	realInverseSlot isToOneSlot
		ifTrue: [ realInverseSlot writeInverse: nil to: otherObject ]
		ifFalse: [ (realInverseSlot read: otherObject) inverseRemove: ownerObject ]
]

{ #category : #internal }
FMRelationSlot >> resetMooseProperty [

	moosePropertyDictionary := nil.
]

{ #category : #accessing }
FMRelationSlot >> targetClass [

	targetClass isSymbol
		ifTrue: [ 
			targetClass := self class environment at: targetClass 
				ifAbsent: [ self error: 'Cannot find class ', targetClass printString ] ].
	
	^targetClass
]

{ #category : #accessing }
FMRelationSlot >> targetClassName [

	^targetClass isSymbol
		ifTrue: [ targetClass ]
		ifFalse: [ targetClass name ]
]

{ #category : #initialization }
FMRelationSlot >> type: aTargetClassOrSymbol opposite: anInverseSymbol [

	self inClass: aTargetClassOrSymbol.
	inverseName := anInverseSymbol.
]

{ #category : #accessing }
FMRelationSlot >> write: aValue to: anObject [

	self read: anObject. "to invoke lazy initialization"
	^ super write: aValue to: anObject
]
