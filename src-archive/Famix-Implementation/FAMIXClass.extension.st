Extension { #name : #FAMIXClass }

{ #category : #'*famix-implementation-testing' }
FAMIXClass >> isClass [
	^ true
]

{ #category : #'*Famix-Implementation' }
FAMIXClass >> smalltalkClass [ 
	"Returns the associated smalltalk class if it exist in the system."
	
	^ FAMIXNameResolver smalltalkClassFromFamixClassName: 
			self name  ifAbsent: [nil] 
]
