Class {
	#name : #FAMIXAttributesGraphTraverser,
	#superclass : #FAMIXGraphTraverser,
	#category : #'Famix-Extensions'
}

{ #category : #running }
FAMIXAttributesGraphTraverser >> traverse: aClass [
	^ (aClass attributes "select: [:each | each hasClassScope not ]") collect: #declaredType
]
