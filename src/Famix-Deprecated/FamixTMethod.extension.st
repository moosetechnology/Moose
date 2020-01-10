Extension { #name : #FamixTMethod }

{ #category : #'*Famix-Deprecated' }
FamixTMethod >> hasClassScope [
	<FMProperty: #hasClassScope type: #Boolean>
	<FMComment: 'This property is for compatibility purpose. It is used by the old generator of MSE files'>
	self deprecated: 'This property is deprecated from Moose 7.0. Please use isClassSide instead.' transformWith: '`@receiver hasClassScope' -> '`@receiver isClassSide'.
	^ self isClassSide
]

{ #category : #'*Famix-Deprecated' }
FamixTMethod >> hasClassScope: aBoolean [
	self deprecated: 'This property is deprecated from Moose 7.0. Please use isClassSide instead.'.
	^ self isClassSide: aBoolean
]
