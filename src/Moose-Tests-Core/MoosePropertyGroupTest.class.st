Class {
	#name : #MoosePropertyGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
MoosePropertyGroupTest >> testBasic [
	| allClasses propertyGroup |
	allClasses := {(FamixTest1Class new numberOfLinesOfCode: 10) . (FamixTest1Class new numberOfLinesOfCode: 20). (FamixTest1Class new numberOfLinesOfCode: 30)} asMooseGroup.
	propertyGroup := MoosePropertyGroup withAll: (allClasses copyFrom: 1 to: 2) from: allClasses using: #numberOfLinesOfCode.

	self assert: propertyGroup originalGroup identicalTo: allClasses.
	self assert: propertyGroup property identicalTo: #numberOfLinesOfCode.
	self assert: propertyGroup propertyRatio equals: 0.5.
	self assert: propertyGroup propertyTotal equals: 30.
	self assert: propertyGroup asMooseGroup class identicalTo: FAMIXClassGroup.
	self assert: propertyGroup propertyTotalOriginal equals: 60.
	self assert: (propertyGroup sizeRatio * 100) asInteger equals: 66.
	self assert: propertyGroup sizeOriginal equals: allClasses size
]
