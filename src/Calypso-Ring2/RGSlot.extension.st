Extension { #name : #RGSlot }

{ #category : #'*Calypso-Ring2' }
RGSlot >> isReadIn: aCompiledCode [
	^aCompiledCode readsSlot: self
]

{ #category : #'*Calypso-Ring2' }
RGSlot >> isWrittenIn: aCompiledCode [
	^aCompiledCode writesSlot: self
]
