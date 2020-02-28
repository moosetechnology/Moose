Class {
	#name : #FamixStInvocation,
	#superclass : #MooseEntity,
	#traits : 'FamixTHasSignature + FamixTInvocation',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocation classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStInvocation class >> annotation [

	<FMClass: #Invocation super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStInvocation class >> metamodel [

	<generated>
	^ FamixStModel metamodel
]

{ #category : #'instance creation' }
FamixStInvocation >> getReceivingFAMIXClass [
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

{ #category : #'instance creation' }
FamixStInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #'instance creation' }
FamixStInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"
	| invoRVar |
	invoRVar := self receiver.
	^(invoRVar notNil) and: 
			[invoRVar class = FamixStClass or: [invoRVar isImplicitVariable and: [invoRVar isSelf or: [invoRVar isSuper]]]]
]

{ #category : #testing }
FamixStInvocation >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixStInvocation >> isType [

	<generated>
	^ false
]
