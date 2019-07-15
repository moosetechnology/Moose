"
This is an exception that is explicitly handled by a method. For example, in Java it is an exception that appears in a catch statement.
"
Class {
	#name : #FAMIXCaughtException,
	#superclass : #FAMIXException,
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXCaughtException class >> annotation [
	<MSEClass: #CaughtException super: #FAMIXException>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXCaughtException >> definingMethod [
	<MSEProperty: #definingMethod type: #FAMIXMethod opposite: #caughtExceptions>
	<MSEComment: 'Methods catching the Exceptions'>
	^ definingMethod
]

{ #category : #accessing }
FAMIXCaughtException >> definingMethod: aMethod [ 
	definingMethod := FMMultivalueLink 
		on: self
		update: #caughtExceptions
		from: self definingMethod
		to: aMethod
]
