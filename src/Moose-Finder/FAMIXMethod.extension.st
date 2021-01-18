Extension { #name : #FAMIXMethod }

{ #category : #'*Moose-Finder' }
FAMIXMethod >> browseSource [
	<menuItem: 'Source' category: 'Browse'>
	| class browser |
	self mooseModel isSmalltalk
		ifTrue: [ class := Smalltalk at: self parentType instanceSide name asSymbol.
			Smalltalk tools browser
				openOnClass:
					(self isClassSide
						ifFalse: [ class ]
						ifTrue: [ class class ])
				selector: self name ]
		ifFalse: [ browser := MooseNamespacesCodeBrowser new browser.
			browser openOn: (self mooseModel allNamespaces select: #isRoot).
			(browser pane port: #focusOnMethod) value: self ]
]

{ #category : #'*Moose-Finder' }
FAMIXMethod >> mooseIcon [ 
	^ MooseIcons famixMethod
]
