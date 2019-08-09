Class {
	#name : #FAMIXUnknownVariable,
	#superclass : #FAMIXStructuralEntity,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
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
