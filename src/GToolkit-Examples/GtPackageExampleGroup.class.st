Class {
	#name : #GtPackageExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'examplePackage',
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtPackageExampleGroup >> examplePackage [
	^ examplePackage
]

{ #category : #accessing }
GtPackageExampleGroup >> examplePackage: anObject [
	examplePackage := anObject.
	examples := examplePackage gtExamplesContained collect: [ :each | each asExampleWithResult ]
]

{ #category : #accessing }
GtPackageExampleGroup >> examples [
	^ examples
]
