Class {
	#name : #OnMooseNoSpacesInMetaDescriptions,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseNoSpacesInMetaDescriptions >> computeResult [
	| interestingAnnotations |
	interestingAnnotations := (self model allAnnotationTypes select: [ :each | each name beginsWith: #MSEProperty:type:]) flatCollect: #instances.
	^ interestingAnnotations select: [ :each | 
			each attributes first value anySatisfy: [ :c | c = Character space ] ]
]

{ #category : #accessing }
OnMooseNoSpacesInMetaDescriptions >> explanation [
	^ 'Properties with spaces in names cause problems when loading the MSE file. Thus, no spaces are allowed in the names of properties'
]

{ #category : #accessing }
OnMooseNoSpacesInMetaDescriptions >> label [
	^ 'Annotation instances with spaces in name'
]

{ #category : #accessing }
OnMooseNoSpacesInMetaDescriptions >> stakeholder [
	^ OnMoosePeople tudorGirba
]
