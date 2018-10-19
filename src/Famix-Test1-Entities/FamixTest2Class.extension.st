Extension { #name : #FamixTest2Class }

{ #category : #'*Famix-Test1-Entities-*Famix-Test2-Entities' }
FamixTest2Class >> method [

	<generated>
	<MSEProperty: #method type: #Object>
	^ self privateState attributeAt: #method ifAbsent: [ nil ]
]

{ #category : #'*Famix-Test1-Entities-*Famix-Test2-Entities' }
FamixTest2Class >> method: anObject [

	<generated>
	"o-o" (self privateState attributeAt: #method ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #method put: anObject.
	anObject class: self
]

{ #category : #'*Famix-Test1-Entities-*Famix-Test2-Entities' }
FamixTest2Class >> remoteClass [

	<generated>
	<MSEProperty: #remoteClass type: #Object>
	^ self privateState attributeAt: #remoteClass ifAbsent: [ nil ]
]

{ #category : #'*Famix-Test1-Entities-*Famix-Test2-Entities' }
FamixTest2Class >> remoteClass: anObject [

	<generated>
	"o-o" (self privateState attributeAt: #remoteClass ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #remoteClass put: anObject.
	anObject remoteClass: self
]

{ #category : #'*Famix-Test1-Entities-*Famix-Test2-Entities' }
FamixTest2Class >> remoteMethods [

	<generated>
	<MSEProperty: #remoteMethods type: #Object>
	"m-m" ^ self privateState attributeAt: #remoteMethods ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #remoteClasses ]
]

{ #category : #'*Famix-Test1-Entities-*Famix-Test2-Entities' }
FamixTest2Class >> remoteMethods: anObject [

	<generated>
	self remoteMethods value: anObject
]
