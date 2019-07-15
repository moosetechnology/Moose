Extension { #name : #TDependencyQueries }

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryAllIncomingAssociations [
	"Be careful while using me. I hardcode the associations I should query. Users can override me if they want to query only certain types of association for performance reasons. If you prefere to be sure of your results you should use #queryAllIncoming instead."

	^ self queryStaticIncomingAssociations
		addAll: self queryAllIncomingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryAllIncomingInvocations [
	^ self queryIncoming: FamixTInvocation
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryAllOutgoingAssociations [
	"Be careful while using me. I hardcode the associations I should query. Users can override me if they want to query only certain types of association for performance reasons. If you prefere to be sure of your results you should use #queryAllOutgoing instead."

	^ self queryStaticOutgoingAssociations
		addAll: self queryAllOutgoingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryAllOutgoingInvocations [
	^ self queryOutgoing: FamixTInvocation
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryIncomingAccesses [
	^ self queryIncoming: FamixTAccess
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryIncomingReferences [
	^ self queryIncoming: FamixTReference
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryOutgoingAccesses [
	^ self queryOutgoing: FamixTAccess
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryOutgoingReferences [
	^ self queryOutgoing: FamixTReference
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryStaticIncomingAssociations [
	^ self queryIncomingAccesses
		addAll: self queryIncomingReferences;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> queryStaticOutgoingAssociations [
	^ self queryOutgoingAccesses
		addAll: self queryOutgoingReferences;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> querySureIncomingAssociations [
	^ self queryStaticIncomingAssociations
		addAll: self querySureIncomingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> querySureIncomingInvocations [
	^ self queryAllIncomingInvocations select: [ :invo | invo isASureInvocation ]
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> querySureOutgoingAssociations [
	^ self queryStaticOutgoingAssociations
		addAll: self querySureOutgoingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TDependencyQueries >> querySureOutgoingInvocations [
	^ self queryAllOutgoingInvocations select: [ :invo | invo isASureInvocation ]
]
