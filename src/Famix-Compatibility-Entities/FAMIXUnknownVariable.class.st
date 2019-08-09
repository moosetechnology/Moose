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
