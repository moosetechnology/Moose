Extension { #name : #PPParser }

{ #category : #'*petitsmalltalk-operations' }
PPParser >> smalltalkToken [
	| ws |
	ws := PPSmalltalkWhitespaceParser new.
	^ ((ws, ((PPTokenParser on: self) tokenClass: PPSmalltalkToken; yourself), ws) ==> #second)
		propertyAt: #trimmingToken put: true;
		yourself
]
