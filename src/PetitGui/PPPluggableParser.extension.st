Extension { #name : #PPPluggableParser }

{ #category : #'*PetitGui' }
PPPluggableParser >> displayName [
	^ String streamContents: [ :stream | block sourceNode printOn: stream ]
]
