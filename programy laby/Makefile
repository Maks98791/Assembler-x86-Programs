all: seek_table_min dodaj2liczby pomnoz2liczby sum_table_elem sum2tables zamiana_na_duze szyfr_cezara ascii_na_hex read_write_exit_func

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

zamiana_na_duze: zamiana_na_duze.o
	ld zamiana_na_duze.o -o zamiana_na_duze

zamiana_na_duze.o: zamiana_na_duze.s
	as zamiana_na_duze.s -o zamiana_na_duze.o -g

szyfr_cezara: szyfr_cezara.o
		ld szyfr_cezara.o -o szyfr_cezara

szyfr_cezara.o: szyfr_cezara.s
		as szyfr_cezara.s -o szyfr_cezara.o -g

ascii_na_hex: ascii_na_hex.o
		ld ascii_na_hex.o -o ascii_na_hex

ascii_na_hex.o: ascii_na_hex.s
		as ascii_na_hex.s -o ascii_na_hex.o -g

read_write_exit_func: read_write_exit_func.o
		ld read_write_exit_func.o -m elf_i386 -o read_write_exit_func

read_write_exit_func.o: read_write_exit_func.s
		as read_write_exit_func.s --32 -g -o read_write_exit_func.o -g

# make clean - usuwa seek_table_min.o i seek_table_min i inne
clean:
	rm read_write_exit_func.o read_write_exit_func
	rm seek_table_min.o seek_table_min
	rm dodaj2liczby.o dodaj2liczby
	rm pomnoz2liczby.o pomnoz2liczby
	rm sum_table_elem.o sum_table_elem
	rm sum2tables.o sum2tables
	rm zamiana_na_duze.o zamiana_na_duze
	rm szyfr_cezara.o szyfr_cezara
	rm ascii_na_hex.o ascii_na_hex
