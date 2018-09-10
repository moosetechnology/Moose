Class {
	#name : #FamixJavaInvocation,
	#superclass : #FamixJavaAssociation,
	#traits : 'FamixTInvocation + FamixTWithSignature',
	#classTraits : 'FamixTInvocation classTrait + FamixTWithSignature classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInvocation class >> annotation [

	<MSEClass: #Invocation super: #FamixJavaAssociation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaInvocation class >> generatedSlotNames [
	<generated>
	'FamixJavaInvocation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaInvocation class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocation FamixTWithSignature)
]

{ #category : #meta }
FamixJavaInvocation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> accept: aVisitor [

	aVisitor visitInvocation: self
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> copyFrom: anEntity within: aVisitor [
	super copyFrom: anEntity within: aVisitor.
	self sender: (aVisitor visit: anEntity sender).
	self receiver: (aVisitor visit: anEntity receiver).
	self signature: anEntity signature copy.
	anEntity candidates do: [ :c | self addCandidate: (aVisitor visit: c) ]
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> getReceivingFAMIXClass [
	|tmpReceiver|
	"return the FAMIXClass of the receiver. If the receiver is a FAMIXClass, this one is returned. If it is self or super, the corresponding FAMIXClass is returned. The receiver may not be nil"
	tmpReceiver := self receiver.
	
	( tmpReceiver isImplicitVariable) 
			ifTrue: [
				|belongsTo|
				belongsTo:= tmpReceiver belongsTo parentType.
				tmpReceiver isSelf ifTrue:[^belongsTo].
				tmpReceiver isSuper ifTrue:[
					belongsTo superclass
						ifNil: [^belongsTo] 
						ifNotNil: [^belongsTo superclass]
				]]
			ifFalse: [^tmpReceiver]
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> gtDisplayOn: aStream [
	self from ifNotNil: [ self from gtDisplayOn: aStream ].
	aStream nextPutAll: ' -> '.
	self receiver ifNotNil: [ aStream nextPutAll: self receiver name ].
	aStream nextPut: $#.
	aStream nextPutAll: self signature.
	aStream nextPutAll: ' -> '.
	self candidates size = 1
		ifTrue: [ self anyCandidate gtDisplayOn: aStream ]
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> isAPotentialInvocation [
	"test if the sender is a potential invocation"
	| invokedMtdSignature invoRVar invokedMtd |
	invokedMtdSignature := self signature.
	invokedMtdSignature ifNil:[^false].
	invoRVar := self receiver.
			
	invoRVar ifNil:[^true].
	
	(invoRVar isImplicitVariable or: [invoRVar class = FamixJavaClass]) ifFalse:[^true].
	
	(invoRVar isImplicitVariable 
	 and: [(invoRVar isSelf or: [invoRVar isSuper]) not]) ifTrue:[^true].
		 
	(invoRVar isImplicitVariable 
	 	and: [(invokedMtd := self getReceivingFAMIXClass lookUp: invokedMtdSignature) isNil 
					or: [invokedMtd isAbstract]]) ifTrue:[^true].

	^false
	
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"
	| invoRVar |
	invoRVar := self receiver.
	^(invoRVar notNil) and: 
			[invoRVar class = FamixJavaClass or: [invoRVar isImplicitVariable and: [invoRVar isSelf or: [invoRVar isSuper]]]]
]

{ #category : #testing }
FamixJavaInvocation >> isInvocation [ 	
	^true
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $#.
	aStream << self signature.
	aStream << ' (Invocation)'
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> receiverSourceCode [
	^ self receiver sourceText
]

{ #category : #'as yet unclassified' }
FamixJavaInvocation >> receiverSourceCode: aString [
	"CyrilFerlicot: Deprecated the 19 sept 2017"

	self
		deprecated:
			'The source code of the receiver should not be saved as a property. Instead access it via the receiver entity and it should be created as a sourceAnchor in the receiver.'
]
