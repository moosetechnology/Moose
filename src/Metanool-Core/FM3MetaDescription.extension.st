Extension { #name : #FM3MetaDescription }

{ #category : #'*metanool-core' }
FM3MetaDescription >> asMagritteDescription [
	| description |
	description := MAContainer new.
	description label: self name.
	self allAttributes do: [ :attribute | 
		description add: attribute asMagritteDescription ].
	^ description
]

{ #category : #'*metanool-core' }
FM3MetaDescription >> asMagritteDescriptionWithAnnotations [

	| description |
	description := MAContainer new.
	description label: self name.
	self allAttributes do: [ :attribute | 
		(attribute isKindOf: MTLAnnotationDescription) ifTrue: [
			description add: attribute asMagritteDescription ] ].
	^ description
]
