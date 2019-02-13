Class {
	#name : #RTDataFramePlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTDataFramePlugin >> description [
	^ 'DataFrame is a tabular data structures for data analysis'
]

{ #category : #hooks }
RTDataFramePlugin >> execute [
	Metacello new
	  baseline: 'DataFrame';
	  repository: 'github://PolyMathOrg/DataFrame';
	  load.
]

{ #category : #testing }
RTDataFramePlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'DataFrame-Core'
 
]

{ #category : #hooks }
RTDataFramePlugin >> label [
	^ 'Data Frame'
]
