Extension { #name : #FAMIXNamespace }

{ #category : #'*Moose-Finder' }
FAMIXNamespace >> browseSource [
	<menuItem: 'Source' category: 'Browse'>
	| browser |
	self mooseModel isSmalltalk 
		ifTrue: [ (Smalltalk at: self name) browse ]
	ifFalse: [ 
		browser := MooseNamespacesCodeBrowser new browser.
		browser openOn: (self mooseModel allNamespaces select: #isRoot).
		(browser pane port: #focusOnNamespace) value: self ]
]

{ #category : #'*Moose-Finder' }
FAMIXNamespace >> mooseFinderWithinHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Within overall hierarchy';
			titleIcon: MooseIcons mooseCluster;
			initializeView: [ RTMondrian new ];
			painting: [ :view |
				self withAllChildScopes asMooseGroup viewWithinOverallHierarchyOn: view ]
]

{ #category : #'*Moose-Finder' }
FAMIXNamespace >> mooseIcon [ 
	^ MooseIcons famixNamespace
]
