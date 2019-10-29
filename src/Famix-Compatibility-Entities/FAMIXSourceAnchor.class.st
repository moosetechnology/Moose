Class {
	#name : #FAMIXSourceAnchor,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXSourceAnchor >> belongsTo [ 
		
	"define container relationship on element (compatibility)"
	^ self element
]

{ #category : #accessing }
FAMIXSourceAnchor >> completeText [
	"The complete text of a FileAnchor contains all the code of the file pointed by the source anchor. On the contrary the #sourceText return only the pant of the file concerned by the entity. For example a FAMIXFileAnchon knows the start line and end line of the source anchor into the file."
	
	"By default I return the sourceText because most of my subclasses will only do that."

	^ self sourceText
]

{ #category : #'Famix-File' }
FAMIXSourceAnchor >> containerFiles [
	"I should return a collection of files corresponding to the source anchor. If there is no file just return an empty collection."

	^ self subclassResponsibility
]

{ #category : #testing }
FAMIXSourceAnchor >> isFile [
	^ false
]

{ #category : #accessing }
FAMIXSourceAnchor >> lineCount [
	"I should return the number of line in the source text of the entity."

	<FMProperty: #lineCount type: #Number>
	<derived>
	<FMComment: 'The number of lines in the source text'>
	^ self subclassResponsibility
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

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
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
