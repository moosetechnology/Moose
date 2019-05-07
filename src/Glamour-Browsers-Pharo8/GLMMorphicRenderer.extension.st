Extension { #name : #GLMMorphicRenderer }

{ #category : #'*Glamour-Browsers-Pharo8' }
GLMMorphicRenderer >> renderWrapper: aBrowser [ 
	^ GLMMorphicWrapperRenderer render: aBrowser from: self
]
