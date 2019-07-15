"
FAMIXUnknownVariable represents some unknown entity encountered while importing the project, possibly due to a syntax error in the source code.
"
Class {
	#name : #FAMIXUnknownVariable,
	#superclass : #FAMIXStructuralEntity,
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXUnknownVariable class >> annotation [
	<MSEClass: #UnknownVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXUnknownVariable >> belongsTo [
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXUnknownVariable >> namespaceScope [
	"namespaceScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXUnknownVariable >> packageScope [
	"packageScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXUnknownVariable >> typeScope [
	"typeScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]
