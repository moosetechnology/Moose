"
rce: 22987863
"
Class {
	#name : 'BaselineOfMoose',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMoose',
	#package : 'BaselineOfMoose'
}

{ #category : 'baselines' }
BaselineOfMoose >> baseline: spec [

	<baseline>
	spec for: #common do: [
			self
				famix: spec;
				famixTagging: spec;
				famixReplication: spec;
				mooseIDE: spec.

			spec package: 'Moose-Configuration' with: [ spec requires: #( 'Famix' 'FamixTagging' 'FamixReplication' 'MooseIDE' ) ].

			self groups: spec.
			spec postLoadDoIt: #installMooseConfigurations ]
]

{ #category : 'dependencies' }
BaselineOfMoose >> famix: spec [

	spec
		baseline: 'Famix'
		with: [
		spec repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : 'dependencies' }
BaselineOfMoose >> famixReplication: spec [

	spec
		baseline: 'FamixReplication'
		with: [ 
		spec repository: 'github://moosetechnology/FamixReplication:' ]
]

{ #category : 'dependencies' }
BaselineOfMoose >> famixTagging: spec [

	spec
		baseline: 'FamixTagging'
		with: [
		spec repository: 'github://moosetechnology/FamixTagging:development/src' ]
]

{ #category : 'baselines' }
BaselineOfMoose >> groups: spec [

	spec group: 'Metamodel' with: #( 'Famix' )
]

{ #category : 'actions' }
BaselineOfMoose >> installMooseConfigurations [

	Smalltalk at: #MooseConfiguration ifPresent: [ :mooseConfiguration | mooseConfiguration registerToIceberg ]
]

{ #category : 'dependencies' }
BaselineOfMoose >> mooseIDE: spec [

	spec
		baseline: 'MooseIDE'
		with: [ 
		spec repository: 'github://moosetechnology/MooseIDE:development/src' ]
]

{ #category : 'accessing' }
BaselineOfMoose >> projectClass [
	^ MetacelloCypressBaselineProject
]
