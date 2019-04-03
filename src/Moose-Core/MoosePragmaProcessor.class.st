"
I simply extend the FMPragmaProcessor to allow to filter the packages from where the meta model will be created.

Public API and Key Messages

- rejectedPackagesNames:
"
Class {
	#name : #MoosePragmaProcessor,
	#superclass : #FMPragmaProcessor,
	#instVars : [
		'rejectedPackages'
	],
	#category : #'Moose-Core'
}

{ #category : #private }
MoosePragmaProcessor >> allowPackageNamed: packageName [
	^ (rejectedPackages includes: packageName) not
]

{ #category : #initialization }
MoosePragmaProcessor >> initialize [
	super initialize.
	rejectedPackages := Set new
]

{ #category : #private }
MoosePragmaProcessor >> processClass: aClass [
	^ self processClass: aClass ifPragmaAbsent: nil
]

{ #category : #accessing }
MoosePragmaProcessor >> rejectedPackageNames: aCollection [
	"Define the Fame package that should not be imported.
	When a package is marked to be rejected, the classes and extension properties
	that are packaged in it will not be considered by the pragma processor
	and those definitions will not appear in the resulting meta repository."
	rejectedPackages := aCollection
]
