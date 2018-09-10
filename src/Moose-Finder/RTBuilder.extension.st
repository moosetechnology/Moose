Extension { #name : #RTBuilder }

{ #category : #'*Moose-Finder' }
RTBuilder >> mooseFinderEvaluatorIn: composite [
	"Do not offer an evaluator for a view"
]

{ #category : #'*Moose-Finder' }
RTBuilder >> mooseFinderViewIn: composite [
	<moosePresentationOrder: 0>
	composite roassal2
		title: 'View';
		titleIcon: [ MooseIcons mooseView ];
		initializeView: [ self ]
]
