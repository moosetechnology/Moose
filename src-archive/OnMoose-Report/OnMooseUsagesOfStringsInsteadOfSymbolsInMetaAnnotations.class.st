Class {
	#name : #OnMooseUsagesOfStringsInsteadOfSymbolsInMetaAnnotations,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseUsagesOfStringsInsteadOfSymbolsInMetaAnnotations >> computeResult [ 
	
	^ self model allAnnotationTypes 
			entityNamed: #'MSEClass:super:' 
			ifAbsent: [#()] 
			ifPresent: [:ann | 
				(ann instances select: [:each | each attributes second value isSymbol not]) asMooseGroup ]
]

{ #category : #accessing }
OnMooseUsagesOfStringsInsteadOfSymbolsInMetaAnnotations >> explanation [
	^ '<MSEClass:superclass: > should use a symbol to point to the superclass'
]

{ #category : #accessing }
OnMooseUsagesOfStringsInsteadOfSymbolsInMetaAnnotations >> label [
	^ 'Use of string instead of symbol to denote superclass'
]

{ #category : #accessing }
OnMooseUsagesOfStringsInsteadOfSymbolsInMetaAnnotations >> stakeholder [
	^ OnMoosePeople tudorGirba
]
