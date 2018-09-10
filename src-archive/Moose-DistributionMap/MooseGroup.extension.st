Extension { #name : #MooseGroup }

{ #category : #'*Moose-DistributionMap' }
MooseGroup >> viewDistributionMapFromElements [
	<menuItem: 'Distribution Map for these elements' category: 'Visualize'> 
	
	(OpenDistributionMapBasedOnElementsWizard  onGroup: self) open.
		
]

{ #category : #'*Moose-DistributionMap' }
MooseGroup >> viewDistributionMapFromParts [
	<menuItem: 'Distribution Map for these parts' category: 'Visualize'> 
	
	(OpenDistributionMapBasedOnPartsWizard  onGroup: self) open.
		
]
