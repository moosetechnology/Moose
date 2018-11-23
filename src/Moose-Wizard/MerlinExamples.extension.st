Extension { #name : #MerlinExamples }

{ #category : #'*moose-wizard' }
MerlinExamples class >> mooseContextCheckboxesPartPart [
	"self mooseContextCheckboxesPartPart"

	| wizardControl  wizardPane1  checkboxesPart |
	wizardControl := WizardControl new.
	wizardPane1 := WizardSinglePane new.
	
	checkboxesPart := MultiDependentCheckboxesPart  new
							labelsAndDependencies: MooseImportingContext entityDependencies;
							yourself.
							

		
	wizardPane1 row: checkboxesPart associatedTo: #selectedLabels.	
		
	wizardControl 
		addPane: wizardPane1.
		
	wizardControl open. 
	
	
]
