Extension { #name : #XMLDoctypeDeclaration }

{ #category : #'*XML-Parser-GTExtensions' }
XMLDoctypeDeclaration >> removeFromParent [
	self parent doctypeDeclaration: nil
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDoctypeDeclaration >> supportsSourceEditing [
	^ false
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDoctypeDeclaration >> writeTreeViewLabelXMLOn: aWriter [
	aWriter doctype
		root: self root;
		publicID: self publicID;
		systemID: self systemID;
		write
]
