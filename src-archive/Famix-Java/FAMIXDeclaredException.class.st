"
This is an exception explicitly declared as being thrown by a method.
"
Class {
	#name : #FAMIXDeclaredException,
	#superclass : #FAMIXException,
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXDeclaredException class >> annotation [
	<MSEClass: #DeclaredException super: #FAMIXException>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXDeclaredException >> definingMethod [
	<MSEProperty: #definingMethod type: #FAMIXMethod opposite: #declaredExceptions>
	<MSEComment: 'Methods declaring this exception'>
	^ definingMethod
]

{ #category : #accessing }
FAMIXDeclaredException >> definingMethod: aMethod [ 
	definingMethod := FMMultivalueLink 
		on: self
		update: #declaredExceptions
		from: self definingMethod
		to: aMethod
]
