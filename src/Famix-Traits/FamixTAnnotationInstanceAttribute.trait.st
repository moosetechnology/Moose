"
This models the actual value of an attribute in an AnnotationInstance.

In the following AnnotationInstance of Java, timeout is an annotation instance attribute :
@Test(timeout = 500)

Instance Variables:
	parentAnnotationInstance	<FAMIXAnnotationInstance>
	annotationTypeAttribute	<FAMIXAnnotationTypeAttribute>
	value	<Object>
"
Trait {
	#name : #FamixTAnnotationInstanceAttribute,
	#instVars : [
		'#parentAnnotationInstance => FMOne type: #FamixTWithAnnotationInstanceAttributes opposite: #attributes',
		'#value => FMProperty'
	],
	#traits : 'TEntityMetaLevelDependency + TDependencyQueries',
	#classTraits : 'TEntityMetaLevelDependency classTrait + TDependencyQueries classTrait',
	#category : #'Famix-Traits-AnnotationInstanceAttribute'
}

{ #category : #meta }
FamixTAnnotationInstanceAttribute classSide >> annotation [

	<FMClass: #TAnnotationInstanceAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance [
	"Relation named: #parentAnnotationInstance type: #FamixTWithAnnotationInstanceAttributes opposite: #attributes"

	<generated>
	<FMComment: 'The instance of the annotation in which the attribute is used.'>
	<container>
	^ parentAnnotationInstance
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance: anObject [

	<generated>
	parentAnnotationInstance := anObject
]

{ #category : #navigation }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstanceGroup [
	<generated>
	<navigation: 'ParentAnnotationInstance'>
	^ MooseGroup with: self parentAnnotationInstance
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> value [

	<FMProperty: #value type: #String>
	<generated>
	<FMComment: 'Actual value of the attribute used in an annotation'>
	^ value
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> value: anObject [
	<generated>
	value := anObject
]
