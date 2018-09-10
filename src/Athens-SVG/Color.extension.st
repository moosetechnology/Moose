Extension { #name : #Color }

{ #category : #'*Athens-SVG' }
Color >> asFillOn: aConverter [
	^ aConverter fromColor: self
]
