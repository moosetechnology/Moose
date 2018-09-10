"
I'm a node filter. 
A xpath node applies me to filter xml elements. 
"
Class {
	#name : #PPXPathFilter,
	#superclass : #Object,
	#category : #'PetitXPath-Nodes'
}

{ #category : #resolving }
PPXPathFilter >> resolveOn: anArray [
	self subclassResponsibility
]
