Class {
	#name : #BaselineOfFamixCompatibility,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixCompatibility
}

{ #category : #accessing }
BaselineOfFamixCompatibility >> baseline: spec [ 
    
	<baseline>
        
	| repository | 
	
	repository := self packageRepositoryURL.

	spec for: #common do: [
		spec package: 'FamixCompatibility-Generator'.
		spec package: 'FamixCompatibility-Entities'.
	].

]

{ #category : #accessing }
BaselineOfFamixCompatibility >> packageRepository [

	" Tries to determine a repository from which the baseline is being loaded. Useful for 
	refering other baselines in the same repository. "
	
	^ (self class package mcWorkingCopy repositoryGroup repositories reject: [:each | each = MCCacheRepository uniqueInstance]) 
		ifNotEmpty: [ :repositories | repositories anyOne ]
		ifEmpty: [ nil ]


	
]

{ #category : #accessing }
BaselineOfFamixCompatibility >> packageRepositoryURL [

	" Tries to determine a repository URL from which the baseline is being loaded. Useful for 
	refering other baselines in the same repository. "

	^ self packageRepository
		ifNotNil: [ :aRepository | aRepository description ]
		ifNil: [ '' ]


	
]

{ #category : #accessing }
BaselineOfFamixCompatibility >> project [
	
	| aProject |
	
	aProject := super project.
	aProject loadType: #atomic.
	^ aProject.
	
]
