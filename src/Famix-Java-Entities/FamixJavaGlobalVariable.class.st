Class {
	#name : #FamixJavaGlobalVariable,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTGlobalVariable + FamixTWithModifiers',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTGlobalVariable classTrait + FamixTWithModifiers classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaGlobalVariable class >> annotation [

	<FMClass: #GlobalVariable super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
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
FamixJavaGlobalVariable >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Global Variable)'
]
