"
Description
--------------------

I am an abstract slot used to declare fame properties for a class.
The declared properties with my subclasses must have an opposite.

A relation slot will have:
- A name which is the name of the property
- A type which is the type of the property 
- An inverse name which is the name of the opposite property.

My sublasses will define everything related to the cardinality of the relation side.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	inverseName:		<aString>		The name of the opposite slot.
	inverseSlot:		<aSlot>
	targetClass:		<aClass>

"
Class {
	#name : #FMRelationSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'targetClass',
		'inverseName'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #'instance creation' }
FMRelationSlot class >> named: aSymbol inverse: anInverseSymbol inClass: aTargetClassOrSymbol [ 

	^(super named: aSymbol) inverse: anInverseSymbol inClass: aTargetClassOrSymbol 
]

{ #category : #comparing }
FMRelationSlot >> = anObject [
	^ super = anObject and: [ self targetClassName = anObject targetClassName and: [ inverseName = anObject inverseName ] ]
]

{ #category : #internal }
FMRelationSlot >> addAssociationFrom: ownerObject to: otherObject [
	"A new reference from <ownerObject> to <otherObject> is created. Here we update the other 
	side of the association. If the other side is a ToOne association this means that an other
	association may have to be removed first."

	| realInverseSlot |
	realInverseSlot := self realInverseSlotFor: otherObject.

	realInverseSlot isToOne
		ifTrue: [ (realInverseSlot read: otherObject) ifNotNil: [ :oldObject | realInverseSlot removeAssociationFrom: otherObject to: oldObject ].
			realInverseSlot writeInverse: ownerObject to: otherObject ]
		ifFalse: [ (realInverseSlot read: otherObject) inverseAdd: ownerObject ]
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
	^ inverseName isNotNil
]

{ #category : #comparing }
FMRelationSlot >> hasSameDefinitionAs: otherSlot [
	^ (super hasSameDefinitionAs: otherSlot)
		and: [ self targetClassName = otherSlot targetClassName
			and: [ inverseName = otherSlot inverseName ] ]
]

{ #category : #comparing }
FMRelationSlot >> hash [
	^ (super hash bitXor: self targetClassName hash) bitXor: inverseName hash
]

{ #category : #initialization }
FMRelationSlot >> inClass: aTargetClassOrSymbol [
	targetClass := aTargetClassOrSymbol
]

{ #category : #initialization }
FMRelationSlot >> inverse: anInverseSymbol inClass: aTargetClassOrSymbol [
	self inClass: aTargetClassOrSymbol.
	inverseName := anInverseSymbol
]

{ #category : #accessing }
FMRelationSlot >> inverseName [
	^ inverseName
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
FMRelationSlot >> isToMany [
	^ self isToOne not
]

{ #category : #testing }
FMRelationSlot >> isToOne [
	^ false
]

{ #category : #testing }
FMRelationSlot >> isWrittenIn: aMethod [
	^ aMethod allLiterals includes: self
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
		ifTrue: [ aStream
				nextPutAll: ' opposite: ';
				store: inverseName ]
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
	realInverseSlot := self realInverseSlotFor: otherObject.

	realInverseSlot isToOne
		ifTrue: [ realInverseSlot writeInverse: nil to: otherObject ]
		ifFalse: [ (realInverseSlot read: otherObject) inverseRemove: ownerObject ]
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
	^ targetClass isSymbol ifTrue: [ targetClass ] ifFalse: [ targetClass name ]
]

{ #category : #testing }
FMRelationSlot >> type: aTargetClassOrSymbol opposite: anInverseSymbol [
	self inClass: aTargetClassOrSymbol.
	inverseName := anInverseSymbol
]
