"
FAMIXLocalVariable represents a local variable in the scope of a behavioural entity.
"
Class {
	#name : #FAMIXLocalVariable,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'parentBehaviouralEntity'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXLocalVariable class >> annotation [
	<MSEClass: #LocalVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXLocalVariable >> belongsTo [

	^ self parentBehaviouralEntity
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXLocalVariable >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXLocalVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #accessing }
FAMIXLocalVariable >> parentBehaviouralEntity [
	<MSEProperty: #parentBehaviouralEntity type: #FAMIXBehaviouralEntity opposite: #localVariables> 
	<MSEComment: 'Behavioural entity declaring this local variable. belongsTo implementation'>
	<container>
	^parentBehaviouralEntity
]

{ #category : #accessing }
FAMIXLocalVariable >> parentBehaviouralEntity: aBehaviouralEntity [
	parentBehaviouralEntity := FMMultivalueLink on: self
					update: #localVariables
					from: self parentBehaviouralEntity
					to: aBehaviouralEntity.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXLocalVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
