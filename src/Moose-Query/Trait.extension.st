Extension { #name : #Trait }

{ #category : #'*Moose-Query' }
Trait >> implementingClassesIn: aMetamodel [

	^ (aMetamodel classes select: [ :e | e implementingClass traits includes: self ]) collect: #implementingClass.

]

{ #category : #'*Moose-Query' }
Trait >> inheritsFromType: aClassFAMIX [
	^ ({self} , self traits flatCollect: #withAllSuperclasses as: Set) includes: aClassFAMIX
]
