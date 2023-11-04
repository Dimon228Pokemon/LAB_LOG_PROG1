sum([],0).
sum([grade(_,A)|B],Res):-
	sum(B,Res1),
	Res is Res1+A.


average_rating(Student,Mark):-
	student(_,Student,Grade),
	sum(Grade,Res),
	length(Grade,N),
	Mark is Res/N.


passed_ex(Student):-
    student(_,Student,Grade),
    not(member(grade(_,2),Grade)).

grade_fail_exam([grade(Sub,2)|_],Sub).
grade_fail_exam([_|Grade],Sub):-
    grade_fail_exam(Grade,Sub).

subject_fail(Sub,Count):-
    subject(S,Sub),
    findall(Grade,(student(_,_,Grade),grade_fail_exam(Grade,S)),Total_fail),
    length(Total_fail,Count).

%find_best([],Best1).
%find_best([A,B|C],Best):-
%    student(_,Student,Grade),
%    average_rating(A1,Mark),
%    average_rating(A2,Mark),
%    A2>A1,
%    find_best([B|C]
    
    
    
%max_mark(Group,Student):-
%    findall(Student,(student(Group,Student,_)),Stud_group),
max_elem([],0).
max_elem([H|T],N):-
  max_elem(T,B),
  H =< B,
  N is B.
max_elem([H|T],N):-
  max_elem(T,B),
  H >= B,
  N is H.
excellent_student(Group,List):-
    findall(Mark, (student(Group,Student,_), averageMark(Student,Mark)),Marks),
    max_elem(Marks,Max),
    findall(Name,(student(Group,Name,_), averageMark(Name,M), M==Max), List), !.
