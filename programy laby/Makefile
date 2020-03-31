all: seek_table_min dodaj2liczby pomnoz2liczby sum_table_elem sum2tables

seek_table_min: seek_table_min.o
	ld seek_table_min.o -o seek_table_min

# kompilacja z debuggerem (-g)
seek_table_min.o: seek_table_min.s
	as seek_table_min.s -o seek_table_min.o -g

dodaj2liczby: dodaj2liczby.o
	ld dodaj2liczby.o -o dodaj2liczby

dodaj2liczby.o: dodaj2liczby.s
	as dodaj2liczby.s -o dodaj2liczby.o -g

pomnoz2liczby: pomnoz2liczby.o
	ld pomnoz2liczby.o -o pomnoz2liczby

pomnoz2liczby.o: pomnoz2liczby.s
	as pomnoz2liczby.s -o pomnoz2liczby.o -g

sum_table_elem: sum_table_elem.o
	ld sum_table_elem.o -o sum_table_elem

sum_table_elem.o: sum_table_elem.s
	as sum_table_elem.s -o sum_table_elem.o -g

sum2tables: sum2tables.o
	ld sum2tables.o -o sum2tables

sum2tables.o: sum2tables.s
	as sum2tables.s -o sum2tables.o -g

# make clean - usuwa seek_table_min.o i seek_table_min i inne
clean:
	rm seek_table_min.o seek_table_min
	rm dodaj2liczby.o dodaj2liczby
	rm pomnoz2liczby.o pomnoz2liczby
	rm sum_table_elem.o sum_table_elem
	rm sum2tables.o sum2tables
