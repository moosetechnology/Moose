"
This models the attribute defined in a Java AnnotationType. In Java, annotation type attributes have specific syntax and use.

For example, in Java the following AnnotationType has four AnnotationTypeAttributes (id, synopsis, engineer and date are attributes).

public @interface MyAnno {
    int    id();
    String synopsis(); 
    String engineer() default ""[unassigned]""; 
    String date()    default ""[unimplemented]"";
}

When using an annotation, an annotation instance is created that points back to the annotation type. The annotation instance has attributes that are annontation instance attributes and point back to their annotation type attributes.

Instance Variables:
	parentAnnotationType	<FAMIXAnnotationType>
	annotationAttributeInstances	<(FMMultivalueLink of: FAMIXAnnotationInstanceAttribute)>
"
Trait {
	#name : #FamixTAnnotationTypeAttribute,
	#instVars : [
		'#annotationAttributeInstances => FMMany type: #FamixTTypedAnnotationInstanceAttribute opposite: #annotationTypeAttribute'
	],
	#category : #'Famix-Traits-AnnotationTypeAttribute'
}

{ #category : #meta }
FamixTAnnotationTypeAttribute classSide >> annotation [

	<MSEClass: #TAnnotationTypeAttribute super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> addAnnotationAttributeInstance: anObject [
	annotationAttributeInstances add: anObject

]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> annotationAttributeInstances [
	"Relation named: #annotationAttributeInstances type: #FamixTTypedAnnotationInstanceAttribute opposite: #annotationTypeAttribute"

	<generated>
	<MSEComment: 'A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances'>
	^ annotationAttributeInstances
]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> annotationAttributeInstances: anObject [

	<generated>
	annotationAttributeInstances value: anObject

]
