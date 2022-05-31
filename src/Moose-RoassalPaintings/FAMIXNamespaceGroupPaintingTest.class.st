Class {
	#name : #FAMIXNamespaceGroupPaintingTest,
	#superclass : #TestCase,
	#category : #'Moose-RoassalPaintings-Test'
}

{ #category : #tests }
FAMIXNamespaceGroupPaintingTest >> testViewHierarchy [

	| group |
	group := FamixNamespaceGroup new.
	group add: FamixStNamespace new.
	group add: FamixStNamespace new.
	group hierarchy open delete
]
