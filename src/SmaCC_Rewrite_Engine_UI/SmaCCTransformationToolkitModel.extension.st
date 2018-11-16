Extension { #name : #SmaCCTransformationToolkitModel }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCTransformationToolkitModel >> changed: aSymbol [
	super changed: aSymbol.
	self announcer announce: aSymbol
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCTransformationToolkitModel >> changed: aSymbol with: anObject [
	super changed: aSymbol with: anObject.
	self announcer announce: aSymbol
]
