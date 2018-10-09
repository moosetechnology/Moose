"
AnnotationInstance is an instance of an AnnotationType. It links an AnnotationType to an actual entity.

For example, the following is an annotation instance in Smalltalk.
<primitive: 'primAnyBitFromTo' module:'LargeIntegers'>.

And the following is an AnnotationInstance in Java:
@Test(timeout = 500)

Instance Variables:
	annotatedEntity	<FAMIXEntity>
	annotationType		<FAMIXAnnotationType>
"
Trait {
	#name : #FamixTAnnotationInstance,
	#instVars : [
		'#annotatedEntity => FMOne type: #FamixTWithAnnotationInstances opposite: #annotationInstances'
	],
	#category : #'Famix-Traits-AnnotationInstance'
}

{ #category : #meta }
FamixTAnnotationInstance classSide >> annotation [

	<MSEClass: #TAnnotationInstance super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTAnnotationInstance classSide >> generatedSlotNames [
	<generated>
	'FamixTAnnotationInstance class>>#generatedSlotNames'.
	^ #(annotatedEntity)
]

{ #category : #generator }
FamixTAnnotationInstance classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTAnnotationInstance >> annotatedEntity [

	<generated>
	<MSEComment: 'The NamedEntity on which the annotation occurs.'>
	<container>

	^ annotatedEntity
]

{ #category : #accessing }
FamixTAnnotationInstance >> annotatedEntity: anObject [

	<generated>
	annotatedEntity := anObject

]

{ #category : #navigation }
FamixTAnnotationInstance >> annotatedEntityGroup [

	<generated>
	<navigation: 'AnnotatedEntity'>
	^ MooseGroup
			with: (self annotatedEntity)
]
