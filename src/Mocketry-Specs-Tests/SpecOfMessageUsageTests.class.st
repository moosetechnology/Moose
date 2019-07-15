Class {
	#name : #SpecOfMessageUsageTests,
	#superclass : #TestCase,
	#instVars : [
		'usage'
	],
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #running }
SpecOfMessageUsageTests >> setUp [
	super setUp.
	
	usage := SpecOfMessageUsage new
]

{ #category : #tests }
SpecOfMessageUsageTests >> testAllowMessageSendsCountWhichGreaterThanMinCount [
		
	usage minCount: 3.
	
	usage should be allowMessageSends: 3.
	usage should not be allowMessageSends: 2
]

{ #category : #tests }
SpecOfMessageUsageTests >> testAllowMessageSendsCountWhichLesserThanMaxCount [
		
	usage maxCount: 3.
	
	usage should be allowMessageSends: 3.
	usage should not be allowMessageSends: 4
]

{ #category : #tests }
SpecOfMessageUsageTests >> testAllowMessageSendsCountWithNegatedLogic [
		
	usage minCount: 3.
	
	usage should not be allowMessageSends: 3 withNegatedLogic: true.
	usage should be allowMessageSends: 2 withNegatedLogic: true
]

{ #category : #tests }
SpecOfMessageUsageTests >> testAllowMessageSendsCountWithNegatedLogicWhenMaxCountSpecified [
		
	usage minCount: 3.
	usage maxCount: 5.

	usage should not be allowMessageSends: 3 withNegatedLogic: true.
	usage should be allowMessageSends: 2 withNegatedLogic: true.
	
	usage should not be allowMessageSends: 5 withNegatedLogic: true.
	usage should be allowMessageSends: 6 withNegatedLogic: true
]

{ #category : #tests }
SpecOfMessageUsageTests >> testAllowMessageSendsCountWithNegatedLogicWhenMinCountIsZero [
		
	usage minCount: 0.
	
	usage should not be allowMessageSends: 1 withNegatedLogic: true.
	usage should be allowMessageSends: 0 withNegatedLogic: true
]

{ #category : #tests }
SpecOfMessageUsageTests >> testAllowMessageSendsCountWithNegatedLogicWhenMinCountIsZeroButMaxCountSpecified [
		
	usage minCount: 0.
	usage maxCount: 3.
	
	usage should not be allowMessageSends: 1 withNegatedLogic: true.
	usage should be allowMessageSends: 4 withNegatedLogic: true
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasInfiniteMaxCountByDefault [
	
	usage where maxCount should be: Float infinity
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasMeaningfulRestrictionsWhenMaxCountIsNotInfinity [
	
	usage maxCount: 2.
	
	usage should be hasMeaningfulRestrictions 
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasMeaningfulRestrictionsWhenMinCountGreaterThanOne [
	
	usage minCount: 2.
	
	usage should be hasMeaningfulRestrictions 
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasMinCountEqualOneByDefault [
	
	usage where minCount should be: 1
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasNotMeaningfulRestrictionsWhenMaxCountIsInfinity [
	
	usage maxCount: Float infinity.
	
	usage should not be hasMeaningfulRestrictions 
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasNotMeaningfulRestrictionsWhenMinCountIsOne [
	
	usage minCount: 1.
	
	usage should not be hasMeaningfulRestrictions 
]

{ #category : #tests }
SpecOfMessageUsageTests >> testHasNotMeaningfulRestrictionsWhenMinCountIsZero [
	
	usage minCount: 0.
	
	usage should not be hasMeaningfulRestrictions 
]

{ #category : #tests }
SpecOfMessageUsageTests >> testIsUnlimited [
	
	usage beUnlimited.
	usage should be isUnlimited.
	
	usage maxCount: 3.
	
	usage should not be isUnlimited.
]

{ #category : #tests }
SpecOfMessageUsageTests >> testPrintingRestrictionsWhenItIsExactCount [
	
	usage exactCount: 3.
	
	usage where printRestrictions should equal: '3 times'
]

{ #category : #tests }
SpecOfMessageUsageTests >> testPrintingRestrictionsWhenMinAndMaxCountSpecified [
	
	usage minCount: 2.	
	usage maxCount: 3.
	
	usage where printRestrictions should equal: 'at least 2 times at most 3 times'
]

{ #category : #tests }
SpecOfMessageUsageTests >> testPrintingRestrictionsWhenOnlyMaxCountSpecified [
	
	usage maxCount: 3.
	
	usage where printRestrictions should equal: 'at most 3 times'
]

{ #category : #tests }
SpecOfMessageUsageTests >> testPrintingRestrictionsWhenOnlyMinCountSpecified [
		
	usage minCount: 3.
	
	usage where printRestrictions should equal: 'at least 3 times'
]

{ #category : #tests }
SpecOfMessageUsageTests >> testSettingExactCount [
		
	usage exactCount: 3.
	
	usage where minCount should be: 3.
	usage where maxCount should be: 3.
]
