Extension { #name : #FAMIXClass }

{ #category : #'*Moose-Finder' }
FAMIXClass >> browseSource [
	<menuItem: 'Source' category: 'Browse'>
	| browser |
	self mooseModel isSmalltalk 
		ifTrue: [ (Smalltalk at: self name) browse ]
	ifFalse: [ 
		browser := MooseNamespacesCodeBrowser new browser.
		browser openOn: (self mooseModel allNamespaces select: #isRoot).
		(browser pane port: #focusOnClass) value: self.
		 ]
]

{ #category : #'*Moose-Finder' }
FAMIXClass >> mooseIcon [
	^ self isInterface 
		ifTrue: [ MooseIcons famixInterface ]
		ifFalse: [ MooseIcons famixClass ]
]
