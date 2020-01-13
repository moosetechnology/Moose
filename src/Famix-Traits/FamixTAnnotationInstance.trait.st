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
	#traits : 'TEntityMetaLevelDependency + TDependencyQueries',
	#classTraits : 'TEntityMetaLevelDependency classTrait + TDependencyQueries classTrait',
	#category : #'Famix-Traits-AnnotationInstance'
}

{ #category : #meta }
FamixTAnnotationInstance classSide >> annotation [

	<FMClass: #TAnnotationInstance super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTAnnotationInstance classSide >> famixTAnnotationInstanceRelatedGroup [

	<mooseGroup>
	
	^ FAMIXAnnotationInstanceGroup
]

{ #category : #accessing }
FamixTAnnotationInstance >> annotatedEntity [
	"Relation named: #annotatedEntity type: #FamixTWithAnnotationInstances opposite: #annotationInstances"

	<generated>
	<FMComment: 'The NamedEntity on which the annotation occurs.'>
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
	^ MooseGroup with: self annotatedEntity
]
