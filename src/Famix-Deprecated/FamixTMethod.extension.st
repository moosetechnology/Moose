Extension { #name : #FamixTMethod }

{ #category : #'*Famix-Deprecated' }
FamixTMethod >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'This property is for compatibility purpose. It is used by the old generator of MSE files'>
	self deprecated: 'This property is deprecated from Moose 7.0. Please use isClassSide instead.' transformWith: '`@receiver hasClassScope' -> '`@receiver isClassSide'.
	^ self isClassSide
]

{ #category : #'*Famix-Deprecated' }
FamixTMethod >> hasClassScope: aBoolean [
	self deprecated: 'This property is deprecated from Moose 7.0. Please use isClassSide instead.' transformWith: '`@receiver hasClassScope: `@statements1' -> '`@receiver isClassSide: `@statements1'.
	^ self isClassSide: aBoolean
]
