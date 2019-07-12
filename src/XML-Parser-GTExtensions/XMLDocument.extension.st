Extension { #name : #XMLDocument }

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument >> addTreeViewChildrenTo: anOrderedCollection [
	self hasDoctypeDeclaration
		ifTrue: [anOrderedCollection addLast: self doctypeDeclaration].
	super addTreeViewChildrenTo: anOrderedCollection.
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument class >> gtExampleXmlNode [
	<gtExample>
	^ XMLDOMParser parse: '<document><a></a><b></b></document>'
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument >> newSourceEditorTextStylerDecorator [
	^ GLMXMLDocumentHighlighterTextStylerDecorator new
		configuration: self configuration
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument >> setOuterXMLFromEditedSource: aString [
	| newDocument |

	[newDocument :=
		(self parserHandlerClass on: aString)
			configuration: self configuration;
			parseDocument]
		on: Error
		do: [:error |
			newDocument := nil.
			error pass].
	newDocument
		ifNotNil: [
			self
				removeNodes;
				configuration: newDocument configuration;
				version: newDocument version;
				encoding: newDocument encoding;
				isStandalone: newDocument isStandalone;
				doctypeDeclaration: newDocument doctypeDeclaration;
				doctypeDefinition: newDocument doctypeDefinition;
				addNodes: newDocument nodes copy].
	^ self.
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument >> supportsSourceEditing [
	^ true
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument >> supportsTreeView [
	^ self hasDoctypeDeclaration
		or: [super supportsTreeView]
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLDocument >> writeTreeViewLabelXMLOn: aWriter [
	self writeXMLDeclarationOn: aWriter
]
