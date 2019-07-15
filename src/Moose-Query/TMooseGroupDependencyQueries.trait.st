"
This trait provides a common, paradigm agnostic vocabulary to query dependencies of software entities stored in a MooseAbstractGroup.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TMooseGroupDependencyQueries,
	#category : #'Moose-Query'
}

{ #category : #querying }
TMooseGroupDependencyQueries >> queryAllIncoming [
	^ MooseIncomingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryAllIncoming ])
]

{ #category : #querying }
TMooseGroupDependencyQueries >> queryAllOutgoing [
	^ MooseOutgoingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryAllOutgoing ])
]

{ #category : #querying }
TMooseGroupDependencyQueries >> queryIncoming: aFAMIXClassAssociation [
	^ MooseIncomingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryIncoming: aFAMIXClassAssociation ])
]

{ #category : #querying }
TMooseGroupDependencyQueries >> queryLocalIncoming: aFAMIXClassAssociation [
	^ MooseIncomingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryLocalIncoming: aFAMIXClassAssociation ])
]

{ #category : #querying }
TMooseGroupDependencyQueries >> queryLocalOutgoing: aFAMIXClassAssociation [
	^ MooseOutgoingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryLocalOutgoing: aFAMIXClassAssociation ])
]

{ #category : #querying }
TMooseGroupDependencyQueries >> queryOutgoing: aFAMIXClassAssociation [
	^ MooseOutgoingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryOutgoing: aFAMIXClassAssociation ])
]
