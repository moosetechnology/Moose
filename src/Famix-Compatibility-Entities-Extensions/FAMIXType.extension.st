Extension { #name : #FAMIXType }

{ #category : #'*Famix-Compatibility-Entities-Extensions' }
FAMIXType >> anySuperclass [

	"Mircea: this used to return interfaces too. fixed now. 
	also added superclass that does the same thing"

	self
		allSuperclassesDo: [ :each | 
			each isInterface
				ifFalse: [ ^ each ] ].
	^ nil
]
