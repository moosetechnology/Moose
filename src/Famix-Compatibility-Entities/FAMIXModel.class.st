Class {
	#name : #FAMIXModel,
	#superclass : #MooseModel,
	#category : #'Famix-Compatibility-Entities-Model'
}

{ #category : #accessing }
FAMIXModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FAMIXModel class >> annotation [
	<FMClass: #FAMIXModel super: #MooseModel>
	<package: #FAMIX>
	<generated>
]
