Extension { #name : #XMLNodeWithElements }

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithElements >> addTreeViewChildrenTo: anOrderedCollection [
	self nodesDo: [:each |
		(each isStringNode
			and: [each isEmpty
				or: [each isWhitespace]])
			ifFalse: [anOrderedCollection addLast: each]]
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithElements class >> gtExampleXmlNode [
	<gtExample>
	^ XMLDocument gtExampleXmlNode nodes
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithElements >> spotterForAllElementsFor: aStep [
	<spotterOrder: 40>
	aStep listProcessor
		title: 'All elements';
		allCandidates: [self allElements];
		itemName: #gtDisplayString;
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithElements >> spotterForDirectElementsFor: aStep [
	<spotterOrder: 40>
	aStep listProcessor
		title: 'Direct elements';
		allCandidates: [self elements];
		itemName: #gtDisplayString;
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithElements >> spotterPreviewSourceIn: aComposite [
	<spotterPreview: 10>
	
	aComposite text
		title: 'Source';
		display: [
			self asHighlightedTextWrittenWith: [:writer |
				"use less indent for spotter previews"
				writer formatter indentString: '  '.
				self writeXMLOn: writer]];
		entity: self
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithElements >> supportsTreeView [
	^ self hasChildren
		and: [self nodes anySatisfy: [:each | each isStringNode not]]
]
