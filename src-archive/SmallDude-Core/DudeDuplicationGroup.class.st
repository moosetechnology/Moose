"
A Duplication group should store duplications (pairs of identical fragments) that are related - it should hold all fragments that are clones of a particullar text fragment
"
Class {
	#name : #DudeDuplicationGroup,
	#superclass : #MooseGroup,
	#category : #'SmallDude-Core'
}

{ #category : #meta }
DudeDuplicationGroup class >> annotation [
	<MSEClass: #DuplicationGroup super: #MooseGroup>
	<package: #Dude>
]

{ #category : #'user interface' }
DudeDuplicationGroup >> browseDiffs [
	<menuItem: 'Diffs' category: 'Browse'>
	MooseBrowsers new duplicationBrowser openOn: self
]

{ #category : #selection }
DudeDuplicationGroup >> distinctFragments [ 
	 
	| frags | 
	frags := OrderedCollection new. 
	self 
		do: 
			[:dup |  
			frags 
				indexOf: dup referenceCode 
				ifAbsent: [frags add: dup referenceCode]. 
			frags 
				indexOf: dup duplicateCode 
				ifAbsent: [frags add: dup duplicateCode]]. 
	^frags
]
