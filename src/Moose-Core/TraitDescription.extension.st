Extension { #name : #TraitDescription }

{ #category : #'*Moose-Core' }
TraitDescription >> asMooseDescription [
	"
	In case you have created your own subclass of MooseEntity, and #asMooseDescription returns nil, you may want to do 'MooseModel resetMeta'. Naturally, you need to have the proper annotation on the class side of your class. 
	"
	
	^self instanceSide metamodel descriptionOf: self theNonMetaClass 
]

{ #category : #'*Moose-Core' }
TraitDescription >> asMooseDescriptionIn: aMetamodel [ 
	"
	In case you have created your own subclass of MooseEntity, and #asMooseDescription returns nil, you may want to do 'MooseModel resetMeta'. Naturally, you need to have the proper annotation on the class side of your class. 
	"
	
	^aMetamodel descriptionOf: self instanceSide 
]
