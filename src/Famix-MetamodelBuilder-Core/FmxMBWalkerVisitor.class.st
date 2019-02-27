"
I implement a simple visitor walk of the tree starting in aBuilder.

Use me if you don't want to think about the order the builder should be walked in, by calling my methods whenever you want a node to visit his children.

Example: 

visitClass: aClass
	aClass doStuff.
	super visitClass: aClass. ""call accepts on the children of the class""
	aclass doMoreStuff.
"
Class {
	#name : #FmxMBWalkerVisitor,
	#superclass : #FmxMBVisitor,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visiting }
FmxMBWalkerVisitor >> visitBuilder: aBuilder [
	"Visit every Traits, and classes after that."
	aBuilder sortedTraits do: [ :each | each acceptVisitor: self ].
	aBuilder sortedClasses do: [ :each | each acceptVisitor: self ].	
]

{ #category : #visiting }
FmxMBWalkerVisitor >> visitClass: aClass [
	"Visit all properties of aClass"

	aClass properties do: [ :each | each acceptVisitor: self ].

]

{ #category : #visiting }
FmxMBWalkerVisitor >> visitRelationSide: aRelationSide [
	"Node leaf, no more walking needed"
]

{ #category : #visiting }
FmxMBWalkerVisitor >> visitTrait: aTrait [
	"visit aTrait leaves"
	aTrait properties do: [ :each | each acceptVisitor: self ].
]

{ #category : #visiting }
FmxMBWalkerVisitor >> visitTypedProperty: aTypedProperty [
	"Leaf node, no more walk needed."

]
