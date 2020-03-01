//модуль защиты от дребезга контактов
//задание:
//  подумать, какие из приведенных ниже способов
//  решают задачу антидребезга наиболее корректно?
//  какие способы решают какую-то другую задачу? какую?
//  какой способ самый быстрый? какой использует меньше всего ресурсов? 
module test
(
	 clk, 
	 reset,
	 aclr,
	 data,
	
	 LED0,
	 LED1,
	 LED2,
	 LED3,
	 LED4
);

parameter DATA_BW = 11;

input clk;		//тактовый сигнал
input reset;	//синхронный сброс
input aclr;		//асинхронный сброс
input data;		//входные данные

//индикаторы
output LED0;
output LED1;
output LED2;
output LED3;
output LED4;

reg [DATA_BW-1:0] reg1;	//сдвиговый регистр

wire [3:0] sum0;
reg  [3:0] sum1;
reg  [3:0] sum2;
reg  [3:0] sum3;
reg  [3:0] sum4;

assign LED0 = sum0 > (DATA_BW - 2); 
assign LED1 = sum1 > (DATA_BW - 2); 
assign LED2 = sum2 > (DATA_BW - 2); 
assign LED3 = sum3 > (DATA_BW - 2); 
assign LED4 = sum4 > (DATA_BW - 2); 

reg  [3:0] mem_table [0:(2**DATA_BW)-1];	//память
initial $readmemb("rom.dat", mem_table);  //один из способов описания ROM - с помощью директивы компилятора
														//readmem - читает из файла числа, интерпретируя их как decimal
														//readmemh - читает из файла числа, интерпретируя их как hex
														//readmemb - читает из файла числа, интерпретируя их как binary
														//записей в файле (числа, разделенные пробелом или переводом строки)
														//должно быть столько, сколько адресов в памяти.
														//для компиляции файл с данными должен находиться в папке с исходниками,
														//для моделирования - в папке моделирования
														//недостаток способа - различные компиляторы выполняют эту директиву по-разному,
														//то есть, код получается непереносимым

integer i;

//способ 0
assign sum0 = $unsigned(reg1[0]) +
				  $unsigned(reg1[1]) +
				  $unsigned(reg1[2]) + 
				  $unsigned(reg1[3]) +
				  $unsigned(reg1[4]) +
				  $unsigned(reg1[5]) +
				  $unsigned(reg1[6]) +
				  $unsigned(reg1[7]) +
				  $unsigned(reg1[8]) +
				  $unsigned(reg1[9]) +
				  $unsigned(reg1[10]);

always @(posedge clk) begin
	if (aclr) begin
		reg1 <= 0;
		sum1 <= 0;
		sum2 <= 0;
		sum3 <= 0;
		sum4 <= 0;
	end
	else begin
		reg1 <= {reg1[9:0], data};	//сэмплируем входные данные
		
		//способ 1
		if (~LED1) 
			for (i = 0; i < DATA_BW; i = i+1) 
				if (reg1[i] == 1'b1) sum1 <= sum1 + 1'b1;
		
		//способ 2	
		sum2 = 0;
		for (i = 0; i < DATA_BW; i = i+1)
			sum2 = sum2 + reg1[i];

		//способ 3
		if (~LED3) sum3 <= sum3 + reg1[0];
		
		//способ 4
		sum4 <= mem_table[reg1];
	end
end

endmodule