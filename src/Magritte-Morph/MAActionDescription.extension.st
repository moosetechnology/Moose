Extension { #name : #MAActionDescription }

{ #category : #'*magritte-morph' }
MAActionDescription >> buttonOn: anObject [

	model := anObject.
	^ UITheme current builder newButtonFor: self action: #perform getEnabled: #isEnabled label: self label help: comment.
]
