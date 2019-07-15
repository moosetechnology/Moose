"
I am a description of an one-to-one relationship.
"
Class {
	#name : #MAToOneRelationDescription,
	#superclass : #MARelationDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #testing }
MAToOneRelationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAToOneRelationDescription class >> label [
	^ '1:1 Relation'
]

{ #category : #visiting }
MAToOneRelationDescription >> acceptMagritte: aVisitor [
	aVisitor visitToOneRelationDescription: self
]

{ #category : #'ToMany compatibility' }
MAToOneRelationDescription >> isDefinitive [
	"I'm really not sure what this does, but we need to respond to it to get MAElementRow to work, which was copied over from ToMany"
	^ false
]

{ #category : #'ToMany compatibility' }
MAToOneRelationDescription >> isOrdered [
	"See #isDefinitive comment"
	^ false
]

{ #category : #validating }
MAToOneRelationDescription >> validateKind: anObject [
	super validateKind: anObject.
	(self classes anySatisfy: [ :class | anObject species includesBehavior: class ])
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]
]
