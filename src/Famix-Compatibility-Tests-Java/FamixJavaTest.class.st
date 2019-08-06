Class {
	#name : #FamixJavaTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Java'
}

{ #category : #tests }
FamixJavaTest >> testImportAnnotations [
	| model |
	model := MooseModel new.
	model
		importFromMSEStream:
			'(
		(FAMIX.Namespace (id: 100) (name ''aNamespace''))				
		(FAMIX.Class (id: 1) (name ''AClass''))
		(FAMIX.Class (id: 10) (name ''AnotherClass''))
		(FAMIX.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)))
		(FAMIX.Class (id: 3) (name ''AnAnnotationDefinitionClass''))
		(FAMIX.AnnotationType (id: 4) (name ''AnAnnotation'') (container (ref: 100)))
		(FAMIX.Class (id: 5) (name ''AnotherAnnotationDefinitionClass''))
		(FAMIX.AnnotationType (id: 6) (name ''AnotherAnnotation'') (container (ref: 100)))
		(FAMIX.AnnotationInstance (id: 7) (annotatedEntity (ref: 1)) (annotationType (ref: 4)))
		(FAMIX.AnnotationInstance (id: 8) (annotatedEntity (ref: 10)) (annotationType (ref: 4)))
		(FAMIX.AnnotationInstance (id: 9) (annotatedEntity (ref: 2)) (annotationType (ref: 6)))
	)' readStream.
	self assert: model entities size equals: 11.
	self assert: model allAnnotationTypes size equals: 2.
	self assert: model allAnnotationInstances size equals: 3.
	model allAnnotationInstances
		do: [ :i | 
			self assert: (i annotationType instances includes: i).
			self assert: (i annotatedEntity annotationInstances includes: i) ].
	self assert: (model allAnnotationTypes entityNamed: #aNamespace::AnAnnotation) instances size equals: 2.
	self assert: (model allAnnotationTypes entityNamed: #aNamespace::AnotherAnnotation) instances size equals: 1.
	model allAnnotationTypes
		do: [ :each | 
			self assert: (each container definedAnnotationTypes includes: each).
			self assert: each container == each belongsTo ]
]

{ #category : #tests }
FamixJavaTest >> testImportExceptions [
	| model |
	model := MooseModel new.
	model
		importFromMSEStream:
			'(
				(FAMIX.Class (id: 1) (name ''AClass''))
				(FAMIX.Class (id: 2) (name ''AnotherClass''))
				(FAMIX.Method (id: 3) (name ''method1'') (parentType (ref: 1)))
				(FAMIX.Method (id: 4) (name ''method2'') (parentType (ref: 1)))
				(FAMIX.Method (id: 5) (name ''method3'') (parentType (ref: 1)))
				(FAMIX.Method (id: 6) (name ''method4'') (parentType (ref: 1)))
				(FAMIX.Class (id: 10) (name ''ExceptionA''))
				(FAMIX.Class (id: 11) (name ''ExceptionB''))
				(FAMIX.DeclaredException (definingEntity (ref: 3)) (exceptionClass (ref: 10)))
				(FAMIX.DeclaredException (definingEntity (ref: 4)) (exceptionClass (ref: 10)))
				(FAMIX.DeclaredException (definingEntity (ref: 4)) (exceptionClass (ref: 11)))
				(FAMIX.ThrownException (definingEntity (ref: 3)) (exceptionClass (ref: 10)))
				(FAMIX.ThrownException (definingEntity (ref: 4)) (exceptionClass (ref: 11)))
				(FAMIX.CaughtException (definingEntity (ref: 5)) (exceptionClass (ref: 11)))
				(FAMIX.CaughtException (definingEntity (ref: 6)) (exceptionClass (ref: 11)))
			)' readStream.
	self assert: model entities size equals: 15.
	self assert: model allDeclaredExceptions size equals: 3.
	self assert: model allThrownExceptions size equals: 2.
	self assert: model allCaughtExceptions size equals: 2.
	model allDeclaredExceptions do: [ :each | self assert: (each definingEntity declaredExceptions includes: each) ].
	model allThrownExceptions do: [ :each | self assert: (each definingEntity thrownExceptions includes: each) ].
	model allCaughtExceptions do: [ :each | self assert: (each definingEntity caughtExceptions includes: each) ]
]

{ #category : #tests }
FamixJavaTest >> testInferNamespaces [
	| model |
	model := MooseModel new.
	model add: (FAMIXNamespace new name: 'org.project.package1').
	model add: (FAMIXNamespace new name: 'org.project.package2').
	self assert: model allNamespaces size equals: 2.
	model inferNamespaceParentsBasedOnNames.
	self assert: model allNamespaces size equals: 4
]
