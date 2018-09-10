Class {
	#name : #MoosePropertyGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #utility }
MoosePropertyGroupTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #tests }
MoosePropertyGroupTest >> testBasic [
	|  allClasses propertyGroup |
	allClasses := {
		FAMIXClass new numberOfLinesOfCode: 10.
		FAMIXClass new numberOfLinesOfCode: 20.
		FAMIXClass new numberOfLinesOfCode: 30 } asMooseGroup.
	propertyGroup := MoosePropertyGroup
		withAll: (allClasses copyFrom: 1 to: 2)
		from: allClasses
		using: #numberOfLinesOfCode.
	self assert: propertyGroup originalGroup == allClasses.
	self assert: propertyGroup property == #numberOfLinesOfCode.
	self assert: propertyGroup propertyRatio equals: 0.5.
	self assert: propertyGroup propertyTotal equals: 30.
	self assert: propertyGroup asMooseGroup class == FAMIXClassGroup.
	self assert: propertyGroup propertyTotalOriginal equals: 60.
	self assert: (propertyGroup sizeRatio * 100) asInteger equals: 66.
	self assert: propertyGroup sizeOriginal equals: allClasses size
]
