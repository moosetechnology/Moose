Class {
	#name : #FAMIXInvocation,
	#superclass : #MooseEntity,
	#traits : 'FamixTHasSignature + FamixTInvocation',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocation classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXInvocation class >> annotation [

	<FMClass: #Invocation super: #MooseEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXInvocation class >> metamodel [

	<generated>
	^ FAMIXModel metamodel
]

{ #category : #'Famix-Extensions' }
FAMIXInvocation >> getReceivingFAMIXClass [
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

{ #category : #'Famix-Implementation' }
FAMIXInvocation >> gtDisplayOn: aStream [
	self from ifNotNil: [ self from gtDisplayOn: aStream ].
	aStream nextPutAll: ' -> '.
	self receiver ifNotNil: [ aStream nextPutAll: self receiver name ].
	aStream nextPut: $#.
	aStream nextPutAll: self signature.
	aStream nextPutAll: ' -> '.
	self candidates size = 1
		ifTrue: [ self anyCandidate gtDisplayOn: aStream ]
]

{ #category : #initialization }
FAMIXInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #'Famix-Extensions-testing' }
FAMIXInvocation >> isAPotentialInvocation [
	"test if the sender is a potential invocation"
	| invokedMtdSignature invoRVar invokedMtd |
	invokedMtdSignature := self signature.
	invokedMtdSignature ifNil:[^false].
	invoRVar := self receiver.
			
	invoRVar ifNil:[^true].
	
	(invoRVar isImplicitVariable or: [invoRVar class = FAMIXClass]) ifFalse:[^true].
	
	(invoRVar isImplicitVariable 
	 and: [(invoRVar isSelf or: [invoRVar isSuper]) not]) ifTrue:[^true].
		 
	(invoRVar isImplicitVariable 
	 	and: [(invokedMtd := self getReceivingFAMIXClass lookUp: invokedMtdSignature) isNil 
					or: [invokedMtd isAbstract]]) ifTrue:[^true].

	^false
	
]

{ #category : #'Famix-Extensions-testing' }
FAMIXInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"
	| invoRVar |
	invoRVar := self receiver.
	^(invoRVar notNil) and: 
			[invoRVar class = FAMIXClass or: [invoRVar isImplicitVariable and: [invoRVar isSelf or: [invoRVar isSuper]]]]
]

{ #category : #testing }
FAMIXInvocation >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isInheritance [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FAMIXInvocation >> isInvocation [ 	
	^true
]

{ #category : #testing }
FAMIXInvocation >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInvocation >> isType [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FAMIXInvocation >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $#.
	aStream << self signature.
	aStream << ' (Invocation)'
]

{ #category : #accessing }
FAMIXInvocation >> receiverSourceCode [
	^ self receiver sourceText
]
