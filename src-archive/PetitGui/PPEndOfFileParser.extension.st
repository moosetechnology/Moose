Extension { #name : #PPEndOfFileParser }

{ #category : #'*petitgui-accessing' }
PPEndOfFileParser >> exampleOn: aStream [ 
	aStream nextPutAll: #'end-of-input'
]
