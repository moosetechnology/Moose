Class {
	#name : #FAMIXLintRuleTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
FAMIXLintRuleTest >> testRules [
	{FAMIXMetaModelClassesNotDeclaredInFameRule . FAMIXMetaModelClassesShouldNotOverrideRule} do: [ :rule | RBSmalllintChecker runRule: rule new ]
]
