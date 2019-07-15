Extension { #name : #Trait }

{ #category : #'*Moose-Query' }
Trait >> childrenTypes [

	^ Set new
]

{ #category : #'*Moose-Query' }
Trait >> childrenTypesInMetamodel: aMetamodel [

	^ Set new
]

{ #category : #'*Moose-Query' }
Trait >> implementingClassesIn: aMetamodel [

	^ (aMetamodel classes select: [ :e | e implementingClass traits includes: self ]) collect: #implementingClass.

]

{ #category : #'*Moose-Query' }
Trait >> parentTypes [

	^ Set new
]

{ #category : #'*Moose-Query' }
Trait >> parentTypesIn: aMetamodel [

	^ Set new
]
