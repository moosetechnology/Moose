Extension { #name : #XMLNode }

{ #category : #'*XPath-GTExtensions' }
XMLNode >> gtInspectorXPathIn: aComposite [
	<gtInspectorPresentationOrder: 9>

	| currentTextStylerDecorator |

	self supportsXPathEvaluator
		ifFalse: [^ self].

	aComposite custom:
		(GLMRubricHighlightedTextPresentation new
			title: 'XPath';
			editingMode: [
				currentTextStylerDecorator :=
					GLMXPathHighlighterTextStylerDecorator new.
				GLMHighlighterTextRubEditingMode withStylerDecorator:
					currentTextStylerDecorator];
			display: ['self::node()'];
			withLineNumbers: true;
			"the selection action was removed because it reports the
			wrong #selectionText if the previous presentation viewed
			was a text presentation with a selection"
			act: [:presentation |
				presentation
					selection:
						(self xpath:
							currentTextStylerDecorator text asString);
					clearUserEdits]
				icon: GLMUIThemeExtraIcons glamorousGo
				on: $g
				entitled: 'Evaluate and go').
]

{ #category : #'*XPath-GTExtensions' }
XMLNode >> supportsXPathEvaluator [
	^ true
]
