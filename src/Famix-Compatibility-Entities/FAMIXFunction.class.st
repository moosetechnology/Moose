Class {
	#name : #FAMIXFunction,
	#superclass : #FAMIXBehaviouralEntity,
	#traits : 'FamixTDefinedInModule + FamixTFunction',
	#classTraits : 'FamixTDefinedInModule classTrait + FamixTFunction classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFunction class >> annotation [

	<MSEClass: #Function super: #FAMIXBehaviouralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXFunction class >> generatedSlotNames [
	<generated>
	'FAMIXFunction class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXFunction class >> generatedTraitNames [
	<generated>
	^ #(FamixTDefinedInModule FamixTFunction)
]

{ #category : #meta }
FAMIXFunction class >> requirements [

	<generated>
	^ { FAMIXContainerEntity }
]

{ #category : #accessing }
FAMIXFunction >> belongsTo [

	<generated>
	^ self functionOwner

]

{ #category : #accessing }
FAMIXFunction >> belongsTo: anObject [

	<generated>
	self functionOwner: anObject

]

{ #category : #accessing }
FAMIXFunction >> container [
	^ self functionOwner
]

{ #category : #accessing }
FAMIXFunction >> container: anObject [
	^ self functionOwner: anObject
]

{ #category : #'Famix-Implementation' }
FAMIXFunction >> isFunction [
	^true.
]

{ #category : #testing }
FAMIXFunction >> isPrivate [
	^ self isPublic not
]

{ #category : #testing }
FAMIXFunction >> isPublic [
	"checker whether I am called outside the module in which I am defined"
	^ self receivingInvocations anySatisfy: [:inv |
			inv sender container ~~ self container]
]

{ #category : #'Famix-Implementation' }
FAMIXFunction >> mooseNameOn: stream [ 
	| parent |
	parent := self container.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self signature
		ifNotNil: [ stream nextPutAll: self signature ]
		ifNil: [ self name ifNotNil: [ stream nextPutAll: self name] ]
]

{ #category : #'moose-chef-scoping-filtering' }
FAMIXFunction >> namespaceScope [
	^ self container 
		ifNotNil: [ self container namespaceScope ]
]

{ #category : #testing }
FAMIXFunction >> packageScope [
	"No package scope for functions"

	^ nil
]

{ #category : #accessing }
FAMIXFunction >> parentScope [
	^ self functionOwner
]

{ #category : #accessing }
FAMIXFunction >> parentScope: aScopingEntity [ 
	self deprecated: 'Please use container: instead of parentScope:'.
	self container: aScopingEntity
]
