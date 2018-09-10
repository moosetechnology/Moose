Extension { #name : #AthensCairoSurface }

{ #category : #'*Trachel' }
AthensCairoSurface >> hasBeenFreed [
	"Return true if the external resource has been freed"
	^ handle isNull
]
