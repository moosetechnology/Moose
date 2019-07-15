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
		'#value'
	],
	#category : #'Famix-Traits-AnnotationInstanceAttribute'
}

{ #category : #meta }
FamixTAnnotationInstanceAttribute classSide >> annotation [

	<MSEClass: #TAnnotationInstanceAttribute super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTAnnotationInstanceAttribute classSide >> generatedSlotNames [
	<generated>
	'FamixTAnnotationInstanceAttribute class>>#generatedSlotNames'.
	^ #(parentAnnotationInstance value)
]

{ #category : #generator }
FamixTAnnotationInstanceAttribute classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance [

	<generated>
	<MSEComment: 'The instance of the annotation in which the attribute is used.'>
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
	^ MooseGroup
			with: (self parentAnnotationInstance)
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> value [

	<MSEProperty: #value type: #String>
	<generated>
	<MSEComment: 'Actual value of the attribute used in an annotation'>
	^ value
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> value: anObject [

	<generated>
	value := anObject

]
