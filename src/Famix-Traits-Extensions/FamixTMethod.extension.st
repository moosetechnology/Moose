Extension { #name : #FamixTMethod }

{ #category : #'*Famix-Traits-Extensions' }
FamixTMethod >> hasClassScope [

	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'This property is for compatibility purpose. It is used by the old generator of MSE files'>
	^ self isClassSide
]

{ #category : #'*Famix-Traits-Extensions' }
FamixTMethod >> hasClassScope: aBoolean [
	^ self isClassSide: aBoolean
]
