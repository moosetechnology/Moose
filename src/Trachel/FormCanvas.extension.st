Extension { #name : #FormCanvas }

{ #category : #'*Trachel' }
FormCanvas >> invariant [
	"Return false if the form canvas is not properly defined"
	"
	(self allInstances collect: #origin) asSet
	"
	(self origin isPoint and: [ self origin x >= 0 and: [ self origin y >= 0 ] ]) ifFalse: [ ^ false ].
	(self clipRect extent > (0 @ 0)) ifFalse: [ ^ false ].
	self form notNil ifFalse: [ ^ false ].
	
	"If the form is okay, then we check the port"
	^ port invariant
]
