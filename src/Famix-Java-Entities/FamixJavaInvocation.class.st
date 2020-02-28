Class {
	#name : #FamixJavaInvocation,
	#superclass : #MooseEntity,
	#traits : 'FamixTHasSignature + FamixTInvocation',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInvocation class >> annotation [

	<FMClass: #Invocation super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaInvocation class >> metamodel [

	<generated>
	^ FamixJavaModel metamodel
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
FamixJavaInvocation >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isInvocation [ 	
	^true
]

{ #category : #testing }
FamixJavaInvocation >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInvocation >> isType [

	<generated>
	^ false
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
