Class {
	#name : #FamixStInvocation,
	#superclass : #FamixStEntity,
	#traits : 'FamixTHasSignature + FamixTInvocation',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocation classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStInvocation class >> annotation [

	<FMClass: #Invocation super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixStInvocation >> getReceivingFAMIXClass [
	| tmpReceiver |
	"return the FAMIXClass of the receiver. If the receiver is a FAMIXClass, this one is returned. If it is self or super, the corresponding FAMIXClass is returned. The receiver may not be nil"
	tmpReceiver := self receiver.

	tmpReceiver isImplicitVariable
		ifTrue: [ | belongsTo |
			belongsTo := tmpReceiver belongsTo parentType.
			tmpReceiver isSelf ifTrue: [ ^ belongsTo ].
			tmpReceiver isSuper ifTrue: [ ^ belongsTo superclass ifNil: [ belongsTo ] ] ]
		ifFalse: [ ^ tmpReceiver ]
]

{ #category : #initialization }
FamixStInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #'instance creation' }
FamixStInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"

	| invoRVar |
	invoRVar := self receiver.
	^ invoRVar isNotNil and: [ invoRVar class = FamixStClass or: [ invoRVar isImplicitVariable and: [ invoRVar isSelf or: [ invoRVar isSuper ] ] ] ]
]
