"
FAMIXImplicitVariable represents a variable defined by the compiler in a context, such as self, super, thisContext.
"
Class {
	#name : #FAMIXImplicitVariable,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'parentBehaviouralEntity'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXImplicitVariable class >> annotation [
	<MSEClass: #ImplicitVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXImplicitVariable >> belongsTo [
	^ self parentBehaviouralEntity  
]

{ #category : #accessing }
FAMIXImplicitVariable >> belongsTo: aBehaviouralEntity [
	self parentBehaviouralEntity: aBehaviouralEntity 
]

{ #category : #accessing }
FAMIXImplicitVariable >> container [
	self deprecated: 'Please use parentBehaviouralEntity instead'.  
	^ self parentBehaviouralEntity
]

{ #category : #accessing }
FAMIXImplicitVariable >> container: aBehaviouralEntity [
	self deprecated: 'Please use #parentBehaviouralEntity: instead'.
	^ self parentBehaviouralEntity: aBehaviouralEntity
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXImplicitVariable >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXImplicitVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #accessing }
FAMIXImplicitVariable >> parentBehaviouralEntity [
	<MSEProperty: #parentBehaviouralEntity type: #FAMIXBehaviouralEntity opposite: #implicitVariables>
	<MSEComment: 'The behaviour containing this implicit variable. belongsTo implementation'>
	<container>


	^ parentBehaviouralEntity
]

{ #category : #accessing }
FAMIXImplicitVariable >> parentBehaviouralEntity: aBehaviouralEntity [
	parentBehaviouralEntity := FMMultivalueLink on: self
					update: #implicitVariables
					from: self parentBehaviouralEntity
					to: aBehaviouralEntity.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXImplicitVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
