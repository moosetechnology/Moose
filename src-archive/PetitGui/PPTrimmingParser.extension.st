Extension { #name : #PPTrimmingParser }

{ #category : #'*petitgui-accessing' }
PPTrimmingParser >> exampleOn: aStream [
	super exampleOn: aStream.
	aStream nextPut: Character space
]
