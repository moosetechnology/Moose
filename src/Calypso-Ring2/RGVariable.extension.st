Extension { #name : #RGVariable }

{ #category : #'*Calypso-Ring2' }
RGVariable >> isReadIn: aCompiledCode [
"TODO"
	^aCompiledCode readsSlot: self
]

{ #category : #'*Calypso-Ring2' }
RGVariable >> isWrittenIn: aCompiledCode [

"TODO"
	^aCompiledCode writesSlot: self
]
