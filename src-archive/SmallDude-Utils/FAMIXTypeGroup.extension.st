Extension { #name : #FAMIXTypeGroup }

{ #category : #'*SmallDude-Utils' }
FAMIXTypeGroup >> viewDuplicationComplexity [
	<menuItem: 'Duplication complexity' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewDuplicationComplexityOn: view.
	^ view open setLabel: 'Duplication Complexity'
]

{ #category : #'*SmallDude-Utils' }
FAMIXTypeGroup >> viewDuplicationComplexityOn: view [
	self viewSimpleSystemComplexityOn: view.
	view shape shape: (RTBezierLine new color: Color red).
	view interaction popupText: [ :each | each duplicationText ].
	RTEdgeBuilder new
		view: view view;
		objects: self mooseModel allDuplications;
		connectFrom: [ :each | each referenceCode entity ]
			to: [ :each | each duplicateCode entity ]
]
