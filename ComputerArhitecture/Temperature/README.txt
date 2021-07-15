ALEXANDRESCU Anda Cristiana 334AB


Sensors_input:

	In cadrul modulului, am parcurs in blocul always printr-un for bitii variabilei care contine informatii despre senzori (1-activ, 0-inactiv), in cazul in care se gaseste un bit egal cu 1,
atunci valoarea acestuia se retine intr-o variabila care in final va arata cati biti sunt activi, iar temperatura indicata de senzor va fi retinuta intr-o alta variabila destinata realizarii
sumei temperaturilor afisate de sezorii activi. Pentru a selecta bitii ce indica valoarea temperaturii unui anumit senzor, am folosit operatorul +: care in partea din stanga are plasata valoarea de la care se incepe selectarea (8*i),
iar in partea din dreapta, lungimea sirului de biti dorit(8).

Division: 

	Algoritmul de division este preluat din resursa Wikipedia si adaptat.Algoritmul poarta numele de "Integer division (unsigned) with remainder" si urmeaza intocmai pasii impartirii a doua numere in binar.

Output_display:
	
	Cu valorile obtinute din impartirea sumei temperaturilor la numarul de senzori activi am realizat aproximarea mediei, inidcate de catul rezultat. 
Restul unei impartiri poate lua valori de la 0 la (impartitor-1); am observat ca pentru a obtine o valoare dupa impartire care poate fi aproximata superior (78 : 4 = 19 rest 2 (19.5) ),
restul trebuie sa se incadreze in a doua jumatate a intrevalului posibil. Spre exemplu resturile la impartirea cu 4 sunt: 0,1,2,3 => daca restul este mai mare sau egal cu 2 insemna ca valoarea
catului poate fi aproximata superior, iar daca acesta este mai mic decat 2 se aproximeaza inferior. De aici am dedus conditia nr_senzori(impartitor) - rest <= rest; => nr_senzori - 2*rest <=0.
In cazul in care aceasta conditie este indeplinita, atunci intr-o variabila auxiliara destinata retinerii valorii mediei dupa aproximare, se adauga valoarea catului + 1. 
Aproximarile de interes se fac pentru valorile catului cuprinse intre 18 si 26, capetele fiind cele mai atent tratate. Dupa realizarea aproximarii, se codifica rezultatul in functie de valoarea obtinuta 
dupa tabelul prezentat in pdf si se seteaza valoarea alarmei.


Temperature_top

	Modulul care leaga toate cele 3 module explicate mai sus. In cadrul acestuia se apeleaza cele 3 module succesiv pentru a obtine rezultatul cautat. In cadrul acestuia se realizeaza o 
extindere a dimenisunii numarului de biti a variabilei care retine numarul de senzori, deoarece in primul modul este declarata ca o variabila pe 8 biti, iar pentru a face impartirea dimensiunea 
acesteia trebuie sa fie pe 16 biti.

BONUS:
	Pentru a putea reconfigura numarul de sezori am folosit constructia parameter in modulele sensors_input si temperature_top. Am facut modificari numai la cele 2 variabile care tin
de input: sensors_data_i si sensors_en_i. Celelalte variabile nu trebuie modificate, am verificat in functie de numarul maxim admis de senzori (200- poate fi reprezentat pe 8 biti si 51000, suma maxima admisa - se poate reprezenta pe 16 biti)