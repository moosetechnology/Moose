Extension { #name : #PPPluggableParser }

{ #category : #'*petitgui-accessing' }
PPPluggableParser >> displayName [
	^ String streamContents: [ :stream | block sourceNode printOn: stream ]
]
