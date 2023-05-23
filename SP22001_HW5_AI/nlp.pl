init :-
        consult('C:/Users/hp/careerprolog.txt'),retractall(response(_,_)), option(Career),!, printmsg(Career), nl, fail.
init :-
    write(''),nl,
    write('Welcome to Elective Advisory System.'),nl,
    write(''),nl,
    write('Can I know your good name? write your name in inverted commas)'),
    read(Name),nl,
    format('Hi, ~w. Let\'s explore the elective options.',[Name]),nl,
    write(''),nl,fail.
init :-
	retractall(response(_,_)), option(Career),!, printmsg(Career), nl, fail.

/* To check if required values, i.e, either 0 or 1, are inserted by the user.*/
read_response(Response) :-
   read(TmpResponse), (TmpResponse = 0; TmpResponse = 1),!, Response = TmpResponse;(write('Invalid Response'), nl, read_response(Response)).

/* Questions for user */
query(1,A1):- write('Which semester, monsoon or winter, will you be in?:write 1 for monsoon, 0 for winter'),nl,read_response(A1),assert(response(1,A1)).
query(2,A2):- write('Have you done M1 course:Linear Algebra;write 1 for yes, 0 for no'),nl, read_response(A2),assert(response(2,A2)).
query(3,A3):- write('have you done probability and statistics course;write 1 for yes, 0 for no'),nl, read_response(A3),assert(response(3,A3)).
query(4,A4):- write('have you done Intro to Programming course; write 1 if yes, 0 for no'),nl, read_response(A4), assert(response(4,A4)).
query(5,A5):- write('Have you done M3 course:Multivariate Calculus;write 1 for yes, 0 for no.'),nl,read_response(A5), assert(response(5,A5)).
query(6,A6):- write('Have you done Data structure and algorithms;write 1 for yes, 0 for no'),nl,read_response(A6),assert(response(6,A6)).
query(7,A7):- write('Do you have intrest in developing supervised and unsupervised models; write 1 for yes, 0 for no'),nl,read_response(A7), assert(response(7,A7)).
query(8,A8):- write('Have you done discrete mathematics course;write 1 for yes, 0 for no'),nl,read_response(A8), assert(response(8,A8)).
query(9,A9):- write('Do you have intrest in Artificial Intelligence:?write 1 for yes, 0 for no'),nl,read_response(A9), assert(response(9,A9)).
query(10,A10):- write('Have you studied probability and random processes:?write 1 for yes, 0 for no'),nl,read_response(A10), assert(response(10,A10)).
query(11,A11):- write('Do you have basic understanding of biology;write 1 for yes, 0 for no'),nl,read_response(A11), assert(response(11,A11)).
query(12,A12):- write('Dou you know C/C++ programming:?write 1 for yes, 0 for no'),nl,read_response(A12), assert(response(12,A12)).
query(13,A13):- write('Do you have intrest in computer graphics:?write 1 for yes, 0 for no'),nl,read_response(A13), assert(response(13,A13)).

query(14,A14):- write('Have you done digital circuits course:?write 1 for yes, 0 for no'),nl,read_response(A14), assert(response(14,A14)).
query(15,A15):- write('Do you have intrest in how different processors work:?write 1 for yes, 0 for no'),nl,read_response(A15), assert(response(15,A15)).
query(16,A16):- write('Have you done database management course:?write 1 for yes, 0 for no'),nl,read_response(A16), assert(response(16,A16)).
query(17,A17):- write('Have you done java programming:?write 1 for yes, 0 for no'),nl,read_response(A17), assert(response(17,A17)).
query(18,A18):- write('Do you have basic knowledge of set theory:?write 1 for yes, 0 for no'),nl,read_response(A18), assert(response(18,A18)).
query(19,A19):- write('Do you have intrest in graph theory?write 1 for yes, 0 for no'),nl,read_response(A19), assert(response(19,A19)).

/* to see if the question has previously been asked.*/
check(Value,Res):- response(Value,Res),!.
check(Value,Res):- query(Value,Res).

/* Based on user's different responses option command will choose which quey to ask next */
option(ml) :-
  (( query(1,A1), A1=1, query(2,A2), A2=1, query(3,A3), A3=1, query(4,A4), A4=1, query(5,A5), A5=1,query(7,A7), A7=1);
	( response(1,A1), A1=1, check(2,A2), A2=1, check(3,A3), A3=1, check(4,A4), A4=1 ,response(5,A5),A5=1 )).

option(ai) :-
  (
    ( response(1,A1), A1=1, query(6,A6), A6=1, query(8,A8), A8=1, query(9,A9), A9=1);
    ( response(1,A1), A1=1, check(6,A6), A6=1, check(9,A9), A9=1)  ).

option(network_biology):-
    ( ( response(1,A1), A1=1, query(6,A6), A6=1, query(4,A4), A4=1, query(11,A11), A11=1);
    ( response(1,A1), A1=1, check(11,A11), A11=11) ).

option(communication_network):-
    ( ( response(1,A1), A1=0, query(3,A3), A3=1, query(10,A10), A10=1);
    ( response(1,A1), A1=0, check(3,A3), A3=1) ).

option(computer_graphics):-
    ( ( response(1,A1), A1=1, query(4,A4), A4=1, query(6,A6), A6=1, query(12,A12), A12=1, query(13,A13), A13=1);
	( response(1,A1), A1=1, response(4,A4), A4=1,response(6,A6), A6=1, response(13,A13), A13=1);
     ( response(1,A1), A1=1, response(4,A4), A4=1,response(12,A12), A12=1, response(13,A13), A13=1)  ).

option(computer_organization):-
    ( ( response(1,A1), A1=0, query(14,A14), A14=1, query(15,A15), A15=1);
    ( response(1,A1), A1=0, check(14,A14), A14=1)).

option(data_mining):-
    ( ( response(1,A1), A1=1,query(2,A2), A2=1, query(3,A3), A3=1,query(4,A4),A4=1,query(16,A16),A16=1,query(17,A17),A17=1);
      ( response(1,A1), A1=1, query(4,A4), A4=1, query(2,A2), A2=1, query(3,A3), A3=1, query(16,A16), A16=1) ).

option(intro_math_logic):-
    ( ( response(1,A1), A1=0, query(18,A18), A18=1, query(8,A8), A8=1);
    ( response(1,A1), A1=0, check(18,A18), A18=1) ).

option(graph_theory):-
    ( ( response(1,A1), A1=0, response(2,A2), A2=1, query(8,A8), A8=1, query(19,A19), A19=1);
    ( response(1,A1), A1=0, check(2,A2), A2=1,check(19,A19),A19=1);
    ( response(1,A1), A1=0, check(8,A8), A8=1,check(19,A19),A19=1)).



/* printmsg will print elective name according to user's response*/
printmsg(ml) :-
	name_person(X),write(X),write(',YOu should explore Machine Learning based on the answers to the several question asked.'), nl.
printmsg(ai) :-
      name_person(X),write(X),write(',You should explore Artificial Intelligence based on the answers to the several question asked.'), nl.
printmsg(network_biology) :-
	name_person(X),write(X),write(',You should explore Network Biology based on the answers to the several question asked.'), nl.
printmsg(communication_network) :-
	name_person(X),write(X),write(',You should explore Communication Network based on the answers to the several question asked.'), nl.
printmsg(computer_graphics) :-
	name_person(X),write(X),write(',You should explore Computer Graphics based on the answers to the several question asked.'), nl.
printmsg(computer_organization) :-
	write('You should explore Computer Organization based on the answers to the several question asked.'), nl.
printmsg(data_mining) :-
	write('You should explore Data Mining based on the answers to the several question asked.'), nl.
printmsg(intro_math_logic) :-
	write('You should explore Introduction to Mathematical Logic based on the answers to the several question asked.'),nl.
printmsg(graph_theory) :-
	write('You should explore Graph Theory based on the answers to the several question asked.'), nl.












