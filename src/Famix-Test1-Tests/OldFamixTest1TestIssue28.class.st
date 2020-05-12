Class {
	#name : #OldFamixTest1TestIssue28,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
OldFamixTest1TestIssue28 >> testAllWithScope [

	<expectedFailure>

	self assertCollection: (c1 allWithScope: FamixTClass) hasSameElements: { c1 }.
	self assertCollection: (c1 allWithScope: FamixTest1Class) hasSameElements: { c1 }.

	self assertCollection: (c1 allWithScope: FamixTMethod) hasSameElements: { m1 }.
	self assertCollection: (c1 allWithScope: FamixTest1Method) hasSameElements: { m1 }.

	self assertCollection: (c2 allWithScope: FamixTMethod) hasSameElements: { m2. m3 }.
	self assertCollection: (c2 allWithScope: FamixTest1Method) hasSameElements: { m2. m3 }.

	self assertCollection: (c1 allWithScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c1 allWithScope: FamixTest1SourceTextAnchor) hasSameElements: { }.
	self assertCollection: (c2 allWithScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c2 allWithScope: FamixTest1SourceTextAnchor) hasSameElements: { }.

	self assertCollection: (m1 allWithScope: FamixTClass) hasSameElements: { }.
	self assertCollection: (m1 allWithScope: FamixTest1Class) hasSameElements: { }.

]
