Extension { #name : #FamixTest1Method }

{ #category : #'*Famix-Test2-Entities-*Famix-Test1-Entities' }
FamixTest1Method >> remoteClasses [

	<generated>
	<MSEProperty: #remoteClasses type: #Object>
	"m-m" ^ self privateState attributeAt: #remoteClasses ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #remoteMethods ]
]

{ #category : #'*Famix-Test2-Entities-*Famix-Test1-Entities' }
FamixTest1Method >> remoteClasses: anObject [

	<generated>
	self remoteClasses value: anObject
]
