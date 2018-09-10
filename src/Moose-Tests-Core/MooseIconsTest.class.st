Class {
	#name : #MooseIconsTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
MooseIconsTest >> testIcons [

#(#mooseNavigation #mooseSearch #famixNamespaceGroup #mooseImportMse #mooseSourceTextPartial #mooseAdd #famixClass #mooseCancel #famixInterface #famixAnnotationType #famixNamespace #mooseImportFuel #mooseProperties #mooseIcon #famixAttributeGroup #famixFunctionGroup #famixMethodGroup #mooseInspect #mooseSourceText #mooseDSM #mooseMetamodelGroup #icons #mooseRemove #famixPackageGroup #mooseSystemComplexity #famixMethod #mooseCycles #mooseMetamodelEntity #resetIcons #famixAttribute #famixFunction #mooseEvaluator #famixPackage #famixInterfaceGroup #mooseBlueprint #mooseAccept #mooseList #famixAnnotationTypeGroup #famixClassGroup #mooseDependencies #mooseImportSmalltalk)
	do: [ :k | 
		self shouldnt: [ MooseIcons perform: k ] raise: Error
		 ]
]
