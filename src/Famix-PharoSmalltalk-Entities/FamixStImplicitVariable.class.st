Class {
	#name : #FamixStImplicitVariable,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTImplicitVariable',
	#classTraits : 'FamixTImplicitVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStImplicitVariable class >> annotation [

	<FMClass: #ImplicitVariable super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixStImplicitVariable >> isSelf [
	^ self name = #self
]

{ #category : #testing }
FamixStImplicitVariable >> isSuper [
	^ self name == #super
]

{ #category : #testing }
FamixStImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]
