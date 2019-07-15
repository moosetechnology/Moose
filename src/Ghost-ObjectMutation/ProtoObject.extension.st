Extension { #name : #ProtoObject }

{ #category : #'*Ghost-ObjectMutation' }
ProtoObject >> ghMutation [
	^nil
]

{ #category : #'*Ghost-ObjectMutation' }
ProtoObject >> hasGHMutation [
	^false
]

{ #category : #'*Ghost-ObjectMutation' }
ProtoObject >> injectGHMutation: anObjectMutation [
	| helper |
	helper := self class newAnonymousSubclass.
	
	GHMetaMessages setClass: helper to: self.
	helper becomeForward: anObjectMutation 
]

{ #category : #'*Ghost-ObjectMutation' }
ProtoObject >> recoverFromGHMutation [
]
