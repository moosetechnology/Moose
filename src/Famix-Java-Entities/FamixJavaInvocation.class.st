Class {
	#name : #FamixJavaInvocation,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTHasSignature + FamixTInvocation',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInvocation class >> annotation [

	<FMClass: #Invocation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixJavaInvocation >> getReceivingFAMIXClass [
	| tmpReceiver |
	"return the FAMIXClass of the receiver. If the receiver is a FAMIXClass, this one is returned. If it is self or super, the corresponding FAMIXClass is returned. The receiver may not be nil"
	tmpReceiver := self receiver.

	tmpReceiver isImplicitVariable
		ifTrue: [ | belongsTo |
			belongsTo := tmpReceiver belongsTo parentType.
			tmpReceiver isSelf ifTrue: [ ^ belongsTo ].
			tmpReceiver isSuper
				ifTrue: [ ^ belongsTo superclass ifNil: [ belongsTo ] ] ]
		ifFalse: [ ^ tmpReceiver ]
]

{ #category : #printing }
FamixJavaInvocation >> gtDisplayOn: aStream [
	self source ifNotNil: [ self source gtDisplayOn: aStream ].
	aStream nextPutAll: ' -> '.
	self receiver ifNotNil: [ aStream nextPutAll: self receiver name ].
	aStream nextPut: $#.
	aStream nextPutAll: self signature.
	aStream nextPutAll: ' -> '.
	self candidates size = 1 ifTrue: [ self anyCandidate gtDisplayOn: aStream ]
]

{ #category : #initialization }
FamixJavaInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #testing }
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

{ #category : #testing }
FamixJavaInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"

	| invoRVar |
	invoRVar := self receiver.
	^ invoRVar isNotNil and: [ invoRVar class = FamixJavaClass or: [ invoRVar isImplicitVariable and: [ invoRVar isSelf or: [ invoRVar isSuper ] ] ] ]
]

{ #category : #testing }
FamixJavaInvocation >> isInvocation [ 	
	^true
]

{ #category : #printing }
FamixJavaInvocation >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $#.
	aStream << self signature.
	aStream << ' (Invocation)'
]

{ #category : #accessing }
FamixJavaInvocation >> receiverSourceCode [
	^ self receiver sourceText
]
