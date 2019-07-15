Class {
	#name : #OnMooseUsagesOfPackagePrefixInMSEClassInMetaAnnotations,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseUsagesOfPackagePrefixInMSEClassInMetaAnnotations >> computeResult [ 
	
	^ self model allAnnotationTypes 
			entityNamed: #'MSEClass:super:' 
			ifAbsent: [#()] 
			ifPresent: [ :ann | 
				(ann instances select: [ :each | 
					| annInstances packageInstance |
					annInstances := each annotatedEntity annotationInstances.
					packageInstance := annInstances detect: [ :inst | inst name = #package: ] ifNone: [ nil ].
					packageInstance
						ifNil: [false]
						ifNotNil: [
							| packageName |
							packageName := packageInstance attributes first value.
							each attributes first value prefixMatchesRegex: packageName ]]) asMooseGroup ]
]

{ #category : #accessing }
OnMooseUsagesOfPackagePrefixInMSEClassInMetaAnnotations >> explanation [

	^ '<MSEClass:super:> should use the fame name to point to the mse class'
]

{ #category : #accessing }
OnMooseUsagesOfPackagePrefixInMSEClassInMetaAnnotations >> label [

	^ 'Use of the package and fame name instead of fame name to denote mse class'
]

{ #category : #accessing }
OnMooseUsagesOfPackagePrefixInMSEClassInMetaAnnotations >> stakeholder [

	^ OnMoosePeople tudorGirba
]
