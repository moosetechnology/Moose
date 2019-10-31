Extension { #name : #FmxMBRelation }

{ #category : #'*Famix-Deprecated' }
FmxMBRelation >> withoutPrimaryContainer [
	self
		deprecated:
			'This is not needed anymore. A generic implementation of #belongsTo was added and if you want to specify the primary container you can add a specific #belongsTo method to your trait/class.'
		transformWith: '`@receiver withoutPrimaryContainer' -> ''
]
