Extension { #name : #PPContextMemento }

{ #category : #'*petitindent' }
PPContextMemento >> indentStack [
	^ self propertyAt: #indentStack ifAbsent: [ IndentStack new ]
]
