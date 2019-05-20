Extension { #name : #FamixStMethod }

{ #category : #'*Famix-PharoSmalltalk-Entities-Extensions' }
FamixStMethod >> isOverriding [
	<MSEProperty: #isOverriding type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrinding a method defined in a super class'>
	
	^self belongsTo directSuperclasses anySatisfy: [:each | 
		each understands: self signature]
]
