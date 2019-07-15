Extension { #name : #FAMIXMethod }

{ #category : #'*Moose-Finder' }
FAMIXMethod >> browseSource [
	<menuItem: 'Source' category: 'Browse'>
	
	|class browser |
	self mooseModel isSmalltalk ifTrue: [
		class := Smalltalk at: self parentType instanceSide name asSymbol.
		self hasClassScope
			ifFalse: [ Smalltalk tools browser openOnClass: class selector: self name ]
			ifTrue: [ Smalltalk tools browser openOnClass: class class selector: self name ]
		]
	ifFalse: [ 
		browser := MooseNamespacesCodeBrowser new browser.
		browser openOn: (self mooseModel allNamespaces select: #isRoot).
		(browser pane port: #focusOnMethod) value: self.
		 ]
]

{ #category : #'*Moose-Finder' }
FAMIXMethod >> mooseIcon [ 
	^ MooseIcons famixMethod
]
