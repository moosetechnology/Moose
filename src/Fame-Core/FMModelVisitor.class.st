"
Description
--------------------

I am an abstract visitor able to visit a FMModel, FM3Package, FM3Class or FM3Propery.
"
Class {
	#name : #FMModelVisitor,
	#superclass : #Object,
	#category : #'Fame-Core-Visitors'
}

{ #category : #visiting }
FMModelVisitor class >> visit: aFMEntity [
	^ self new visit: aFMEntity
]

{ #category : #visiting }
FMModelVisitor >> visit: aFM3Entity [
	^ aFM3Entity accept: self
]

{ #category : #visiting }
FMModelVisitor >> visitAll: aCollection [
	^ aCollection collect: [ :elem | elem accept: self ]
]

{ #category : #visiting }
FMModelVisitor >> visitClass: aFM3Class [
	^ self visitAll: aFM3Class properties
]

{ #category : #visiting }
FMModelVisitor >> visitConstant: aFM3Constant [
	^ self visitClass: aFM3Constant
]

{ #category : #visiting }
FMModelVisitor >> visitModel: aFMModel [
	^ self visitAll: aFMModel packages
]

{ #category : #visiting }
FMModelVisitor >> visitPackage: aFM3Package [
	^ self visitAll: aFM3Package classes
]

{ #category : #visiting }
FMModelVisitor >> visitPrimitive: aFM3Primitive [
	^ self visitConstant: aFM3Primitive
]

{ #category : #visiting }
FMModelVisitor >> visitProperty: aFM3Property [
	^ self subclassResponsibility
]
