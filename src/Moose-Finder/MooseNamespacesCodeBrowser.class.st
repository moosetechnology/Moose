"
This browser shows namespaces and the containing classes.

self openOn: MooseModel root allModels last allNamespaces
"
Class {
	#name : #MooseNamespacesCodeBrowser,
	#superclass : #MooseCodeBrowser,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseNamespacesCodeBrowser >> parentOfClass: aClass [
	^ aClass belongsTo
]
