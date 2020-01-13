"
Description
--------------------

I am a generic visitor adding a generic visit element method compared to my superclass.
"
Class {
	#name : #FMGenericModelVisitor,
	#superclass : #FMModelVisitor,
	#category : #'Fame-Core-Visitors'
}

{ #category : #visiting }
FMGenericModelVisitor >> visitClass: aFM3Class [
	self visitElement: aFM3Class.
	^ super visitClass: aFM3Class
]

{ #category : #visiting }
FMGenericModelVisitor >> visitElement: aFM3Element [
	self subclassResponsibility
]

{ #category : #visiting }
FMGenericModelVisitor >> visitPackage: aFM3Package [
	self visitElement: aFM3Package.
	^ super visitPackage: aFM3Package
]

{ #category : #visiting }
FMGenericModelVisitor >> visitProperty: aFM3Property [
	^ self visitElement: aFM3Property
]
