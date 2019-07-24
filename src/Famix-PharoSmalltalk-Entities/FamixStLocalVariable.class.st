Class {
	#name : #FamixStLocalVariable,
	#superclass : #FamixStEntity,
	#traits : 'FamixStStructuralEntity + FamixTLocalVariable',
	#classTraits : 'FamixStStructuralEntity classTrait + FamixTLocalVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStLocalVariable class >> requirements [

	<generated>
	^ { FamixStMethod }
]

{ #category : #accessing }
FamixStLocalVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixStLocalVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FamixStLocalVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #accessing }
FamixStLocalVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]
