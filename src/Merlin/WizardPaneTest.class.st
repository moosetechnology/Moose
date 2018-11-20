Class {
	#name : #WizardPaneTest,
	#superclass : #TestCase,
	#instVars : [
		'wizardControl'
	],
	#classInstVars : [
		'wizardPane1',
		'firstCheckBoxPart',
		'secondCheckBoxPart'
	],
	#category : #'Merlin-Tests'
}

{ #category : #running }
WizardPaneTest >> setUp [
	| wizardPane1 wizardPane2 firstCheckBoxPart secondCheckBoxPart |
	wizardControl := MockWizardControl new.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstCheckBoxPart := CheckboxPart new
									label: 'if selected, next one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: true;
									useLatePopulateContents: false;
									yourself.
									
	secondCheckBoxPart := CheckboxPart new
									label: 'selected if previous one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: [:inputs | (inputs at: #firstCheckbocValue) not];
									yourself.
		
		
	wizardPane1 row: firstCheckBoxPart associatedTo: #firstCheckbocValue.
	wizardPane2 row: secondCheckBoxPart associatedTo: #secondCheckbocValue requiring: {#firstCheckbocValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
]

{ #category : #tests }
WizardPaneTest >> testWizardPaneNextBack [
	
	wizardControl open.
	self assert: wizardControl currentPane == wizardControl wizardPanes first.
	wizardControl performNextButtonAction.
	self assert: wizardControl  currentPane == wizardControl wizardPanes second.
	wizardControl performPreviousButtonAction.
	self assert: wizardControl  currentPane == wizardControl wizardPanes first.
]

{ #category : #tests }
WizardPaneTest >> testWizardPaneNumberOfSubcomponents [
	
     | wizardPane1 firstCheckBoxPart secondCheckBoxPart |
	wizardControl := WizardControl new.
	wizardPane1 := WizardSinglePane new.
	
	firstCheckBoxPart := CheckboxPart new
									label: 'if selected, next one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: true;
									useLatePopulateContents: false;
									yourself.
									
	secondCheckBoxPart := CheckboxPart new
									label: 'selected if previous one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: false;
									yourself.
		
		
	wizardPane1 row: firstCheckBoxPart associatedTo: #firstCheckbocValue.
	self assert: wizardPane1 numberOfSubComponents = 1.
	wizardPane1 row: secondCheckBoxPart associatedTo: #secondCheckbocValue requiring: {#firstCheckbocValue}.
	self assert: wizardPane1 numberOfSubComponents = 2.
	"wizardPane1 removeAllParts.
	self assert: wizardPane1 numberOfSubComponents = 0.
	"	
	wizardControl 
		addPane: wizardPane1.
]

{ #category : #tests }
WizardPaneTest >> testWizardPaneRemoveSubcomponentAt [
	
      | wizardPane1 firstCheckBoxPart secondCheckBoxPart |
	wizardControl := MockWizardControl new.
	wizardPane1 := WizardSinglePane new.
	
	firstCheckBoxPart := CheckboxPart new
									label: 'if selected, next one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: true;
									useLatePopulateContents: false;
									yourself.
									
	secondCheckBoxPart := CheckboxPart new
									label: 'selected if previous one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: false;
									yourself.
		
		
	wizardPane1 row: firstCheckBoxPart associatedTo: #firstCheckbocValue.
	self assert: wizardPane1 numberOfSubComponents = 1.
	wizardPane1 row: secondCheckBoxPart associatedTo: #secondCheckbocValue requiring: {#firstCheckbocValue}.
	self assert: wizardPane1 numberOfSubComponents = 2.
	
	wizardControl 
		addPane: wizardPane1.
	wizardControl open.
	self assert: (wizardPane1 subComponentAt: 1) = firstCheckBoxPart.
	self assert: (wizardPane1 subComponentAt: 2) = secondCheckBoxPart.
	wizardPane1 removeSubComponentAt: 1.
	self deny: (wizardPane1 subComponentAt: 1) = firstCheckBoxPart.
	self assert: (wizardPane1 subComponentAt: 1) = secondCheckBoxPart.
]

{ #category : #tests }
WizardPaneTest >> testWizardPaneSubcomponentAt [
	
      | wizardPane1 firstCheckBoxPart secondCheckBoxPart |
	wizardControl := WizardControl new.
	wizardPane1 := WizardSinglePane new.
	
	firstCheckBoxPart := CheckboxPart new
									label: 'if selected, next one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: true;
									useLatePopulateContents: false;
									yourself.
									
	secondCheckBoxPart := CheckboxPart new
									label: 'selected if previous one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: false;
									yourself.
		
		
	wizardPane1 row: firstCheckBoxPart associatedTo: #firstCheckbocValue.
	self assert: (wizardPane1 subComponentAt: 1) = firstCheckBoxPart.
	wizardPane1 row: secondCheckBoxPart associatedTo: #secondCheckbocValue requiring: {#firstCheckbocValue}.
	self assert: (wizardPane1 subComponentAt: 2) = secondCheckBoxPart.
	self deny: (wizardPane1 subComponentAt: 1) = secondCheckBoxPart.
	
		
	wizardControl 
		addPane: wizardPane1.
]
