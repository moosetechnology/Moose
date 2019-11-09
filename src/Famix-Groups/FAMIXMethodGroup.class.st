"
FAMIXMethodGroup is a MooseGroup containing only FAMIX enities of type FAMIXMethod.
"
Class {
	#name : #FAMIXMethodGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXMethodGroup class >> annotation [
	<FMClass: #MethodGroup super: #MooseGroup>
	<package: #FAMIX>

]

{ #category : #navigation }
FAMIXMethodGroup >> allClasses [
	^ FAMIXTypeGroup withAll: (self entities flatCollectAsSet: [ :m | m atScope: FamixTClass ])
]

{ #category : #navigation }
FAMIXMethodGroup >> allMethods [

	^ self
]

{ #category : #navigation }
FAMIXMethodGroup >> allPackages [
	^ FAMIXPackageGroup withAll: (self entities flatCollectAsSet: [ :m | m atScope: FamixTPackage ])
]

{ #category : #metrics }
FAMIXMethodGroup >> averageNumberOfInvocations [
	<FMProperty: #averageNumberOfInvocations type: #Number>
	<FMComment: 'Average number of invocations per methods'>

	^self
		lookUpPropertyNamed: #averageNumberOfInvocations
		computedAs: [self average: [:each | each numberOfOutgoingInvocations ]]
]

{ #category : #metrics }
FAMIXMethodGroup >> averageNumberOfLinesOfCode [
	<FMProperty: #averageNumberOfLinesOfCode type: #Number>
	<FMComment: 'Average number of lines of code per methods'>

	^self
		lookUpPropertyNamed: #averageNumberOfLinesOfCode
		computedAs: [self average: [:each | each numberOfLinesOfCode ]]
]

{ #category : #metrics }
FAMIXMethodGroup >> averageNumberOfParameters [
	<FMProperty: #averageNumberOfParameters type: #Number>
	<FMComment: 'Average number of parameters per methods'>
	
	^self
		lookUpPropertyNamed: #averageNumberOfParameters
		computedAs: [self average: [:each | each numberOfParameters]]
]
