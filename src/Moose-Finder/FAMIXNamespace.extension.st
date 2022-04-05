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
FAMIXNamespace >> mooseIcon [ 
	^ MooseIcons famixNamespace
]
