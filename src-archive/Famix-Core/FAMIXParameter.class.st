"
FAMIXParameter represents one parameter in a method declaration.
"
Class {
	#name : #FAMIXParameter,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'parentBehaviouralEntity'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXParameter class >> annotation [
	<MSEClass: #Parameter super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXParameter >> belongsTo [

	^ self parentBehaviouralEntity
]

{ #category : #accessing }
FAMIXParameter >> belongsTo: aBehaviouralEntity [ 
	self parentBehaviouralEntity: aBehaviouralEntity 
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameter >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameter >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #accessing }
FAMIXParameter >> parentBehaviouralEntity [
	<MSEProperty: #parentBehaviouralEntity type: #FAMIXBehaviouralEntity opposite: #parameters>
	<MSEComment: 'Behavioural entity containing this parameter. belongsTo implementation'>
	<container>
	
	^parentBehaviouralEntity
]

{ #category : #accessing }
FAMIXParameter >> parentBehaviouralEntity: aBehaviouralEntity [
	parentBehaviouralEntity := FMMultivalueLink on: self
					update: #parameters
					from: self parentBehaviouralEntity
					to: aBehaviouralEntity.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameter >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
