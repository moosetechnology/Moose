Extension { #name : #XPath }

{ #category : #'*XPath-GTExtensions' }
XPath >> addTreeViewForASTGeneratedWith: aBlock titled: aTitle on: aComposite [
	| ast astError |

	ast :=
		aBlock
			on: XPathException
			do: [:error |
				astError := error.
				nil].

	aComposite tree
		title: aTitle;
		display: [{ast}];
		children: [:each | each treeViewChildren];
		format: [:each | each treeViewLabelText];
		when: [ast notNil];
		rootsExpanded.
	aComposite text
		title: aTitle;
		format: [self styledErrorTextFor: astError];
		when: [ast isNil].
]

{ #category : #'*XPath-GTExtensions' }
XPath class >> gtExampleXPath [
	<gtExample>
	<label: 'addressbook/person[1]/address/@city'>

	^ XPath for: 'addressbook/person[1]/address/@city'
]

{ #category : #'*XPath-GTExtensions' }
XPath >> gtInspectorASTIn: aComposite [
	<gtInspectorPresentationOrder: 6>

	self
		addTreeViewForASTGeneratedWith: [
			XPathExpressionCompiler new
				parseExpression: self expressionSource]
		titled: 'AST'
		on: aComposite
]

{ #category : #'*XPath-GTExtensions' }
XPath >> gtInspectorCompiledIn: aComposite [
	<gtInspectorPresentationOrder: 8>

	| block blockError |

	block :=
		[self compiledExpression block]
			on: XPathException
			do: [:error |
				blockError := error.
				nil].

	aComposite pharoMethod
		title: 'Compiled';
		display: [block method];
		smalltalkClass: [block method methodClass];
		when: [block notNil].
	aComposite text
		title: 'Compiled';
		format: [self styledErrorTextFor: blockError];
		when: [block isNil].
]

{ #category : #'*XPath-GTExtensions' }
XPath >> gtInspectorOptimizedASTIn: aComposite [
	<gtInspectorPresentationOrder: 7>


	self
		addTreeViewForASTGeneratedWith: [| compiler |
			compiler := XPathExpressionCompiler new.
			compiler optimizeParsedExpression:
				(compiler parseExpression: self expressionSource)]
		titled: 'Optimized AST'
		on: aComposite
]

{ #category : #'*XPath-GTExtensions' }
XPath >> gtInspectorSourceIn: aComposite inContext: aGTInspector [
	<gtInspectorPresentationOrder: 5>

	| currentTextStylerDecorator |

	aComposite custom:
		(GLMRubricHighlightedTextPresentation new
			title: 'Source';
			editingMode: [
				currentTextStylerDecorator :=
					GLMXPathHighlighterTextStylerDecorator new.
				GLMHighlighterTextRubEditingMode withStylerDecorator:
					currentTextStylerDecorator];
			display: [self expressionSource];
			withLineNumbers: true;
			act: [:presentation |
				self expressionSource: currentTextStylerDecorator text asString.
				[aGTInspector panes size > 1]
					whileTrue: [aGTInspector removeLastPane].
				"update the entire pane, because the expression has changed"
				aComposite pane update]
				icon: GLMUIThemeExtraIcons glamorousAccept
				on: $s
				entitled: 'Accept';
			act: [:presentation |
				"revert only this presentation"
				presentation update]
				icon: GLMUIThemeExtraIcons glamorousUndo
				on: $Z
				entitled: 'Revert').
]

{ #category : #'*XPath-GTExtensions' }
XPath >> gtInspectorTestsIn: aComposite [
	<gtInspectorPresentationOrder: 9>

	| nodeTests nodeTestsError |

	nodeTests :=
		[self compiledExpression nodeTests]
			on: XPathException
			do: [:error |
				nodeTestsError := error.
				nil].

	aComposite list
		title: 'Tests';
		display: [nodeTests];
		when: [nodeTests notNil].
	aComposite text
		title: 'Tests';
		format: [self styledErrorTextFor: nodeTestsError];
		when: [nodeTests isNil].
]

{ #category : #'*XPath-GTExtensions' }
XPath >> styledErrorTextFor: anError [
	| errorClassName errorMessage errorText |

	errorClassName := anError class name asString.
	errorMessage := anError messageText.
	errorText :=
		(errorClassName, '
	', errorMessage) asText.
	errorText
		addAttribute: TextColor red
		from: 1
		to: errorText size.
	errorText
		addAttribute: XPathExpressionHighlightDefaults defaultDefaultColor
		from: 1
		to: errorClassName size.
	errorText
		addAttribute: TextEmphasis bold
		from: 1
		to: errorClassName size.
	^ errorText.
]
