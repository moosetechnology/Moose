"
Description
--------------------

I represent a change that would create a package during a Famix generation.

Examples
--------------------

	FmxPackageAddition named: 'Famix-Example-Entities'
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	packageName:		<aString>		Name of the package to create.
"
Class {
	#name : #FmxPackageAddition,
	#superclass : #FmxCodeChange,
	#instVars : [
		'packageName'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxPackageAddition class >> named: aName [
	^ self new
		packageName: aName;
		yourself
]

{ #category : #accessing }
FmxPackageAddition >> apply [
	RPackageOrganizer default createPackageNamed: self packageName
]

{ #category : #accessing }
FmxPackageAddition >> packageName [ 

	^ packageName
]

{ #category : #initialization }
FmxPackageAddition >> packageName: aPackageName [
	packageName := aPackageName
]
