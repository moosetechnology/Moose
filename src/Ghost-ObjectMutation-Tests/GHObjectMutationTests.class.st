Class {
	#name : #GHObjectMutationTests,
	#superclass : #TestCase,
	#category : 'Ghost-ObjectMutation-Tests'
}

{ #category : #tests }
GHObjectMutationTests >> testCheckingMutationInhetitsFromAnotherClass [

	| mutation |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation victimClass: Rectangle.
	
	self assert: (mutation inheritsFrom: Object).
	self deny: (mutation inheritsFrom: String).
]

{ #category : #tests }
GHObjectMutationTests >> testCheckingMutationInhetitsFromAnotherClassWhenMetaLevelActive [

	| mutation |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation victimClass: Rectangle.
	
	GHCurrentMetaLevelDepth increaseFor: [ 
		self assert: (mutation inheritsFrom: Object).
		self deny: (mutation inheritsFrom: String).
	]
]

{ #category : #tests }
GHObjectMutationTests >> testCheckingThatObjectHasMutation [

	| victim mutation |
	victim := 10@20 corner: 30@40.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	self deny: victim hasGHMutation.
	
	mutation mutate: victim.
	
	self assert: victim hasGHMutation
]

{ #category : #tests }
GHObjectMutationTests >> testEqualityOfTwoMutations [

	| mutation mutation2 |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation victimClass: Rectangle.
	
	self assert: mutation = mutation.

	mutation2 := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation2 victimClass: Rectangle.

	self assert: mutation = mutation2.	
	self assert: mutation2 = mutation.
	
	mutation2 := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation2 victimClass: Point.
	
	self deny: mutation = mutation2.	
	self deny: mutation2 = mutation.
	
]

{ #category : #tests }
GHObjectMutationTests >> testEqualityToVictimClass [

	| mutation |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation victimClass: Rectangle.
	
	self assert: mutation = Rectangle
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPerform1ShouldBeOnDomainLevel [

	| victim mutation actual expected |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	expected := victim areasOutside: #arg.
	actual := victim perform: #areasOutside: with: #arg.
	self assert: actual selector equals: expected selector
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPerform2ShouldBeOnDomainLevel [

	| victim mutation actual expected |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	expected := victim align: #arg1 with: #arg2.
	actual := victim perform: #align:with: with: #arg with: #arg2.
	self assert: actual selector equals: expected selector
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPerform3ShouldBeOnDomainLevel [

	| victim mutation actual expected |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	expected := victim allAreasOutsideList: #arg1 startingAt: #arg2 do: #arg3.
	actual := victim perform: #allAreasOutsideList:startingAt:do: with: #arg with: #arg2 with: #arg3.
	self assert: actual selector equals: expected selector
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPerformShouldBeOnDomainLevel [

	| victim mutation actual expected |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	expected := victim area.
	actual := victim perform: #area.
	self assert: actual selector equals: expected selector
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPerformWithArgsShouldBeOnDomainLevel [

	| victim mutation actual expected |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	expected := victim area.
	actual := victim perform: #area withArguments: #().
	self assert: actual selector equals: expected selector
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPerformWithEnoughArgsShouldBeOnDomainLevel [

	| victim mutation actual expected |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	expected := victim area.
	actual := victim perform: #area withEnoughArguments: #(1 2).
	self assert: actual selector equals: expected selector.
	self assert: actual arguments isEmpty
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionMethodByPrimitiveShouldBeOnDomainLevel [

	| victim mutation actual |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	actual := victim withArgs: { [ :rect | rect area ] } executeMethod: (Rectangle lookupSelector: #in:).
	
	self assert: actual selector equals: #area
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionOriginalMethodByVictimMetaMessages [

	| victim mutation actual |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	actual := GHVictimMetaMessages executeOriginalMethodOf: victim for: (Message selector: #origin).
	self assert: actual equals: 0@0
]

{ #category : #tests }
GHObjectMutationTests >> testExecutionPerformPrimitiveWithOriginalLookupClass [

	| victim mutation actual |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	victim := 0@0 corner: 3@4.
	mutation mutate: victim.
	
	actual := thisContext object: victim perform: #origin withArguments: #() inClass: Rectangle.
	self assert: actual equals: 0@0
]

{ #category : #tests }
GHObjectMutationTests >> testExtractingOriginalClassFromMutatedObject [

	| victim mutation actual |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	victim := 10@20 corner: 30@40.
	mutation mutate: victim.
	
	actual := victim ghostClass.	
	self assert: actual equals: Rectangle
]

{ #category : #tests }
GHObjectMutationTests >> testGettingClassOfMutatedObjectWithStandardMetaLevel [

	| victim mutation actual |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	self assert: mutation mutationBehaviour metaLevel equals: GHMetaLevel standard.
	
	victim := 10@20 corner: 30@40.
	mutation mutate: victim.
	
	actual := victim class.	
	self assert: actual equals: Rectangle
]

{ #category : #tests }
GHObjectMutationTests >> testGettingMutationFromMutatedObject [

	| victim mutation |
	victim := 10@20 corner: 30@40.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	self assert: victim ghMutation == nil.
	
	mutation mutate: victim.
	
	self assert: victim ghMutation == mutation
]

{ #category : #tests }
GHObjectMutationTests >> testHeal [

	| victim mutation actual |
	victim := 0@0 corner: 2@3.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	mutation mutate: victim.
	
	mutation heal: victim.
	
	self assert: (GHMetaMessages extractClassOf: victim) == Rectangle.

	actual := victim area.
	self assert: actual equals: 6
]

{ #category : #tests }
GHObjectMutationTests >> testHealNotMutatedObject [

	| victim mutation actual |
	victim := 0@0 corner: 2@3.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
		
	mutation heal: victim.
	
	self assert: (GHMetaMessages extractClassOf: victim) == Rectangle.
	actual := victim area.
	self assert: actual equals: 6
]

{ #category : #tests }
GHObjectMutationTests >> testHealObjectWhichWasMutatedByDifferentMutation [

	| victim mutation anotherMutation actual |
	victim := 0@0 corner: 2@3.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation mutate: victim.
	
	anotherMutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	self should: [anotherMutation heal: victim] raise: Error.
	
	self assert: (GHMetaMessages extractClassOf: victim) == mutation.
	actual := victim area.	
	self assert: actual selector equals: #area
]

{ #category : #tests }
GHObjectMutationTests >> testMutating [

	| victim mutation actual |
	victim := 10@20 corner: 30@40.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	mutation mutate: victim.
	
	self assert: (GHMetaMessages extractClassOf: victim) == mutation.
	
	actual := victim area.	
	self assert: actual selector equals: #area
]

{ #category : #tests }
GHObjectMutationTests >> testMutatingGlobalClass [

	| victim mutation actual |
	victim := GHClassStub.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	[mutation mutate: victim.
	
	self assert: (GHMetaMessages extractClassOf: victim) == mutation.
	
	actual := victim named: 'test name'.	
	self assert: actual selector equals: #named:]
		ensure: [victim recoverFromGHMutation]
]

{ #category : #tests }
GHObjectMutationTests >> testMutatingMutatedObject [

	| victim mutation actual |
	victim := 10@20 corner: 30@40.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	mutation mutate: victim.
	mutation mutate: victim.
	self assert: (GHMetaMessages extractClassOf: victim) == mutation.

	actual := victim area.	
	self assert: actual selector equals: #area
]

{ #category : #tests }
GHObjectMutationTests >> testMutatingObjectWhichWasMutatedByAnotherMutation [

	| victim mutation actual anotherMutation |
	victim := 10@20 corner: 30@40.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	mutation mutate: victim.
	
	anotherMutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	self should: [anotherMutation mutate: victim] raise: Error.
	
	self assert: (GHMetaMessages extractClassOf: victim) == mutation.
	actual := victim area.	
	self assert: actual selector equals: #area
]

{ #category : #tests }
GHObjectMutationTests >> testPrintingMutatedObjectWithStandardMetaLevel [

	| victim mutation actual |
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	self assert: mutation mutationBehaviour metaLevel equals: GHMetaLevel standard.
	
	victim := 10@20 corner: 30@40.
	mutation mutate: victim.
	
	actual := victim printString.	
	self assert: actual equals: '(10@20) corner: (30@40)'
]

{ #category : #tests }
GHObjectMutationTests >> testRecoveringMutatedObjectByItself [

	| victim mutation |
	victim := 10@20 corner: 30@40.
	mutation := GHObjectMutation behaviour: GHGhostBehaviourStub new.
	
	mutation mutate: victim.	
	
	victim recoverFromGHMutation.
	self deny: victim hasGHMutation
]
