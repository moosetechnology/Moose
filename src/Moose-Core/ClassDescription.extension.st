Extension { #name : #ClassDescription }

{ #category : #'*Moose-Core' }
ClassDescription >> @ aSymbol [
	"TheRoot@#TheRootSharedVariable"

	"TheRoot class@#uniqueInstance"

	^ ((aSymbol first isUppercase
		ifTrue: [ self instanceSide ]
		ifFalse: [ self ]) mooseName , '.' , aSymbol) asSymbol
]

{ #category : #'*Moose-Core' }
ClassDescription >> asMooseDescription [
	"
	In case you have created your own subclass of MooseEntity, and #asMooseDescription returns nil, you may want to do 'MooseModel resetMeta'. Naturally, you need to have the proper annotation on the class side of your class. 
	"

	^ self instanceSide metamodel descriptionOf: self instanceSide
]

{ #category : #'*Moose-Core' }
ClassDescription >> asMooseDescriptionIn: aMetamodel [ 
	"
	In case you have created your own subclass of MooseEntity, and #asMooseDescription returns nil, you may want to do 'MooseModel resetMeta'. Naturally, you need to have the proper annotation on the class side of your class. 
	"

	^ aMetamodel descriptionOf: self instanceSide
]
