Extension { #name : #RTView }

{ #category : #'*Moose-Finder' }
RTView >> mooseFinderEvaluatorIn: composite [
	"Do not offer an evaluator for a view"
]

{ #category : #'*Moose-Finder' }
RTView >> mooseFinderViewIn: composite [
	<moosePresentationOrder: 0>
	composite roassal2
		title: 'View';
		initializeView: [ self ];
		titleIcon: MooseIcons mooseView
]
