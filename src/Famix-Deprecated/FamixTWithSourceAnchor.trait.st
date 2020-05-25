Trait {
	#name : #FamixTWithSourceAnchor,
	#instVars : [
		'#sourceAnchor => FMOne type: #FamixTSourceAnchor opposite: #element'
	],
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
FamixTWithSourceAnchor classSide >> isDeprecated [
	^ true
]
