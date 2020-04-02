Class {
	#name : #FamixTMethodGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTMethodGroup class >> annotation [

	<FMClass: #TMethodGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTMethodGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #navigation }
FamixTMethodGroup >> allClasses [
	^ FamixTTypeGroup withAll: (self entities flatCollectAsSet: [ :m | m atScope: FamixTClass ])
]

{ #category : #navigation }
FamixTMethodGroup >> allMethods [

	^ self
]

{ #category : #navigation }
FamixTMethodGroup >> allPackages [
	^ FamixTPackageGroup withAll: (self entities flatCollectAsSet: [ :m | m atScope: FamixTPackage ])
]

{ #category : #metrics }
FamixTMethodGroup >> averageNumberOfInvocations [
	<FMProperty: #averageNumberOfInvocations type: #Number>
	<FMComment: 'Average number of invocations per methods'>

	^self
		lookUpPropertyNamed: #averageNumberOfInvocations
		computedAs: [self average: [:each | each numberOfOutgoingInvocations ]]
]

{ #category : #metrics }
FamixTMethodGroup >> averageNumberOfLinesOfCode [
	<FMProperty: #averageNumberOfLinesOfCode type: #Number>
	<FMComment: 'Average number of lines of code per methods'>

	^self
		lookUpPropertyNamed: #averageNumberOfLinesOfCode
		computedAs: [self average: [:each | each numberOfLinesOfCode ]]
]

{ #category : #metrics }
FamixTMethodGroup >> averageNumberOfParameters [
	<FMProperty: #averageNumberOfParameters type: #Number>
	<FMComment: 'Average number of parameters per methods'>
	
	^self
		lookUpPropertyNamed: #averageNumberOfParameters
		computedAs: [self average: [:each | each numberOfParameters]]
]
