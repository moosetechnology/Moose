"
This is an exception explicitly thrown by a method.
"
Class {
	#name : #FAMIXThrownException,
	#superclass : #FAMIXException,
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXThrownException class >> annotation [
	<MSEClass: #ThrownException super: #FAMIXException>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXThrownException >> definingMethod [
	<MSEProperty: #definingMethod type: #FAMIXMethod opposite: #thrownExceptions>
	<MSEComment: 'Method throwing the exception'>
	^ definingMethod
]

{ #category : #accessing }
FAMIXThrownException >> definingMethod: aMethod [ 
	definingMethod := FMMultivalueLink 
		on: self
		update: #thrownExceptions
		from: self definingMethod
		to: aMethod
]
