"
This trait provides a common, paradigm agnostic vocabulary to query dependencies of software entities stored in a MooseAbstractGroup.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TMooseGroupDependencyQueries,
	#category : #'Moose-Core-Moose-Query'
}

{ #category : #'as yet unclassified' }
TMooseGroupDependencyQueries >> queryAllIncoming [
	^ MooseIncomingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryAllIncoming ])
]

{ #category : #'as yet unclassified' }
TMooseGroupDependencyQueries >> queryAllOutgoing [
	^ MooseOutgoingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryAllOutgoing ])
]

{ #category : #'as yet unclassified' }
TMooseGroupDependencyQueries >> queryIncoming: aFAMIXClassAssociation [
	^ MooseIncomingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryIncoming: aFAMIXClassAssociation ])
]

{ #category : #'as yet unclassified' }
TMooseGroupDependencyQueries >> queryLocalIncoming: aFAMIXClassAssociation [
	^ MooseIncomingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryLocalIncoming: aFAMIXClassAssociation ])
]

{ #category : #'as yet unclassified' }
TMooseGroupDependencyQueries >> queryLocalOutgoing: aFAMIXClassAssociation [
	^ MooseOutgoingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryLocalOutgoing: aFAMIXClassAssociation ])
]

{ #category : #'as yet unclassified' }
TMooseGroupDependencyQueries >> queryOutgoing: aFAMIXClassAssociation [
	^ MooseOutgoingQueryResult on: self withAll: (self entities flatCollect: [ :m | m queryOutgoing: aFAMIXClassAssociation ])
]
