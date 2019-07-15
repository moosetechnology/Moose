Extension { #name : #String }

{ #category : #'*Athens-SVG' }
String >> asFillOn: aConverter [
	^ aConverter fromString: self trimBoth
]
