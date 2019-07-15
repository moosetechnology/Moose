"
FAMIXFunction represents a behavioural entity in a procedural language.
"
Class {
	#name : #FAMIXFunction,
	#superclass : #FAMIXBehaviouralEntity,
	#instVars : [
		'container'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXFunction class >> annotation [
	<MSEClass: #Function super: #FAMIXBehaviouralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXFunction >> belongsTo [	
	
	^ self container
]

{ #category : #accessing }
FAMIXFunction >> container [
	<MSEProperty: #container type: #FAMIXContainerEntity opposite: #functions>
	<MSEComment:
		'The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.'>
	<container>
	^ container
]

{ #category : #accessing }
FAMIXFunction >> container: aContainer [
	container := FMMultivalueLink 
		on: self
		update: #functions
		from: self container
		to: aContainer
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
	^ self container
]

{ #category : #accessing }
FAMIXFunction >> parentScope: aScopingEntity [ 
	self deprecated: 'Please use container: instead of parentScope:'.
	self container: aScopingEntity
]
