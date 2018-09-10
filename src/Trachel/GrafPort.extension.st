Extension { #name : #GrafPort }

{ #category : #'*Trachel' }
GrafPort >> invariant [
	"Return false if the form canvas is not properly defined"
	"
	(self allInstances collect: #origin) asSet
	"
	combinationRule notNil ifFalse: [ ^ false ].
	clipHeight > 0 ifFalse: [ ^ false ].
	clipWidth > 0 ifFalse: [ ^ false ].
	clipX >= 0 ifFalse: [ ^ false ].
	clipY >= 0 ifFalse: [ ^ false ].
	
	"What about destForm?"
	(destForm class == DisplayScreen or: [ destForm class == Form ]) ifFalse: [ ^ false ].
	"(sourceForm notNil and: [ destForm notNil ]) ifFalse: [ self haltOnce. ^ false ]."
	^ true

	
]
