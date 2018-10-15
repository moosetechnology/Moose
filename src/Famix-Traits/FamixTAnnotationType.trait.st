"
FAMIXAnnotationType represents the type of an annotation. In some languages, Java and C#, an annotation as an explicit type. An AnnotationType can have a container in which it resides.

Instance Variables:
	instances	<(FMMultivalueLink of: FAMIXAnnotationInstance)>
	container	<FAMIXContainerEntity>
"
Trait {
	#name : #FamixTAnnotationType,
	#instVars : [
		'#annotationTypesContainer => FMOne type: #FamixTWithAnnotationTypes opposite: #definedAnnotationTypes',
		'#instances => FMMany type: #FamixTTypedAnnotationInstance opposite: #annotationType'
	],
	#category : #'Famix-Traits-AnnotationType'
}

{ #category : #meta }
FamixTAnnotationType classSide >> annotation [

	<MSEClass: #TAnnotationType super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTAnnotationType classSide >> generatedSlotNames [
	<generated>
	'FamixTAnnotationType class>>#generatedSlotNames'.
	^ #(annotationTypesContainer instances)
]

{ #category : #generator }
FamixTAnnotationType classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTAnnotationType >> annotationTypesContainer [

	<generated>
	<MSEComment: 'Container in which an AnnotationType may reside'>
	<container>

	^ annotationTypesContainer
]

{ #category : #accessing }
FamixTAnnotationType >> annotationTypesContainer: anObject [

	<generated>
	annotationTypesContainer := anObject

]

{ #category : #navigation }
FamixTAnnotationType >> annotationTypesContainerGroup [

	<generated>
	<navigation: 'AnnotationTypesContainer'>
	^ MooseGroup
			with: (self annotationTypesContainer)
]

{ #category : #accessing }
FamixTAnnotationType >> instances [

	<generated>
	<MSEComment: 'Annotations of this type'>
	^ instances
]

{ #category : #accessing }
FamixTAnnotationType >> instances: anObject [

	<generated>
	instances value: anObject

]
