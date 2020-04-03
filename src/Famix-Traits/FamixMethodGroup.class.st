Class {
	#name : #FamixMethodGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixMethodGroup class >> annotation [

	<FMClass: #MethodGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixMethodGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #navigation }
FamixMethodGroup >> allClasses [
	^ FamixTypeGroup withAll: (self entities flatCollectAsSet: [ :m | m atScope: FamixTClass ])
]

{ #category : #navigation }
FamixMethodGroup >> allMethods [
	^ self
]

{ #category : #navigation }
FamixMethodGroup >> allPackages [
	^ FamixPackageGroup withAll: (self entities flatCollectAsSet: [ :m | m atScope: FamixTPackage ])
]

{ #category : #metrics }
FamixMethodGroup >> averageNumberOfInvocations [
	<FMProperty: #averageNumberOfInvocations type: #Number>
	<FMComment: 'Average number of invocations per methods'>

	^self
		lookUpPropertyNamed: #averageNumberOfInvocations
		computedAs: [self average: [:each | each numberOfOutgoingInvocations ]]
]

{ #category : #metrics }
FamixMethodGroup >> averageNumberOfLinesOfCode [
	<FMProperty: #averageNumberOfLinesOfCode type: #Number>
	<FMComment: 'Average number of lines of code per methods'>

	^self
		lookUpPropertyNamed: #averageNumberOfLinesOfCode
		computedAs: [self average: [:each | each numberOfLinesOfCode ]]
]

{ #category : #metrics }
FamixMethodGroup >> averageNumberOfParameters [
	<FMProperty: #averageNumberOfParameters type: #Number>
	<FMComment: 'Average number of parameters per methods'>
	
	^self
		lookUpPropertyNamed: #averageNumberOfParameters
		computedAs: [self average: [:each | each numberOfParameters]]
]
