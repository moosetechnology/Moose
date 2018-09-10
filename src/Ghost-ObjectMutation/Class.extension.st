Extension { #name : #Class }

{ #category : #'*Ghost-ObjectMutation' }
Class >> injectGHMutation: anObjectMutation [

	GHMetaMessages setClass: anObjectMutation to: self.

]
