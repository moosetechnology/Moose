Extension { #name : #SmaCCSuperclassDirectiveNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCSuperclassDirectiveNode >> displayString [
	^ '%' , hierarchyToken value , ' ' , superclass value
]
