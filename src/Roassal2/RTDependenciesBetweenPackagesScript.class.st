Class {
	#name : #RTDependenciesBetweenPackagesScript,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTDependenciesBetweenPackagesScript >> description [
	^ 
'Let you see dependencies from a group of Pharo packages to a group of Pharo packages.'
]

{ #category : #hooks }
RTDependenciesBetweenPackagesScript >> execute [

GTPlayground openContents: '
"Press the Play green button, on the top right on this window to see this script in action"

fromPackages := #(''Roassal2*'').
toPackages := #(''Trachel*'').

fromClasses := (fromPackages flatCollect: [ :pName | RPackageOrganizer default packages select: [ :p | pName match: p packageName ] ]) flatCollect: #definedClasses.
toClasses := (toPackages flatCollect: [ :pName | RPackageOrganizer default packages select: [ :p | pName match: p packageName ] ]) flatCollect: #definedClasses.

allReferenceClasses := (fromClasses flatCollect: #dependentClasses) asSet.
toClasses := toClasses select: [ :c | allReferenceClasses includes: c ].

fromClasses := fromClasses select: [ :c | c dependentClasses includesAnyOf: toClasses ].

allClasses := fromClasses, toClasses.
allMethods := allClasses flatCollect: #methods.

b := RTMondrian new.
b shape box borderColor: Color green; fillColor: Color white.
b node: fromPackages forIt: [ 
	b nodes: fromClasses.
	b edges connectFrom: #superclass.
	b layout tree ].

b shape box borderColor: Color blue; fillColor: Color white.
b node: toPackages forIt: [ 
	b nodes: toClasses.
	b edges connectFrom: #superclass.
	b layout tree ].

b shape line color: Color blue trans.
b edges 
	fromObjects: fromClasses;
	toObjects: toClasses;
	connectToAll: #dependentClasses.
b layout verticalLine.
b  '
]

{ #category : #hooks }
RTDependenciesBetweenPackagesScript >> label [
	^ 'Dependencies in Pharo packages'
]
