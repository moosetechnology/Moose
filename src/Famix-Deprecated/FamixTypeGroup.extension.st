Extension { #name : #FamixTypeGroup }

{ #category : #'*Famix-Deprecated' }
FamixTypeGroup >> ahh [ 
	"average hierarchy height" 

		self
		deprecated:
			'Deprecated for a better name.'
		transformWith: '`@receiver ahh' -> '`@receiver averageHierarchyHeighth'.
	^ self averageHierarchyHeighth
]
