Class {
	#name : #OldFamixTest4Test,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'school',
		'classroom1',
		'classroom2',
		'cafeteria',
		'principal',
		'student1',
		'student2',
		'student3',
		'book1',
		'book2',
		'teacher1',
		'teacher2'
	],
	#category : #'Famix-Test4-Tests'
}

{ #category : #running }
OldFamixTest4Test >> setUp [

	super setUp.
	
	model := FamixTest4MooseModel new.
	model metamodel: FamixTest4Generator metamodel.
	
	school := FamixTest4School new.
	classroom1 := FamixTest4Classroom new.
	classroom2 := FamixTest4Classroom new.
	cafeteria := FamixTest4Cafeteria new.
	principal := FamixTest4Principal new.
	student1 := FamixTest4Student new.
	student1 := FamixTest4Student new.
	student2 := FamixTest4Student new.
	student3 := FamixTest4Student new.
	teacher1 := FamixTest4Teacher new.
	teacher2 := FamixTest4Teacher new.
	book1 := FamixTest4Book new.
	book2 := FamixTest4Book new.
	
	model addAll: { school. classroom1. classroom2. cafeteria. principal. student1. student2. student3. book1. book2. teacher1. teacher2 }.
	
	school students: { student1. student2. student3 }.
	school teachers: { teacher1. teacher2 }.
	teacher1 students: { student1. student2 }.
	teacher2 students: { student3 }.
	school principal: principal.
	school rooms: { classroom1. classroom2. cafeteria }.
	book1 person: student1.
	book2 person: principal.


]

{ #category : #tests }
OldFamixTest4Test >> testRelations [

	self assert: (principal books includes: book2).
	self assert: (student1 books includes: book1).	
	self assert: classroom1 school equals: school.
	self assert: principal school equals: school.
	self assert: (student1 teachers includes: teacher1).	
	self deny: (student1 teachers includes: teacher2).	

]
