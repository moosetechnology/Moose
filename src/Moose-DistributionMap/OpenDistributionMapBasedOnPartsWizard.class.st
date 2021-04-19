Class {
	#name : #OpenDistributionMapBasedOnPartsWizard,
	#superclass : #OpenDistributionMapWizard,
	#instVars : [
		'propertyListPart',
		'propertyTextFieldPart'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #'instance creation' }
OpenDistributionMapBasedOnPartsWizard class >> onGroup: aMooseGroup [

	^super new initializeWithPartGroup: aMooseGroup ; yourself.
]

{ #category : #accessing }
OpenDistributionMapBasedOnPartsWizard >> computeAndReturnDistributionMapElements [

	^ self mooseGroup flatCollect: [ :anEntity | 
		  self elementsBlockOrSelector value: anEntity ]
]

{ #category : #'initialize - containers parts' }
OpenDistributionMapBasedOnPartsWizard >> containersPart [
	^ (TextPart new)
		text:
				self groupClass asString asText allBold , Character cr asString
						, '=> launch distributionMap from corresponding groups to visualize on other types';
		inGroupboxNamed: 'Type of parts';
		yourself
]

{ #category : #'accessing - map parameters' }
OpenDistributionMapBasedOnPartsWizard >> elementsBlockOrSelector [
	^ Smalltalk compiler
		evaluate: (self wizardInformations at: #entitiesToComputeSelector)
]

{ #category : #'initialize - elements parts' }
OpenDistributionMapBasedOnPartsWizard >> elementsCompositePart [
	
	^ (CompositePart new)
		inGroupboxNamed: 'Select type of elements';
		useLatePopulateContents: false;
		withTitlesAndParts:
				{('Using a pre-initialized list' -> (self elementsListPart)).
					('Entering a block' -> self elementsTextFieldPart)};
		yourself.	
			
	
]

{ #category : #'initialize - elements parts' }
OpenDistributionMapBasedOnPartsWizard >> elementsListPart [
	^ (DropListPart new)
		list: self possibleElementSelectors;
		defaultValue: 1;
		useLatePopulateContents: false;
		callback: [ :aFM3Property :thisPart| 
			self updatePopertySelectorPart: self propertyListPart withType: aFM3Property.
			thisPart wizardPane refresh
			];
		transformed: [:aFM3Property |
			 ('[:container | container ', aFM3Property name , ']')];
		format: [:aFM3Property | aFM3Property name  asString ,' ( ', aFM3Property type fullName asString,' )'];
		yourself
]

{ #category : #'initialize - elements parts' }
OpenDistributionMapBasedOnPartsWizard >> elementsTextFieldPart [
	^ TextFieldPart new
		prefix: '[:container |  ';
		suffix: ' ]';
		useLatePopulateContents: false;
		returnSuffixAndPrefix: true;
		defaultValue: (self possibleElementSelectors ifEmpty: [ '' ] ifNotEmpty: [ :selectors | 'container ' , selectors anyOne name ]);
		transformed: [ :aString | aString ];
		yourself
]

{ #category : #initialization }
OpenDistributionMapBasedOnPartsWizard >> initializeFirstPane: aWizardPane [
	aWizardPane addPart: self containersPart associatedTo: #groupClass.
	aWizardPane addPart: self elementsCompositePart associatedTo: #entitiesToComputeSelector.
	aWizardPane addPart: self propertyCompositePart associatedTo: #propertySelector.
	self setConditionsTo: aWizardPane
]

{ #category : #initialization }
OpenDistributionMapBasedOnPartsWizard >> initializeWithPartGroup: aMooseGroup [
	"DistributionMapWizard new open"

	| propertiyValuesPane partsAndElementsPane |
	self mooseGroup: aMooseGroup .
	partsAndElementsPane := WizardFirstPane named: 'Parts and elements'.
	self initializeFirstPane: partsAndElementsPane.
	propertiyValuesPane := WizardLastPane named: 'Property values'.
	self addPane: partsAndElementsPane .
	self addPane: propertiyValuesPane .
	
	self initializePropertyValuesPane: propertiyValuesPane .
	
	
	
	
]

{ #category : #'wizard panes transition' }
OpenDistributionMapBasedOnPartsWizard >> openDefaultColorsDistributionMapUsingGroupAsParts [
	(MooseDistributionMap new
		containers: self mooseGroup
		getElements: self elementsBlockOrSelector
		property: self propertyBlockOrSelector)
		propertyColorMap: self propertyColorMap;
		propertyValuesIDMap: self propertyValuesMap;
		open
]

{ #category : #'wizard panes transition' }
OpenDistributionMapBasedOnPartsWizard >> openDistributionMapUsingGroupAsParts [
	(MooseLinearDistributionMap new
		containers: self mooseGroup
		getElements: self elementsBlockOrSelector
		property: self propertyBlockOrSelector) open
]

{ #category : #'wizard panes transition' }
OpenDistributionMapBasedOnPartsWizard >> performTerminateButtonAction [
	"by default, just close the last current pane. Override this method if you want to create a subclass of WizardControl making a specific action"

	super performTerminateButtonAction.
	(self wizardInformations at: #useColorGradient)
		ifFalse: [ self openDistributionMapUsingGroupAsParts ]
		ifTrue: [ self openDefaultColorsDistributionMapUsingGroupAsParts ]
]

{ #category : #'computing possible elements' }
OpenDistributionMapBasedOnPartsWizard >> possibleElementSelectors [
	"here we compute types of elements that can be displayed. Given the type of the parts, all type 'contained' in this one can be used as elements. Return a string list of selectors that can be applied to parts to compute elements. This list is ready to be set to the elements-dropListWizardPart  "

	| result |
	result := self groupMetaClasses flatCollect: #allComplexProperties.
	result := result select: [ :each | each isMultivalued ].
	result := self removeAllNonComputableAttributesFrom: result.
	^ result
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnPartsWizard >> propertyCompositePart [
	
	^(CompositePart new)
		inGroupboxNamed: 'Select propertySelector to use';
		useLatePopulateContents: false;
		withTitlesAndParts:
				{('Using a pre-initialized list' -> self propertyListPart).
					('Entering a block' -> self propertyTextFieldPart)};
		yourself.
	
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnPartsWizard >> propertyListPart [
	^ propertyListPart
		ifNil: [ 
			propertyListPart := DropListPart new
				callback: [ :outputValue | outputValue ifNotNil: [ self propertyTextFieldPart textEntryContents: 'element ' , outputValue ] ];
				useLatePopulateContents: false;
				transformed: [ :aSelector | '[:element | element ' , aSelector asString , ' ]' ] yourself ]
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnPartsWizard >> propertyTextFieldPart [
	^ propertyTextFieldPart ifNil:  
		[propertyTextFieldPart := (TextFieldPart new)
			prefix: '[:element | ';
			suffix: ' ]';
			returnSuffixAndPrefix: true;
			useLatePopulateContents: false;
			yourself]
]

{ #category : #'computing possible elements' }
OpenDistributionMapBasedOnPartsWizard >> removeAllNonComputableAttributesFrom: aCollectionOfFM3Attributes [
	| result |
	result := OrderedCollection new.

	aCollectionOfFM3Attributes
		do: [ :aFM3Attribute | 
			[ (self mooseGroup flatCollect: [ :anEntity | anEntity perform: aFM3Attribute implementingSelector ])
				ifNotEmpty: [ "we make sure that the property does not return an empty collection for each element of the group" result add: aFM3Attribute ] ]
				on: Error
				do: [ :error | "if it raises un error, we don't add to the result" ] ].
	^ result
]

{ #category : #initialization }
OpenDistributionMapBasedOnPartsWizard >> setConditionsTo: aWizardPane [

	aWizardPane
		condition: [ :wizardInfos | 
			| isOk |
			isOk := true.
			[ 
			(self elementsBlockOrSelector value: self mooseGroup anyOne) 
				ifNil: [ isOk := false ] ]
				on: Exception
				do: [ isOk := false ].
			isOk ]
		named:
		'Invalid elements selector (the choosen selector might return nil for some elements)'.
	aWizardPane
		condition: [ :wizardInfos | 
			| isOk |
			isOk := true.
			[ 
			(self propertyBlockOrSelector value:
				 self distributionMapElements anyOne) ifNil: [ isOk := false ] ]
				on: Exception
				do: [ :ex | isOk := false ].
			isOk ]
		named:
		'Not able to compute properties (the choosen selector might return nil for some elements)'
]

{ #category : #actions }
OpenDistributionMapBasedOnPartsWizard >> updatePopertySelectorPart: aWizardPart withType: aFM3Property [
	| elementsClass |
	aFM3Property
		ifNil: [ aWizardPart list: {} ]
		ifNotNil: [ elementsClass := aFM3Property type.
			aWizardPart
				list: (self allPropertySelectorsForElementOfType: elementsClass) ]
]
