Class {
	#name : #MooseHismoSampleData,
	#superclass : #MooseSampleData,
	#instVars : [
		'history'
	],
	#category : #'Moose-Tests-Hismo'
}

{ #category : #initialization }
MooseHismoSampleData >> initialize [
	super initialize.
	history := HismoModelHistory new.
	history addLastVersionForMooseModel: moosemodel1.
	history addLastVersionForMooseModel: moosemodel2.
	history addLastVersionForMooseModel: moosemodel3.
	history addLastVersionForMooseModel: moosemodel4.
	history addLastVersionForMooseModel: moosemodel5.
	history name: #'Sample history'
]

{ #category : #accessing }
MooseHismoSampleData >> simpleHistory [
	^history
]
