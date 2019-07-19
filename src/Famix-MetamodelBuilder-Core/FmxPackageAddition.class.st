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
