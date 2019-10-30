"
MoosePropertyGroup is a selection over a group. The selection is specify via a predicate expressed as a symbol or a block. The original group is available using the message originalGroup.

Instance Variables:
	originalGroup	<MooseGroup>
	propertySymbolOrBlock
"
Class {
	#name : #MoosePropertyGroup,
	#superclass : #MooseGroup,
	#instVars : [
		'originalGroup',
		'propertySymbolOrBlock'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MoosePropertyGroup class >> annotation [
	<FMClass: #PropertyGroup super: #MooseGroup>
	<package: #Moose>
]

{ #category : #'instance creation' }
MoosePropertyGroup class >> withAll: aCollection from: aMooseGroup using: aSymbolOrBlock [

	^ (self withAll: aCollection) originalGroup: aMooseGroup; property: aSymbolOrBlock; yourself
]

{ #category : #accessing }
MoosePropertyGroup >> asMooseGroup [

	^ MooseGroup withAll: self
]

{ #category : #accessing }
MoosePropertyGroup >> originalGroup [
	^ originalGroup
]

{ #category : #accessing }
MoosePropertyGroup >> originalGroup: anObject [
	originalGroup := anObject
]

{ #category : #accessing }
MoosePropertyGroup >> property [
	<FMProperty: #property type: #String>
	<FMComment: 'Description of the property'>
	
	^ propertySymbolOrBlock
]

{ #category : #accessing }
MoosePropertyGroup >> property: anObject [
	propertySymbolOrBlock := anObject
]

{ #category : #accessing }
MoosePropertyGroup >> propertyRatio [
	<FMProperty: #propertyRatio type: #Number>
	<FMComment: 'Fraction represented by this group compared to originalGroup with respect to the property'>
	
	^ (self propertyTotal / self propertyTotalOriginal) asFloat 
]

{ #category : #accessing }
MoosePropertyGroup >> propertyTotal [
	<FMProperty: #propertyTotal type: #Number>
	<FMComment: 'Sum of values computed for the property in this group'>

	^ self sumNumbers: self property
]

{ #category : #accessing }
MoosePropertyGroup >> propertyTotalOriginal [
	<FMProperty: #propertyTotalOriginal type: #Number>
	<FMComment: 'Sum of values computed for the property in the original group'>

	^ self originalGroup sumNumbers: self property 
]

{ #category : #accessing }
MoosePropertyGroup >> sizeOriginal [
	<FMProperty: #sizeOriginal type: #Number>
	<FMComment: 'Size of the original group'>
	
	^ self originalGroup size
]

{ #category : #accessing }
MoosePropertyGroup >> sizeRatio [
	<FMProperty: #sizeRatio type: #Number>
	<FMComment: 'Fraction represented by this group compared to originalGroup'>	

	^ (self size / self originalGroup size) asFloat
]
