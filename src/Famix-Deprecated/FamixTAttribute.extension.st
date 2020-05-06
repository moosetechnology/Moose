Extension { #name : #FamixTAttribute }

{ #category : #'*Famix-Deprecated' }
FamixTAttribute >> hasClassScope [
	<FMProperty: #hasClassScope type: #Boolean>
	<FMComment: 'This property is for compatibility purpose. It is used by the old generator of MSE files'>
	<derived>
	self
		deprecated: 'This property is deprecated from Moose 8.0. Please use isClassSide instead.'
		transformWith: '`@receiver hasClassScope' -> '`@receiver isClassSide'.
	^ self isClassSide
]

{ #category : #'*Famix-Deprecated' }
FamixTAttribute >> hasClassScope: aBoolean [
	self deprecated: 'This property is deprecated from Moose 8.0. Please use isClassSide instead.'.
	^ self isClassSide: aBoolean
]
