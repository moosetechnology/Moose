"
FAMIXSourceAnchor is an abstract class representing a pointer to a source. The source can be identified in multiple ways as specified by the subclasses.  The famix entity that this class is a source pointer for, is accessible via element property.
"
Class {
	#name : #FAMIXSourceAnchor,
	#superclass : #FAMIXEntity,
	#traits : 'TEntityMetaLevelDependency + TDependencyQueries',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'element'
	],
	#category : #'Famix-Core'
}

{ #category : #accessing }
FAMIXSourceAnchor class >> allIncomingAssociationTypes [
   ^ Set new
]

{ #category : #accessing }
FAMIXSourceAnchor class >> allOutgoingAssociationTypes [
	^ Set new
]

{ #category : #meta }
FAMIXSourceAnchor class >> annotation [
	<MSEClass: #SourceAnchor super: #FAMIXEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXSourceAnchor class >> incomingMSEProperties [
	^ #()
]

{ #category : #accessing }
FAMIXSourceAnchor class >> outgoingMSEProperties [
	^ #()
]

{ #category : #accessing }
FAMIXSourceAnchor >> completeText [
	"The complete text of a FileAnchor contains all the code of the file pointed by the source anchor. On the contrary the #sourceText return only the pant of the file concerned by the entity. For example a FAMIXFileAnchon knows the start line and end line of the source anchor into the file."
	
	"By default I return the sourceText because most of my subclasses will only do that."

	^ self sourceText
]

{ #category : #accessing }
FAMIXSourceAnchor >> element [
	<MSEProperty: #element type: #FAMIXSourcedEntity opposite: #sourceAnchor>
	<MSEComment: 'Enable the accessibility to the famix entity that this class is a source pointer for'>
	<container>
	^ element
]

{ #category : #accessing }
FAMIXSourceAnchor >> element: anElement [
	element := anElement .
	element sourceAnchor = self ifFalse: [  element sourceAnchor: self ]
]

{ #category : #'moosequery-queries-incoming' }
FAMIXSourceAnchor >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseChefTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #testing }
FAMIXSourceAnchor >> isFile [
	^ false
]

{ #category : #testing }
FAMIXSourceAnchor >> isMultiple [
	^ false
]

{ #category : #accessing }
FAMIXSourceAnchor >> lineCount [
	"I should return the number of line in the source text of the entity."

	<MSEProperty: #lineCount type: #Number>
	<derived>
	<MSEComment: 'The number of lines in the source text'>
	^ self subclassResponsibility
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXSourceAnchor >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseChefTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'moosequery-queries-incoming' }
FAMIXSourceAnchor >> queryAllIncomingInvocations [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXSourceAnchor >> queryAllOutgoingInvocations [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-incoming' }
FAMIXSourceAnchor >> queryIncomingAccesses [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-incoming' }
FAMIXSourceAnchor >> queryIncomingReferences [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-incoming' }
FAMIXSourceAnchor >> queryIncomingTypeDeclarations [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXSourceAnchor >> queryOutgoingAccesses [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXSourceAnchor >> queryOutgoingReferences [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXSourceAnchor >> queryOutgoingTypeDeclarations [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-incoming' }
FAMIXSourceAnchor >> querySureIncomingInvocations [
	^ MooseQueryResult new
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXSourceAnchor >> querySureOutgoingInvocations [
	^ MooseQueryResult new
]

{ #category : #accessing }
FAMIXSourceAnchor >> sourceText [
	^ self subclassResponsibility
]
