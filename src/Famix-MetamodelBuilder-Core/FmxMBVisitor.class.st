"
I am a visitor for instances of #FamixMetamodelGenerator and subclasses.

I offer methods to which will be called by visited class that accept me.

My methods are empty to serve as base implementation if you want to only override specific methods.
My methods do NOT take care of accepting me on their childrens. See #FmxMBVisitorWalker if you want that property.


A minimum builder needs to subclass FamixMetamodelGenerator, and override the class side method #package
use the #FmxMBPrintVisitor class for a working example.

general case:
b := aFamixMetamodelGeneratorClass builderWithDefinitions.
v := aFmxMBVisitorClass new.
b acceptVisitor: v.
"
Class {
	#name : #FmxMBVisitor,
	#superclass : #Object,
	#category : #'Famix-MetamodelBuilder-Core-Visitors'
}

{ #category : #visiting }
FmxMBVisitor >> visitBuilder: aBuilder [

	
]

{ #category : #visiting }
FmxMBVisitor >> visitClass: aClass [
]

{ #category : #visiting }
FmxMBVisitor >> visitRelationSide: aRelationSide [
]

{ #category : #visiting }
FmxMBVisitor >> visitTrait: aTrait [
]

{ #category : #visiting }
FmxMBVisitor >> visitTypedProperty: aTypedProperty [
]
