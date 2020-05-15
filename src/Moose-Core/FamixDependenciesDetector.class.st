"
Description
--------------------

I am a detector to compute dependencies at all possible scopes for a give moose group. For famix entities, it collects the dependencies of an entity at all the scopes of entities in the group.

Since tags can contain themselves recursively, we need to see if the any one has an incoming connection from the current entity.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	dependencies:					<aCollection>				The list of found dependencies.
	directionStrategy:				<aDirectionStrategy>		A strategy managing the direction of dependencies (incoming or outgoing).
	entity:							<anEntity>					The origin entityx for which we are looking at for dependencies.
	mooseModel:						<aMooseModel>				The moose model in which are the entities to look for. This is useful for example when using tags.
	potentialDependencies:		<aCollection>				A collection containing all the potential dependencies in which we are looking for.
"
Class {
	#name : #FamixDependenciesDetector,
	#superclass : #Object,
	#instVars : [
		'entity',
		'directionStrategy',
		'mooseModel',
		'potentialDependencies',
		'dependencies'
	],
	#category : #'Moose-Core-Dependencies'
}

{ #category : #public }
FamixDependenciesDetector class >> computeClientsOf: aMooseEntity from: aMooseGroup in: aMooseModel [
	^ self new
		directionStrategy: FamixDependenciesDetectorClientsStrategy;
		entity: aMooseEntity;
		potentialDependencies: aMooseGroup;
		mooseModel: aMooseModel;
		detectDependencies
]

{ #category : #public }
FamixDependenciesDetector class >> computeProvidersOf: aMooseEntity from: aMooseGroup in: aMooseModel [
	^ self new
		directionStrategy: FamixDependenciesDetectorProvidersStrategy;
		entity: aMooseEntity;
		potentialDependencies: aMooseGroup;
		mooseModel: aMooseModel;
		detectDependencies
]

{ #category : #'links-computation' }
FamixDependenciesDetector >> detectDependencies [
	"this code will be further simplied in the later version. right now, committing it in this state to have a working version."

	dependencies := Set new.

	self entity detectDependenciesUsing: self.

	^ dependencies
]

{ #category : #'links-computation' }
FamixDependenciesDetector >> detectDependenciesAtAllScopesOfPossibleDependencies [
	"this method computes dependencies at all possible scopes for a give moose group. For FAMIX entities, it collects the dependencies of the recevier at all the scopes of entities in the group. Tags contain themselves recursively, hence we need to see if the any one has an incoming connection from the current entity"

	| dependenciesAssociations |
	dependenciesAssociations := self directionStrategy dependenciesOf: self entity.
	self selectMatchingEntitiesFrom: ((potentialDependencies collectAsSet: #class) flatCollect: [ :aScope | dependenciesAssociations atScope: aScope ])
]

{ #category : #'links-computation' }
FamixDependenciesDetector >> detectDependenciesFrom: aCollection [
	"see if all possible levels of each entity in the moose group contain a link from me"

	self selectMatchingEntitiesFrom: (aCollection select: [ :each | each isLinkedTo: self entity dependancyDirection: self directionStrategy in: self mooseModel ])
]

{ #category : #accessing }
FamixDependenciesDetector >> directionStrategy [
	^ directionStrategy
]

{ #category : #accessing }
FamixDependenciesDetector >> directionStrategy: aDirectionStrategy [
	directionStrategy := aDirectionStrategy
]

{ #category : #accessing }
FamixDependenciesDetector >> entity [
	^ entity
]

{ #category : #accessing }
FamixDependenciesDetector >> entity: anEntity [
	entity := anEntity
]

{ #category : #accessing }
FamixDependenciesDetector >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
FamixDependenciesDetector >> mooseModel: aMooseModel [
	mooseModel := aMooseModel
]

{ #category : #accessing }
FamixDependenciesDetector >> potentialDependencies [
	^ potentialDependencies
]

{ #category : #accessing }
FamixDependenciesDetector >> potentialDependencies: aCollection [
	potentialDependencies := aCollection asSet
]

{ #category : #'links-computation' }
FamixDependenciesDetector >> removeFromPotentialDependencies: aCollection [
	potentialDependencies removeAllFoundIn: aCollection
]

{ #category : #'links-computation' }
FamixDependenciesDetector >> selectMatchingEntitiesFrom: aCollection [
	| toAdd |
	toAdd := aCollection intersection: potentialDependencies.
	dependencies addAll: toAdd.
	potentialDependencies removeAll: toAdd
]
