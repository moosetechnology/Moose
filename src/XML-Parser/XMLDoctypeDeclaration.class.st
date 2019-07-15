"
This class represents a <!DOCTYPE ...> declaration. It stores the root element name, public/system ID, and its nodes are the internal subset.
"
Class {
	#name : #XMLDoctypeDeclaration,
	#superclass : #XMLNodeWithChildren,
	#instVars : [
		'root',
		'publicID',
		'systemID'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLDoctypeDeclaration class >> root: aRootElementName publicID: aPublicID systemID: aSystemID [
	^ self new
		root: aRootElementName;
		publicID: aPublicID;
		systemID: aSystemID
]

{ #category : #'instance creation' }
XMLDoctypeDeclaration >> newListForSelect [
	^ XMLInternalSubsetList new: 10
]

{ #category : #defaults }
XMLDoctypeDeclaration >> nodeListClass [
	^ XMLInternalSubsetList
]

{ #category : #accessing }
XMLDoctypeDeclaration >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #accessing }
XMLDoctypeDeclaration >> publicID: aPublicID [
	publicID := aPublicID
]

{ #category : #accessing }
XMLDoctypeDeclaration >> root [
	^ root ifNil: [root := '']
]

{ #category : #accessing }
XMLDoctypeDeclaration >> root: aRootElementName [
	root := aRootElementName
]

{ #category : #accessing }
XMLDoctypeDeclaration >> systemID [
	^ systemID ifNil: [systemID := '']
]

{ #category : #accessing }
XMLDoctypeDeclaration >> systemID: aSystemID [
	systemID := aSystemID
]

{ #category : #printing }
XMLDoctypeDeclaration >> writeXMLOn: aWriter [
	aWriter doctype
		root: self root;
		publicID: self publicID;
		systemID: self systemID;
		with: [self writeInnerXMLOn: aWriter]
]
