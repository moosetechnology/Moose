Class {
	#name : #RTDuplicationBetweenPackages,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTDuplicationBetweenPackages >> description [
	^ 
'Two regular expressions are asked. Packages matching those regular expression are compared.
Each red dot indicates duplication between methods.'
]

{ #category : #hooks }
RTDuplicationBetweenPackages >> execute [
	
	| packageNamePattern1 packageNamePattern2 minimumLinesOfCodeToBeConsidered p1 methods1 p2 methods2 m |
	packageNamePattern1 := UIManager default
			request: '-- 1 -- Enter a pattern of a package (e.g., Roassal2 or Roassal2*)'
			initialAnswer: 'Roassal2'
			title: 'Enter the name of a package to visualize the duplication'.

	packageNamePattern2 := UIManager default
			request: '-- 2 -- Enter a pattern of a package (e.g., Trachel or Trachel*)'
			initialAnswer: 'Trachel'
			title: 'Enter the name of a package to visualize the duplication'.

	minimumLinesOfCodeToBeConsidered := 5.
	
	p1 := RPackageOrganizer default packages select: [ :p | packageNamePattern1 match: p packageName ].
	methods1 := (((p1 flatCollect: #methods) groupedBy: #methodClass) values flatCollect: #yourself) select: [ :me | me sourceNonEmptyCodeLinesCached size >= minimumLinesOfCodeToBeConsidered ].

	p2 := RPackageOrganizer default packages select: [ :p | packageNamePattern2 match: p packageName ].
	methods2 := (((p2 flatCollect: #methods) groupedBy: #methodClass) values flatCollect: #yourself) select: [ :me | me sourceNonEmptyCodeLinesCached size >= minimumLinesOfCodeToBeConsidered ].

	m := RTDepMatrix new.
	m shape box color: Color red.
	m interaction popupText.
	m function: [ :m1 :m2 | 
		| a1 a2 |
		a1 := m1 sourceNonEmptyCodeLinesCached.
		a2 := m2 sourceNonEmptyCodeLinesCached.
		(a1 intersection: a2) size >= 5 "((a1 size min: a2 size) - 1)" ].
	m horizontal: methods1.
	m vertical: methods2.
	m build.
	RTMetricNormalizer new
		view: m view;
		elements: m view elements;
		distinctColorUsing: [ :assoc | assoc key methodClass ].
	"m normalizer view: m view; elements: m view elements; distinctColorUsing: [ :assoc | assoc key methodClass ]. "
	m view inspect
]

{ #category : #hooks }
RTDuplicationBetweenPackages >> label [
	^ 'Duplication between methods'
]
