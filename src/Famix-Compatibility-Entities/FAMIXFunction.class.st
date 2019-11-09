Class {
	#name : #FAMIXFunction,
	#superclass : #FAMIXBehaviouralEntity,
	#traits : 'FamixTDefinedInModule + FamixTFunction',
	#classTraits : 'FamixTDefinedInModule classTrait + FamixTFunction classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFunction class >> annotation [

	<FMClass: #Function super: #FAMIXBehaviouralEntity>
	<package: #FAMIX>
	<generated>
	^self
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

{ #category : #accessing }
FAMIXFunction >> parentScope [
	^ self functionOwner
]
