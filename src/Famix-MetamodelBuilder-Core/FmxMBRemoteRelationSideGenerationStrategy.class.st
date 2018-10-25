Class {
	#name : #FmxMBRemoteRelationSideGenerationStrategy,
	#superclass : #FmxMBNonremoteRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> compileMethod: methodSource for: aRelationSide in: aClassOrTrait [
		
	aRelationSide builder environment compile: methodSource in: aClassOrTrait classified: self category package: self relationSide builder parentBuilderPackageName.
]

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> producesSlot [

	<ignoreForCoverage>
	"This case should never happen because we need to know if the property creates a slot only
	during the class definition creation. The remote properties are always created on already
	existing classes with finished definition. They have always form of the method extensions."
	^ false
]
