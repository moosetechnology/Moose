Class {
	#name : #FAMIXModel,
	#superclass : #MooseModel,
	#category : #'Famix-Compatibility-Entities'
}

{ #category : #accessing }
FAMIXModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FAMIXModel class >> annotation [
	<MSEClass: #FAMIXModel super: #MooseModel>
	<package: #FAMIX>
	<generated>
]
