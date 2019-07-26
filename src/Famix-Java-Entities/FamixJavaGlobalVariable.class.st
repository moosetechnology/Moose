Class {
	#name : #FamixJavaGlobalVariable,
	#superclass : #FamixJavaStructuralEntity,
	#traits : 'FamixTGlobalVariable',
	#classTraits : 'FamixTGlobalVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaGlobalVariable class >> annotation [

	<MSEClass: #GlobalVariable super: #FamixJavaStructuralEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaGlobalVariable class >> requirements [

	<generated>
	^ { FamixJavaScopingEntity }
]

{ #category : #accessing }
FamixJavaGlobalVariable >> belongsTo [

	<generated>
	^ self parentScope

]

{ #category : #accessing }
FamixJavaGlobalVariable >> belongsTo: anObject [

	<generated>
	self parentScope: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> isPrivate [
	^ self isPublic not
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> isPublic [
	"checker whether I am called outside the module in which I am defined"
	^ self incomingAccesses anySatisfy: [:inv |
			inv accessor parentScope ~~ self parentScope]
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> namespaceScope [
	^ self parentScope
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> packageScope [
	^ self parentPackage
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Global Variable)'
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> typeScope [
	"typeScope does not make sense for a global variable,
	so we return nil"

	^ nil
]
