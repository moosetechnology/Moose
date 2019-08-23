Class {
	#name : #FamixJavaSourceAnchor,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaSourceAnchor class >> childrenTypes [
	self flag: #todo. "Source Anchors should not implement TEntityMetaLevelDependency but currently a source anchor is in Moose containment tree. This is a bug but Orion depend on this hack. So we first need to clean Orion, then we can remove those aweful methods. here."
	^ {}
]

{ #category : #accessing }
FamixJavaSourceAnchor class >> parentTypes [
	self flag: #todo. "Source Anchors should not implement TEntityMetaLevelDependency but currently a source anchor is in Moose containment tree. This is a bug but Orion depend on this hack. So we first need to clean Orion, then we can remove those aweful methods. here."
	^ {}
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> completeText [
	"The complete text of a FileAnchor contains all the code of the file pointed by the source anchor. On the contrary the #sourceText return only the pant of the file concerned by the entity. For example a FAMIXFileAnchon knows the start line and end line of the source anchor into the file."
	
	"By default I return the sourceText because most of my subclasses will only do that."

	^ self sourceText
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> containerFiles [
	"I should return a collection of files corresponding to the source anchor. If there is no file just return an empty collection."

	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> isFile [
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> isMultiple [
	^ false
]

{ #category : #metrics }
FamixJavaSourceAnchor >> lineCount [
	"I should return the number of line in the source text of the entity."

	<MSEProperty: #lineCount type: #Number>
	<derived>
	<MSEComment: 'The number of lines in the source text'>
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryAllIncomingInvocations [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryAllOutgoingInvocations [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryIncomingAccesses [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryIncomingReferences [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryIncomingTypeDeclarations [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryOutgoingAccesses [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryOutgoingReferences [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> queryOutgoingTypeDeclarations [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> querySureIncomingInvocations [
	^ MooseQueryResult new
]

{ #category : #'as yet unclassified' }
FamixJavaSourceAnchor >> querySureOutgoingInvocations [
	^ MooseQueryResult new
]

{ #category : #accessing }
FamixJavaSourceAnchor >> sourceText [
	^ self subclassResponsibility
]
