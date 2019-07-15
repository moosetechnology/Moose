Class {
	#name : #FAMIXLintRuleTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
FAMIXLintRuleTest >> testRules [
	{
		FAMIXMetaModelClassesNotDeclaredInFameRule new.
		FAMIXMetaModelClassesShouldNotOverrideRule new }
		do: [ :rule | RBSmalllintChecker runRule: rule ].
]
