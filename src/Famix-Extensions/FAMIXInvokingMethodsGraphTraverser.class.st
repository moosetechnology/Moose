Class {
	#name : #FAMIXInvokingMethodsGraphTraverser,
	#superclass : #FAMIXGraphTraverser,
	#category : #'Famix-Extensions'
}

{ #category : #running }
FAMIXInvokingMethodsGraphTraverser >> traverse: aMethod [
	^ aMethod invokingMethods
]
