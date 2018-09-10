"
This browser shows packages and the containing classes.

self openOn: MooseModel root allModels first allPackages
"
Class {
	#name : #MoosePackagesCodeBrowser,
	#superclass : #MooseCodeBrowser,
	#category : #'Moose-Finder'
}

{ #category : #building }
MoosePackagesCodeBrowser >> parentOfClass: aClass [
	^ aClass parentPackage
]
