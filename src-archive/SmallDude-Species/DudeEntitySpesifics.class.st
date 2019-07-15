"
this tells the detector how to parse the given entities, and what to ignore from them.
"
Class {
	#name : #DudeEntitySpesifics,
	#superclass : #Object,
	#category : #'SmallDude-Species'
}

{ #category : #parsing }
DudeEntitySpesifics class >> attachInformationTo: aSourceCodeLineList from: model [ 
	 
	self subclassResponsibility
]

{ #category : #parsing }
DudeEntitySpesifics class >> cleaners [ 
	 
	self subclassResponsibility
]
