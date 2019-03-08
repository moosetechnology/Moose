Class {
	#name : #MooseAbstractMenuEntry,
	#superclass : #Object,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseAbstractMenuEntry >> execute [
	"Code to be executed"
	self subclassResponsibility
]

{ #category : #execution }
MooseAbstractMenuEntry >> label [
	^ self subclassResponsibility 
]

{ #category : #execution }
MooseAbstractMenuEntry >> run [
	self execute
]

{ #category : #execution }
MooseAbstractMenuEntry >> version [
	^ self subclassResponsibility
]
