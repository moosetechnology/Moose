Class {
	#name : #FmxMBRemoteRelationSideGenerationStrategy,
	#superclass : #FmxMBNonRemoteRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> compileMethod: methodSource for: aRelationSide in: aClassOrTrait [
		
	aRelationSide builder environment compile: methodSource in: aClassOrTrait classified: self category package: self relationSide builder parentBuilderPackageName.
]
