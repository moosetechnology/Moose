Extension { #name : #RGComment }

{ #category : #'*Calypso-Ring2' }
RGComment >> asText [

	^ (self content ifNil: ['']) asText
]
